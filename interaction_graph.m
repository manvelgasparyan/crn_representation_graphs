function [F, pF] = interaction_graph (S, v)
   %---
   %The number of species and reactions
   [n_s,n_r] = size(S);
   %---
   %The vector of species concentrations
   x = sym('x', [n_s 1]);
   assume(x, 'positive')
   %---
   %Create a directed bipartite graph
   F = digraph();
   %---
   %Add vertices for species
   for i = 1:n_s
       F = addnode(F, ['S_{', num2str(i), '}']);
   end
   %---
   %Maximum number of edges
   n_e = n_s * n_r; 
   %Initialize edges matrix  
   edges = zeros(n_e, 2); 
   %Counter for the number of edges added
   edge_count = 0;
   %Iterate over the matrix S
   for i1 = 1:n_s
       for i2 = 1:n_s
           for j = 1:n_r
               if any(S(i2, :) ~= 0 & diff(v, x(i1)) ~= 0)
                  edge_count = edge_count + 1;
                  edges(edge_count, :) = [i1, i2]; 
               end
           end          
       end
   end
   %Remove excess rows if not all edges are used
   edges = edges(1:edge_count, :);
   edges = unique(edges, 'rows');
   %---
   %Add the edges to the graph
   for i = 1:size(edges, 1)
       source_node = edges(i, 1);
       target_node = edges(i, 2);
       F = addedge(F, source_node, target_node); 
   end
   %---
   figure(2)
   pF = plot(F);
   pF.EdgeFontSize = 7; 
   %Remove the initial labels
   pF.NodeLabel = {};
   %Set label positions manually
   for i = 1:numel(pF.XData)
       text(pF.XData(i), pF.YData(i), F.Nodes.Name{i}, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle');
   end
   %Customize the appearance of species
   highlight(pF, 1:n_s, 'NodeColor', [0.0 0.6 1.0], 'Marker', 'o', 'MarkerSize', 20);
   %Customize the appearance of edges
   set(pF, 'EdgeColor', [0, 0, 0], 'LineWidth', 1, 'ArrowSize', 5, 'EdgeAlpha', 1);
   %---
end
