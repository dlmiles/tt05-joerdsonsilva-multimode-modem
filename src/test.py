import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, Timer, ClockCycles
import os
import re
from cocotbutil import *


GL_TEST = 'GL_TEST' in os.environ

###
# Signals not to touch for ensure_resolvable()
#
# Signals we are not interested in enumerating to assign X with value
ensure_exclude = [
    #r'[\./]_',
    r'[A-Za-z0-9_\$]_[\./]base[\./][A-Za-z0-9_\$]+$',
    r'[\./]FILLER_',
    r'[\./]PHY_',
    r'[\./]TAP_',
    r'[\./]VGND$',
    r'[\./]VNB$',
    r'[\./]VPB$',
    r'[\./]VPWR$',
    r'[\./]CLK$',
    r'[\./]CLK_N$',
    r'[\./]DIODE$',
    r'[\./]GATE$',
    r'[\./]NOTIFIER$',
    r'[\./]RESET$',
    r'[\./]RESET_B$',
    r'[\./]SET$',
    r'[\./]SET_B$',
    r'[\./]SLEEP$',
    r'[\./]UDP_IN$',
    # sky130 candidates to exclude: CLK CLK_N GATE NOTIFIER RESET SET SLEEP UDP_IN
    r'[\./][ABCD][0-9]*$',
    r'[\./][ABCD][0-9]_N*$',
    r'[\./]pwrgood_',
    r'[\./]ANTENNA_',
    r'[\./]clkbuf_leaf_',
    r'[\./]clknet_leaf_',
    r'[\./]clkbuf_[\d_]+_clk',
    r'[\./]clknet_[\d_]+_clk',
    r'[\./]net\d+[\./]',
    r'[\./]net\d+$',
    r'[\./]fanout\d+[\./]',
    r'[\./]fanout\d+$',
    r'[\./]input\d+[\./]',
    r'[\./]input\d+$',
    r'[\./]hold\d+[\./]',
    r'[\./]hold\d+$'
]
ENSURE_EXCLUDE_RE = dict(map(lambda k: (k,re.compile(k)), ensure_exclude))

def ensure_exclude_re_path(path: str, name: str):
    for v in ENSURE_EXCLUDE_RE.values():
        if v.search(path):
            #print("ENSURE_EXCLUDED={}".format(path))
            return False
    return True




@cocotb.test()
async def test_modem(dut):
    dut._log.info("start")
    clock = Clock(dut.clk, 2000, units="us")
    cocotb.start_soon(clock.start())

    await ClockCycles(dut.clk, 4) # show startup X state in VCD
    dut.clk.value = 0
    dut.rst_n.value = 0
    dut.ena.value = 0
    dut.ui_in.value = 0
    dut.uio_in.value = 0
    await ClockCycles(dut.clk, 4) # show propagation of quiescent inputs in VCD

    if GL_TEST and 'RANDOM_POLICY' in os.environ:
        await ClockCycles(dut.clk, 1)		## crank it one tick, should assign some non X states
        if os.environ['RANDOM_POLICY'] == 'zero' or os.environ['RANDOM_POLICY'].lower() == 'false':
            ensure_resolvable(dut, policy=False, filter=ensure_exclude_re_path)
        elif os.environ['RANDOM_POLICY'] == 'one' or os.environ['RANDOM_POLICY'].lower() == 'true':
            ensure_resolvable(dut, policy=True, filter=ensure_exclude_re_path)
        else: # if os.environ['RANDOM_POLICY'] == 'random':
            ensure_resolvable(dut, policy='random', filter=ensure_exclude_re_path)

    await ClockCycles(dut.clk, 1)		## crank it one tick, should assign updated states above

    # reset
    dut._log.info("reset")
    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 500)
    await Timer(200, units="us")

    dut.rst_n.value = 1
    await ClockCycles(dut.clk, 1200)

    dut.ui_in <= 0b00
    await ClockCycles(dut.clk, 500)

    dut.ui_in <= 0b01
    await ClockCycles(dut.clk, 2100)

    dut.ui_in <= 0b10
    await ClockCycles(dut.clk, 2100)

    dut.rst_n.value = 0
    await ClockCycles(dut.clk, 500)

    dut.rst_n.value = 1
    await ClockCycles(dut.clk, 300)

    dut.ui_in <= 0b11
    await ClockCycles(dut.clk, 2000)

    dut.ui_in <= 0b00
    await ClockCycles(dut.clk, 500)

