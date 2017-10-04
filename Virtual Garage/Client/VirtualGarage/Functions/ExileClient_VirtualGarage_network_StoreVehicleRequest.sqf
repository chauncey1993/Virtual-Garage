/*

 	Name: ExileClient_VirtualGarge_StoreVehicleRequest.sqf
 	Author(s): Shix
    Copyright (c) 2016 Shix
 	Description: Handles the client Storing a vehicle in the virtual garage.

*/
private ["_display","_uid","_vehicleLimit","_storedVehiclesCount","_NearByVehiclesList","_selectedSel","_VehNetId"];
disableSerialization;
_display = uiNameSpace getVariable ["VirtualGarageDialog", displayNull];
_uid = getPlayerUID player;


_vehicleLimit = 10;


_storedVehiclesCount = count StoredVehicles;

if (_storedVehiclesCount < _vehicleLimit) then {
  _NearByVehiclesList = _display displayCtrl 1501;
  _selectedSel = lbCurSel _NearByVehiclesList;
  _VehNetId = _NearByVehiclesList lbData _selectedSel;
  ["StoreVehicleRequest",[_VehNetId,_ownerUID]] call ExileClient_system_network_send;
}
else
{
  (findDisplay 0720) closeDisplay 0;
  ["Whoops",[format["You Already Have Too Many Vehicles For Your Flag Level"]]] call ExileClient_gui_notification_event_addNotification;
}
