import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, Timer, ClockCycles


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

