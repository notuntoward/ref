---
created date: 2025-01-05T19:10:40-06:00
modified date: 2025-01-26T09:57:21-08:00
---

My understanding, which might be wrong: Th under-the-cabinet bulbs were originally halogen, driven by a transformer being fed by a 120V plug which was controlled by a wall light switch.  Then that light switch was made dimmable, and I *think* this did not work.  Then the halogens were replaced with LED's (Feit G4 1.5W 12VAC dimmable) and it kinda works: flashes when dimmer switch is high.

What I think the problem is, is that the original transformer doesn't work, or barely works. Nothing on it says that it accepts dimmable input; The labels say it expects 120 AC household current.

- [x] Some LEDs work, some don't.  Why?  *Answer*: working ones are 120V pucks, direct to dimmer switch; non-working fed by step-down transformer
- [x] Verify that the halogens don't work if dimmed.  *Done*: Kris told me
- [x] skim [[Poplawski12dimmingLEDs|Poplawski12: Dimming LED sources: what’s  working and what still needs  fixing]], find out how dimmers work

# The Fix

## Best Fix?

1. Keep the new LED-compatible Lutron sliding wall dimmer?
   (*on 1/25/25, they said they didn't like that the new dimmer slider was on the opposite side of where the original non-LED dimmer had it; I suggested they reinstall the original, since I'd guess that the new "dimmable" converter below will handle the old one fine*)
2. replace transformer with "dimmable" 120 VAC to 12 VDC converter
3. replace LED's with 12 VDC models. Apparently, there are LEDs like this that are "dimmable"
## Fix Candidates

### Replace transformer?

Replace the transformer with one with the following ideal attributes:
- 120 VAC input (which can be dimmed)
- 120 VAC has a wall plug, connected to the transformer with standard lamp cord
- 12 VAC output which is dimmed somehow, corresponding to the input dimming
- 12 VAC output has some way of making a bus, so it can feed 6 or so LEDs
#### Possible transformer replacements
- [RL12-75A Hatch Electronic Transformer 75W 12V](https://ballastshop.com/rl12-75a-hatch-led-halogen-transformer-75w-120v-12vac-dimmable/)
	- $15
	- has only bare wires going in and out
	- so need a junction box to make the 120V AC input connection (lamp cord goes out of the box?)
	- [x] ? how do you get lamp cord to go out of a junction box. *No need*
	- [ ] ? how do you make a low voltage bus while obeying code?
	- [ ] ? Is this really compatible with a phase cut transformer, like the Lutron LED+ togglers Kris & Mary bought?
- [60W Dimmable Driver Transformer 110 VAC - 12V 5A DC Electric Dimming LED Power Supply Compatible with Lutron and Leviton dimmer for LED Strip Lights, ETL List - Amazon.com](https://www.amazon.com/60W-Dimmable-Driver-Transformer-110/dp/B08131KQL8)
	- 12 V DC output, compatible with lutron/Levitron Dimmer
	- would need to convert to bulbs to 12 V DC (they're currently 12 V AC)
		- said to be compatible with LED strips, modules, light bars, puck, and other LED accent lights
	- [ ] ? what/where is it dimmable?  Really from Lutron wall switch?
- [Dimmable Wall Plug-In Electronic Transformers - LTF Technology](https://ltftechnology.com/dimmable-plug-in-electronic-transformers-led-halogen-lighting/): many models, AC or DC output, dimmable
	- [ ] ? What is "dimmable?" How?
## Replace Dimmer?
- [Tutorial: Phase Dimming - Ozuno](https://ozuno.com/blog/phase-dimming-a-tutorial/)[Tutorial: Phase Dimming - Ozuno](https://ozuno.com/blog/phase-dimming-a-tutorial/)
- [Problems with dimming on 120V side of transformer](https://www.quora.com/Can-I-put-a-dimmer-on-the-110v-side-of-a-transformer-to-reduce-the-12v-output-and-dim-LED-lights)
- [12VAC Dimmer, Electrical Box Mount, Decora Plate - YardBright® Landscape Lighting](https://yardbright.com/12vac-dimmer/). Expensive, pointless?
- yet there are apparently "dimmable" 120 VAC to 12 VDC transformers ([[#Possible transformer replacements|Possible transformer replacements]])
## Replace LED bulbs?

- Many "dimmable" 110-12V transformers, but they're 12 V AC, not DC.  
- 120 VAC LED pucks are plentiful, but would require household wiring, since the LEDs that don't work are fed with 12 V wires that would have to be replaced.
- If swapped to a 12 V DC "dimmable" transformer, then could keep those wires, and still dim them with Lutron wall dimmer.
- ? Dimmable?  [G4 Led Bulb 2W, Warm White 3000K,AC/DC12V-24V 1505 COB Led Light Bulbs Equivalent to 20W T3 JC Type Bi-Pin G4 Base Halogen Bulb,6-Pack - Amazon.com](https://www.amazon.com/Dimmable-DC12V-24V-Equivalent-Halogen-Cabinet/dp/B09V54GG2K?sr=8-4)
- ? Dimmable? [Dimmable G4 LED Bulb 12V 24V JC Tybe, 20-30W T3 G4 Halogen Equivalent,2700K Warm White, G4 Bi-Pin Base, 300LM, Chandelier Lighting/Landscape Lighting/Microwave Lighting 10pcs - Amazon.com](https://www.amazon.com/Dimmable-Equivalent-Chandelier-Landscape-Microwave/dp/B09XZLYKJV?sr=8-5)