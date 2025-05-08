---
created date: 2024-10-02T18:31:46-07:00
modified date: 2024-10-03T08:12:14-07:00
---
# Rules
<mark style="background: #FF5582A6;">TODO: Read this</mark>: [Pacific Northwest Inspections Group, Bellevue WA](https://www.pnwig.com/blog-category/electrical/blogs?blog_id=gfci-afci-outlets)

- [GFCI also required in unfinished basement and garage](https://www.pnwig.com/blog-category/electrical/blogs?blog_id=gfci-afci-outlets).  NEC 210.8.  Additionally, kitchen dishwasher branch circuit and for all receptacle outlets in bathrooms, crawl spaces,  kitchen countertops, laundry areas, boathouses, outdoors and within 6 feet of sinks, bathtubs, and shower stalls
- **> 100 A box?**  [Article w/ animation](https://www.evernote.com/l/AA11OJqevqpMVL7ZcP-7sG9/) showing how appliance amperage requirements stack up, causing code to require you to need more than 100A (I've copied a jpeg of it below).  Smart Breaker might allow more appliances + EV w/ only 100A ^288763
# Code source
- Codes cited here: [Electrical Code - SDCI | seattle.gov](https://www.seattle.gov/sdci/codes/codes-we-enforce-%28a-z%29/electrical-code)
	- NEC 2020 electrical code
		- [[NEC_Electrical_Code_NFPA_70_2020.pdf]]
		- This was updated in 2023, Seattle still cited the 2020 version
		- online versions (not pdfs)
		- [NFPA National Electric Code (NEC) 2020](https://link.nfpa.org/free-access/publications/70/2020)
		- [NFPA National Electric Code (NEC) 2023](https://link.nfpa.org/free-access/publications/70/2023) 
	- [2020 Seattle Electrical Code Replacement Pages](obsidian://open?vault=Obsidian%20Share%20Vault&file=House%20Rewire%2Fattachments%2F2020SeattleElectricalCodeReplacementPages.pdf)
	- [2020 Seattle Electrical Code Quick Reference](obsidian://open?vault=Obsidian%20Share%20Vault&file=House%20Rewire%2Fattachments%2F2020SeattleElectricalCodeQuickReference.pdf)
	- [Tip 317, Smoke Detectors in Residences and Family Day Care Homes](obsidian://open?vault=Obsidian%20Share%20Vault&file=House%20Rewire%2Fattachments%2FTip317SmokeDetCam317.pdf) ^nku0nxg00
	- T[ip 339, Emergency and Standby Power Systems](obsidian://open?vault=Obsidian%20Share%20Vault&file=House%20Rewire%2Fattachments%2FTip339emergencyStandbyCam339.pdf)

# Inspection Rules
- WA inspection tips
   - [lni.wa.gov/licensing-permits/\_docs/residentialchecklist.pdf](https://lni.wa.gov/licensing-permits/_docs/residentialchecklist.pdf)

# Wires 
## Wire Types
- [ ] **20 A** requires **12 G** ([guy says about NEC rqts](https://qr.ae/pKUx3S))
- [ ] **15 A** can be **15G** (can be 20G, I think I remember, but must be consistent)
## Wire Color Conventions

Also see [[Color-Coding of Electrical Wires and Terminal Screws]]
- **U.S. Electrical Wiring Color Codes**

In the United States, the following color codes are typically used for power wires in "branch circuits," the wiring between the last protective device (such as a circuit breaker) and the load (such as a tool or appliance).

- **120/208/240 Volt AC Wire Colors (from [here](https://resources.duralabel.com/articles/wire-color-coding))**
These systems are common in home and office environments.

- Phase 1 - Black
- Phase 2 - Red
- Phase 3 - Blue
- Neutral - White
- Ground - Green, Green with Yellow Stripe, or Bare Wire

If the wiring system has one phase at a higher voltage than the others, using a "high-leg" connection, that phase's wires should be marked with orange. (This is required in NEC article 110.15.) However, these high-leg delta systems are uncommon with newer installations.

# Breaker rules (from Basic Wiring Sunset Book)

-     separate 20A circuit for washer (dryer can be plugged into this too (says Seattle electrical inspector when I did kitchen))

-     13 receptacles on 20A general circuit

-     10 lights on 15A lighting circuit

-     Bathrooms must be on their own 20A ckt.  (sez Seattle inspec.)  bathrooms can be tied together.
- [AFCI required almost everywhere](obsidian://open?vault=Obsidian%20Share%20Vault&file=House%20Rewire%2Fattachments%2Fafci-and-gfci-requirements-by-state-dec2020.pdf):
	- Family Rooms, Dining Rooms, Living Rooms, Parlors,  Libraries, Dens, Sunrooms, Recreation Rooms,  Closets, Hallways and Similar Rooms or Areas AND Kitchen and Laundry Areas 
- GFCI. [Does mirror light have to be GFCI?](obsidian://open?vault=Obsidian%20Share%20Vault&file=House%20Rewire%2Fattachments%2Fafci-and-gfci-requirements-by-state-dec2020.pdf) ^eea42e
	- GFCI protection is not required for a fire alarm system in a garage or unfinished basement. The receptacle and cover plate must be red and labeled. All fixed electrical equipment with exposed grounded metal parts within an enclosed shower area or within five feet of a bathtub must have GFCI protection.  Cities might have separate electrical ordinances but must be at least as stringent as the State. 
- Outdoor outlets [don't have to be on a dedicated circuit](https://www.quora.com/Do-outdoor-outlets-need-to-be-on-their-own-circuit#:~:text=No%2C%20they%20don't.,GFCI%2C%20and%20a%20weatherproof%20cover.)
# Load Calculations

From: Article 220 Branch-Circuit, Feeder, and Service Load Calculations in [NFPA National Electric Code (NEC) 2020](https://link.nfpa.org/free-access/publications/70/2020)
- load calcs are based on floor area: for dwellings, doesn't include garages, open porches or unfinished spaces (220.11)
- 220.14 A-M determines non-illumination receptacles
	- [ ] (A) specific appliance outlets load not covered in other sections comes from the appliance's ampere rating
	- [x] (B) Outlet supply "luminaire": the max VA rating.  But I don't think I have any of these special purpose outlets.
	- [ ] (H) Fixed multioutlet assemblies other than dwelling units...  Does this apply?
	- [ ] (I) Boils down to 90 VA per plugin, unless the outlet is single, by itself, in which case it's 180 VA
	- [ ] (J) min load for dwellings is 33 VA/m^2 (3 VA/ft^2).  No extra calcs needed for all outlets <= 20A, including those in 210.11 (C)3 (bathroom) and 210.11(C) 4 (garage)
- [ ] 220.54: an electric clothes dryer would be additional, I think, and would add 5k VA

So, I guess it's 3 VA/ft^2 for me.  
- From [here](https://www.thespruce.com/calculate-safe-electrical-load-capacities-1152361), it seems that NEC really means just volts times amps.
- So, *one phase* provides 120V * 100 A (main breaker) = 12 KVA
- basement area is ~ BA = [21 x 31]([Basement Wiring](onenote:https://d.docs.live.net/4bbd96b3698748f8/Documents/OneNote%20Notebooks/Scott's%20Notebook/House.one#Basement%20Wiring&section-id={6F22C67C-5080-4F4C-B55A-DD060731E1AA}&page-id={5D945FBE-5BF8-4A33-AB97-46F3C2F82FAF}&end) = 651 ft^2
- so living area is way less than 2*BA = 1302 ft^2
- so min VA I can consider is 3 VA/ft^2 x 1302 ft^2 = 3906
- <mark style="background: #BBFABBA6;">So I'm OK w/ total load, especially since I have two phases</mark>
- [ ] any reason to use 2nd phase?

# Receptacle and Protection Requirements
- [ ] 210.11 (C)
	- [x] Small-appliance: the 2 20A ckts in kitchen
	- [ ] Laundry: need a 20A laundry outlet
	- [ ] Bathroom: at least one 20A ckt, dedicated to the socket only.  Can't share w/ other outlets, I think.  Says exceptions are 210.23, which says that bathrooms 20A outlet can supply only that outlet
	- [ ] Garage: must have a dedicated 20A branch supplying garage outlets (I think mine are 15).  But nearby outdoor receptacles are allowed
- [ ] 210.12 (A) AFCI: pretty much all 15 and 20A ckts need AFCI in a dwelling.  Many options
	- [ ] 1: the AFCI can protect the whole branch
	- [ ] 2: installed in the first outlet of the protected circuit (must mark)
	- [ ] 3-6: complicated
	- [ ] NEC exception: don't have to supply AFCI to fire alarm. (smoke detector?) ^43ae18
- [ ] This guy's plan
      From: [Where Should We Be Using Dual Function Breakers? - YouTube](https://www.youtube.com/watch?v=eVyLSkEN908)
	- [ ] Rules (in 2013)
		- [ ] AFCI: [NEC 210.12 B](https://youtu.be/eVyLSkEN908?t=227) Rooms (and similar):
		      [[477dd7edd6cd33a21d6a7633b121e83c_MD5.jpeg|Open: Pasted image 20231211184432.png]] 
		      ![[477dd7edd6cd33a21d6a7633b121e83c_MD5.jpeg|House Rewire/attachments/477dd7edd6cd33a21d6a7633b121e83c_MD5.jpeg]] ![[f7cde98848e61179594c039aa66fd761_MD5.jpeg|Open: Pasted image 20231211184730.png]]
			- his plan is to just AFCI everything
			- [AFCI on lighting is required](https://plumblineservices.com/help-guides/are-arc-fault-breakers-required-on-lighting-circuits#:~:text=But%20according%20to%20NEC's%20definition,on%20your%20circuit%20are%20located.)
			- **Not required** (he says, in 2013) but he still says "everything"
				- bathrooms
				- garages
				- outdoors
		- [ ] GFCI: [NEC 210.8](https://youtu.be/eVyLSkEN908?t=227) Where required in dwelling units.
			- [ ] he does everything in kitchen as dual GFCI and AFCI.  Now
			- [ ] anything in laundry area
			- [ ] dedicated outlets don't have to be GFCI: fridge, microwave, etc.
	- [ ] Rules of thumb
		- [ ] Classify runs as AFCI first, then GFCI: when both, buy a dual breaker
		- [ ] don't locally GFCI stuff that's hidden e.g. a [fridge](https://www.quora.com/Is-it-okay-if-a-refrigerator-isnt-on-a-GFCI#:~:text=A%20dedicated%20outlet%20in%20the,GFCI%20protected%20%2D%20no%20fridge%20exemption.), so don't need to move fridge to clear fault
		- [ ] prefers dual so debug faults in one place (panel)
		- [ ] olden days: local GFCIs still didn't work great w/ breaker AFCI


# Smoke and CO alarms
### Requirements
From: [Tip 317, Smoke Detectors in Residences and Family Day Care Homes](obsidian://open?vault=Obsidian%20Share%20Vault&file=House%20Rewire%2Fattachments%2FTip317SmokeDetCam317.pdf) ^nku0nxg00
- Where required
	- Smoke
		- each bedroom, adjacent hallway, >=1 on each floor
			- top hall
			- ground hall
			- basement
	- CO
		- outside of each bedroom and >= 1 on each floor
			- top hall
			- ground all
			- basement
- also ![[#^43ae18|^43ae18]]
### What to buy
- Combined smoke + CO
	- Basement
	- Ground Hall
	- Top Hall
- Smoke detector
	- Office
	- Upper E Bedroom
	- Upper W Bedroom
### Tips
From: [[smokeDetectorHowToWire.pdf]]
	- old work boxes, one for each smokedet
	- connect 1st smoke det to power
		- can tap off lighting, plugs, etc.
		- if make dedicated ckt, it has to be AFCI, but above, other stuff says you don't have to
		- seems like tapping it off would be the simplest.
		- [ ] pick a circuit that will be noticeably off it it trips (I think)
	- daisy chain to rest of smoke dets
	- 12 or 14 G cable, 2 wire to 1st (why 2?); 3 wire to rest
### Best Route: dedicated plain 15A breaker to basement SMCO

^4339ff

- minimal advantage to picking power off a 15A light circuit instead of a dedicated breaker
	- daisy chaining means all must be connected through whole house
	- breaker doesn't have to be AFCI so can reuse an old 15 A one
- advantages to dedicated circuit
	- simplicity: isolated from other wiring problems, circuit very simple
	- warning of problem w/ smoke det ckt could still come from battery back up
	- single circuit means you can really shut them off
	- I could use my leftover 14 G wire, if I have any
# General Room Wiring (kitchen and bathroom have separate rules, I think)

^s106mj
- [ ] I have to add some outlets!  *Number* of outlets in a room determined by "one outlet every 6' rule" The 6' goes around corners, and restarts at breaks like doors and cabinets.  Going around the circumference tells me the # of outlets needed in a room.
	- From: [2020 Seattle Electrical Code Replacement Pages](obsidian://open?vault=Obsidian%20Share%20Vault&file=House%20Rewire%2Fattachments%2F2020SeattleElectricalCodeReplacementPages.pdf)
		- Receptacle Outlets in Fixed Walls. The required *number* of receptacle outlets shall be determined in accordance with 210.52(A)(1) through (A)(4). These receptacle outlets shall be permitted to be *located as determined by the installer*, designer, or building owner.  
	- From: - [NFPA National Electric Code (NEC) 2020](https://link.nfpa.org/free-access/publications/70/2020)
		- 210.52 (A) (1) though (A) (4): Receptacles every 6' of "unbroken" wall space.  Breaks: doors, fireplaces, cabinets w/o countertops, etc.
> 				- Any space 600 mm (2 ft) or more in width (including space measured around comers) and unbroken along the floor line by doorways and similar openings, fireplaces,and fixed cabinets that do nothave countertops or similar work surfaces
> 			- 210.52 (A): at least one receptacle every unbroken 10': neither hallway is long or unbroken enough to need a receptacle
# Unfinished basement
- From: [2020 Seattle Electrical Code Replacement Pages](obsidian://open?vault=Obsidian%20Share%20Vault&file=House%20Rewire%2Fattachments%2F2020SeattleElectricalCodeReplacementPages.pdf)
	- [x] I'm fine with only one outlet: At least one outlet in each "separate unfinished portion of a basement" 
- [ ] From: [2020 Seattle Electrical Code Quick Reference to Seattle changes to 2020 NEC](obsidian://open?vault=Obsidian%20Share%20Vault&file=House%20Rewire%2Fattachments%2F2020SeattleElectricalCodeQuickReference.pdf)
	- nonmetalic cable must go through joist holes
	- non-metallic-sheathed cable on walls must be in listed conduit or tubing
	- need insulated bushing
	- cable secured within 12" of where it enters conduit
	- conduit, tubing and *metal* boxes must be grounded
- [ ] Washing machine needs dedicated 20 A GFCI
- [ ] Laundry room needs dedicated 20 A GFCI
- [ ] Can't route cables through a cold air plenum:  [NEC 300.22(B)](https://www.electricallicenserenewal.com/Electrical-Continuing-Education-Courses/NEC-Content.php?sectionID=276.0#:~:text=In%20NEC%C2%AE%20300.22(B,air%20contained%20inside%20the%20duct.) (not the wiring handbook, but some other NEC thing) said, starting in 2017 that "_(1) The wiring methods or cabling systems shall be permitted only if necessary to connect to equipment or devices associated with the direct action upon or sensing of the contained air, and_..." Also, 
- [ ] But many say it's OK to go through a plenum perpendicularly.  e.g [here](https://forum.nachi.org/t/romex-in-return-air-plenum/173116/12):
	 Exception to 300.22
> Quote:
> Exception: This section shall not apply to the joist or stud spaces of dwelling units where the wiring passes through such spaces perpendicular to the long dimension of such spaces.
> 
> In a dwelling unit any type of wiring method may pass perpendicular through this type of duct made from joist or stud spaces.

- [ ] From here, these kinds of cables are allowed to go in a plenum (a.k.a. "air handling space"):
	      ![[Wiring Rules-20231211140100715.webp|540]]
# Crawl Spaces
- From: [2020 Seattle Electrical Code Replacement Pages](obsidian://open?vault=Obsidian%20Share%20Vault&file=House%20Rewire%2Fattachments%2F2020SeattleElectricalCodeReplacementPages.pdf)
	- README
- From: [2020 Seattle Electrical Code Quick Reference to Seattle changes to 2020 NEC](obsidian://open?vault=Obsidian%20Share%20Vault&file=House%20Rewire%2Fattachments%2F2020SeattleElectricalCodeQuickReference.pdf)
	- ok to put cables on lower joist edge (or bore holes)
	- must remove unused conductors or tagged and terminated at both ends