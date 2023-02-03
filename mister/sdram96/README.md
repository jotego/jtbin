# JTSDRAM

Checks the sanity of the SDRAM module on MiST and MiSTer systems

# Compilation

Add the **JTFRAME** git submodule following the standard procedure. Read the
README file in it to learn about how to compile JTFRAME projects in general.

In summary, you will need to be doing this from a linux workstation and from
the project root folder type:

```
. setprj.sh
jtcore sdram
```

That is all

# Usage

The FPGA will constantly fill the first 8MB of each memory bank with pseudorandom
data at a fast pace, but without bank interleaving. Then it will read it back
at full speed; that means 96MB/s at 48MHz operation. It will stop during vertical
blanking to issue autorefresh commands. Each memory filling is checked four times.
Then a new round begins.

If a problem occurs, the screen will turn red, the LED will blink and a high
pitch tone will replace the normal one. If only part of the screen turns red,
it means that the problem only occured in one bank.

# Simulation

Use the macro **ONEBANK** to simulate only with a single bank. This speeds up
simulation.

# Support

The *jotego* nickname had already been used by other people so on some networks
you will find me as *topapate*.

Contact via:
* https://twitter.com/topapate
* https://github.com/discord

You can show your appreciation through
* Patreon: https://patreon.com/jotego
* Paypal: https://paypal.me/topapate

