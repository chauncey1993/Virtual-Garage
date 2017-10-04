/*

 	Name: ExileClient_VirtualGarage_network_GetStoredVehicles.sqf
 	Author(s): Shix
    Copyright (c) 2016 Shix
 	Description: Sends a network request for stored vehicles
*/
private ["_Userid"];
_Userid = getPlayerUID player;
["GetStoredVehiclesRequest",[_Userid]] call ExileClient_system_network_send;
