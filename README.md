![](../../workflows/gds/badge.svg) ![](../../workflows/docs/badge.svg) ![](../../workflows/wokwi_test/badge.svg)

# Project testing (reset handling diagnostic)

This project exists as a fork of the original upstream https://github.com/joerdsonsilva/tt05-multimode-modem

This is a demonstration on the steps in debugging and validating reset behaviour concerns
(even in project after microchip ASIC/IC production).

The final repository represents the belt-and-braces (pessimistic / defensive) approach
to correction. 
The 4 major reset areas added should be individually tested for all
15 possible combinations, to find out the minimum change needed to
observe expected (correct) circuit outcome.

The method is like a game, all of these modes of usage should result in the
exact same output waveforms.

```
# Maybe install oss-cad-suite and add to $PATH for the necessary tooling
cd src

# pre-synth simulation testing
GL_TEST=true make
GL_TEST=true RANDOM_POLICY=false  make
GL_TEST=true RANDOM_POLICY=true   make
# Running 'random' 10s or 1000s of times is better
GL_TEST=true RANDOM_POLICY=random make

# post-synth GL_TEST modes (note the gate_level_netlist.v in the repo is the
# actual manufactured netlist which does not always output expected data)
GL_TEST=true make GATES=yes
GL_TEST=true RANDOM_POLICY=false  make GATES=yes
GL_TEST=true RANDOM_POLICY=true   make GATES=yes
# Running 'random' 10s or 1000s of times is better
GL_TEST=true RANDOM_POLICY=random make GATES=yes
```

# Multimode Modem

<div align="justify">
  The multimode modem uses a clock signal to generate digitized signals over time, in sinusoidal format. From this digitized sinusoid, the modulation process is applied using different methods for each scheme, implemented through specific internal blocks to perform modulations ASK (switching the amplitude of the sine wave), FSK (switching the frequency of the sine wave through a digital signal modulator) and PSK (phase coding). In the demodulation stage, these three modulation schemes are analyzed to recover the original information, manifesting as '0' or '1' values that reflect the data signal already restored after the process.
  </div>

## Inputs and Outputs

  The multimode modem has the following inputs and outputs:
     
| Type   | Function      | Size     |
|--------|---------------|----------|
| Input  | clock         | 1 bit    |
| Input  | reset         | 1 bit    |
| Input  | sel           | 2 bits   |
| Output | mod_out       | 7 bits   |
| Output | demod_out     | 1 bit    |

## How to Test

<div align="justify">
Apply a clock of 40~50 MHz. Next, apply a “1” logic level “reset” signal to synchronize the modem system and then make the “reset” signal a “0” logic level. Then select the type of modulation to be used, according to the sequence below. After selecting the modulation type, the modulated signal is expressed at the “mod_out” output and the demodulated signal at the “demod_out” output.
  </div>

 - Sel = "01" <= ASK modulation and demodulation
    
    ![01](https://github.com/joerdsonsilva/tt05-multimode-modem/assets/75455785/1acb1f2a-ad28-414d-ab8e-93733e423582)
    
 - Sel = "10" <= FSK modulation and demodulation

   ![10](https://github.com/joerdsonsilva/tt05-multimode-modem/assets/75455785/3f904341-be24-4f8a-ab3d-aaa245806197)

 - Sel = "11" <= PSK modulation and demodulation

   ![11](https://github.com/joerdsonsilva/tt05-multimode-modem/assets/75455785/8e891f61-76d3-4adf-8009-26fa9175b915)

