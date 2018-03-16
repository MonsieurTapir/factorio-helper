# Factorio Helper

Production chain and factories requirements computation for Factorio recipes 

## Getting Started
```
ruby factorio_helper <recipes_file> recipe (<target_rate>)
```

## Example
Command line :
```
ruby factorio_helper recipes "science pack 3" 1.0
```
Output : 
```
------------------------------------------------------------------------
Computing factories requirements for 1.0 science-pack-3 per second
------------------------------------------------------------------------
> science-pack-3 : 16.0 factories
	> advanced-circuit : 8.0 factories
		> electronic-circuit : 1.33 factories
			> iron-plate : 3.5 factories
			> copper-cable : 2.0 factories
				> copper-plate : 5.25 factories
		> plastic-bar : 0.8 factories
		> copper-cable : 1.33 factories
			> copper-plate : 3.5 factories
	> engine-unit : 13.33 factories
		> steel-plate : 8.75 factories
			> iron-plate : 8.75 factories
		> iron-gear-wheel : 0.67 factories
			> iron-plate : 3.5 factories
		> pipe : 1.33 factories
			> iron-plate : 3.5 factories
	> electric-mining-drill : 2.67 factories
		> electronic-circuit : 2.0 factories
			> iron-plate : 5.25 factories
			> copper-cable : 3.0 factories
				> copper-plate : 7.88 factories
		> iron-gear-wheel : 3.33 factories
			> iron-plate : 17.5 factories
		> iron-plate : 17.5 factories
-----------------------------------------------------------------------------
Total factories requirements (rounded up) for 1.0 SCIENCE PACK 3 per second
-----------------------------------------------------------------------------
1 chemistry plant producing PLASTIC BAR
16 crafting machines producing SCIENCE PACK 3
8 crafting machines producing ADVANCED CIRCUIT
4 crafting machines producing ELECTRONIC CIRCUIT
7 crafting machines producing COPPER CABLE
14 crafting machines producing ENGINE UNIT
4 crafting machines producing IRON GEAR WHEEL
2 crafting machines producing PIPE
3 crafting machines producing ELECTRIC MINING DRILL
60 furnaces producing IRON PLATE
17 furnaces producing COPPER PLATE
9 furnaces producing STEEL PLATE
```




