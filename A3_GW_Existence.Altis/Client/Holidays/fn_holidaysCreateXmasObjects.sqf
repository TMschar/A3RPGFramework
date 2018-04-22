/**
 * Filename: fn_holidaysCreateXmasObjects.sqf
 */

// Santa
// {
//     GW_world_xmasFellow = createSimpleObject [(GW_MISSION_ROOT + "mas\models\bonhomme.p3d"), [0, 0, 0]];
//     GW_world_xmasFellow setPosATL _x;
// } forEach [
//     [7277.73, 7861.47, 0.00141907],
//     [8000.32, 10228.7, 0.00143433]
// ];

// Icebear
// {
//     GW_world_iceBear = createSimpleObject [(GW_MISSION_ROOT + "mas\models\ours.p3d"), [0, 0, 0]];
//     GW_world_iceBear setPosATL _x;
// } forEach [
//     [7717.97,3412.21,0.00143862],
//     [7201.22, 7903.66, 0.00137329]
// ];

// Santa statue
{
    GW_world_santaStatue = createSimpleObject [(GW_MISSION_ROOT + "mas\models\pere.p3d"), [0, 0, 0]];
    GW_world_santaStatue setPosATL _x;
} forEach [
    [8012.53, 9880.66, 0.0014286],
    [7219.2, 7939.69, 0.00144958]
];

// Christmas tree
{
    GW_world_christmasTree = createSimpleObject [(GW_MISSION_ROOT + "mas\models\sapin.p3d"), [0, 0, 0]];
    GW_world_christmasTree setPosATL _x;
} forEach [
    [7735.15, 3374.89, 0.00143433],
    [7244.21, 7930.83, -0.000305176]
];

// Sleigh
// {
//     GW_world_xmasSleigh = createSimpleObject [(GW_MISSION_ROOT + "mas\models\train.p3d"), [0, 0, 0]];
//     GW_world_xmasSleigh setPosATL _x;
// } forEach [
//     [8027.78, 9885.8, 0.00143433],
//     [7222.21, 7954.8, 0.158615]
// ];