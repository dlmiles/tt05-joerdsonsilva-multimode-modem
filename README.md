![](../../workflows/gds/badge.svg) ![](../../workflows/docs/badge.svg) ![](../../workflows/wokwi_test/badge.svg)

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

