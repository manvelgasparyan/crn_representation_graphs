Matlab scripts are designed to retrieve the species-reaction graph as well as the interaction graph of a chemical reaction network. There are two Matlab functions described below:

**The Species-Reactions Graph** 
This function takes the stoichiometric matrix of the chemical reaction network (CRN) as input and provides the species-reaction graph (as well as its plot) as output. The species-reaction graph is a directed bipartite graph with the first set of nodes representing the species and the second set representing the reactions. The edges are constructed as follows: if a species is in the substrate of a reaction, then there is a directed edge from the node corresponding to the species to the node corresponding to the reaction. Similarly, if a species is in the product of a reaction, then there is a directed edge from the node corresponding to the reaction to the node corresponding to the species.

**The Interaction Graph**
This function takes the stoichiometric matrix and the symbolic vector of reaction rates as inputs and provides the interaction graph (as well as its plot) as output. The interaction graph is a directed graph with nodes corresponding to the species. The edges are defined as follows: if there is a reaction that consumes or produces species 𝑗 and the rate of that reaction depends on the concentration of species 𝑖, then there is a directed edge from the node corresponding to species 𝑖 to the node corresponding to species 𝑗.

**Copyright 2017-2024 Manvel Gasparyan. sbml_reader is freely available under the GNU GENERAL PUBLIC LICENSE (Version 3, 29 June 2007).**
