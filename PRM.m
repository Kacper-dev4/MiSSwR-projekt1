function [] = PRM(img,start,goal,maxNum)

if ndims(img) == 3
img = rgb2gray(img);
end
if ~islogical(img)
img = imbinarize(img); 
end
img = ~img;
map = occupancyMap(img);


ss = stateSpaceSE2;
ss.StateBounds = [map.XWorldLimits; map.YWorldLimits; [-pi pi]];

sv = validatorOccupancyMap(ss,Map=map);
sv.ValidationDistance = 0.05;

planner = plannerPRM(ss,sv,'MaxNumNodes',maxNum);
graph = graphData(planner);

edges = table2array(graph.Edges);
nodes = table2array(graph.Nodes);

figure
show(sv.Map)
hold on
plot(nodes(:,1),nodes(:,2),"*","Color","b","LineWidth",2)
for i = 1:size(edges,1)
    % Samples states at distance 0.02 meters.
    states = interpolate(ss,nodes(edges(i,1),:), ...
                         nodes(edges(i,2),:),0:0.02:1);
    plot(states(:,1),states(:,2),"Color","b")
end
plot(start(1),start(2),"*","Color","g","LineWidth",3)
plot(goal(1),goal(2),"*","Color","r","LineWidth",3)

rng(100,"twister");
[pthObj, solnInfo] = plan(planner,start,goal);

if solnInfo.IsPathFound
    interpolate(pthObj,1000);
    plot(pthObj.States(:,1),pthObj.States(:,2), ...
         "Color",[0.85 0.325 0.098],"LineWidth",2)
else
    disp("Path not found")
end
hold off



end

