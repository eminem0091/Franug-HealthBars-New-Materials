#include <sourcemod>
#include <sdktools>
#include <zombiereloaded>

#pragma semicolon 1

new icon[MAXPLAYERS+1];
new maxvida[MAXPLAYERS+1];
new Handle:Timers[MAXPLAYERS + 1];


public Plugin:myinfo =
{
	name = "SM Health Bar Alien",
	author = "Franc1sco franug, EMINEM",
	description = "Show health Bar",
	version = "2.0",
	url = "http://steamcommunity.com/id/franug"
};

public OnPluginStart()
{
	HookEvent("player_hurt", Event_PlayerHurt);
	HookEvent("player_death", event_Death, EventHookMode_Pre);
	CreateConVar("sm_HealthBar_alien_version", "2.0", "Version", FCVAR_PLUGIN|FCVAR_SPONLY|FCVAR_REPLICATED|FCVAR_NOTIFY|FCVAR_DONTRECORD);
	
	for(new i = 1; i <= MaxClients; i++)
		if(IsClientInGame(i)) OnClientPutInServer(i);
}

public OnPluginEnd()
{
	for(new i = 1; i <= MaxClients; i++)
		if(IsClientInGame(i)) ClearIcon(i);
}

public OnMapStart()
{
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar01.vtf");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar01.vmt");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar02.vtf");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar02.vmt");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar03.vtf");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar03.vmt");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar04.vtf");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar04.vmt");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar05.vtf");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar05.vmt");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar06.vtf");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar06.vmt");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar07.vtf");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar07.vmt");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar08.vtf");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar08.vmt");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar09.vtf");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar09.vmt");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar10.vtf");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar10.vmt");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar11.vtf");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar11.vmt");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar12.vtf");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar12.vmt");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar13.vtf");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar13.vmt");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar14.vtf");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar14.vmt");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar15.vtf");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar15.vmt");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar16.vtf");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar16.vmt");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar17.vtf");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar17.vmt");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar18.vtf");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar18.vmt");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar19.vtf");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar19.vmt");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar20.vtf");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar20.vmt");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar21.vtf");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar21.vmt");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar22.vtf");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar22.vmt");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar23.vtf");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar23.vmt");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar24.vtf");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar24.vmt");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar25.vtf");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar25.vmt");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar26.vtf");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar26.vmt");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar27.vtf");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar27.vmt");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar28.vtf");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar28.vmt");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar29.vtf");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar29.vmt");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar30.vtf");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar30.vmt");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar31.vtf");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar31.vmt");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar32.vtf");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar32.vmt");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar33.vtf");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar33.vmt");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar34.vtf");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar34.vmt");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar35.vtf");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar35.vmt");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar36.vtf");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar36.vmt");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar37.vtf");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar37.vmt");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar38.vtf");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar38.vmt");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar39.vtf");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar39.vmt");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar40.vtf");
	AddFileToDownloadsTable("materials/eminem/hpbar_v2/hpbar40.vmt");
	
	PrecacheModel("materials/eminem/hpbar_v2/hpbar01.vmt");
	PrecacheModel("materials/eminem/hpbar_v2/hpbar02.vmt");
	PrecacheModel("materials/eminem/hpbar_v2/hpbar03.vmt");
	PrecacheModel("materials/eminem/hpbar_v2/hpbar04.vmt");
	PrecacheModel("materials/eminem/hpbar_v2/hpbar05.vmt");
	PrecacheModel("materials/eminem/hpbar_v2/hpbar06.vmt");
	PrecacheModel("materials/eminem/hpbar_v2/hpbar07.vmt");
	PrecacheModel("materials/eminem/hpbar_v2/hpbar08.vmt");
	PrecacheModel("materials/eminem/hpbar_v2/hpbar09.vmt");
	PrecacheModel("materials/eminem/hpbar_v2/hpbar10.vmt");
	PrecacheModel("materials/eminem/hpbar_v2/hpbar11.vmt");
	PrecacheModel("materials/eminem/hpbar_v2/hpbar12.vmt");
	PrecacheModel("materials/eminem/hpbar_v2/hpbar13.vmt");
	PrecacheModel("materials/eminem/hpbar_v2/hpbar14.vmt");
	PrecacheModel("materials/eminem/hpbar_v2/hpbar15.vmt");
	PrecacheModel("materials/eminem/hpbar_v2/hpbar16.vmt");
	PrecacheModel("materials/eminem/hpbar_v2/hpbar17.vmt");
	PrecacheModel("materials/eminem/hpbar_v2/hpbar18.vmt");
	PrecacheModel("materials/eminem/hpbar_v2/hpbar19.vmt");
	PrecacheModel("materials/eminem/hpbar_v2/hpbar20.vmt");
	PrecacheModel("materials/eminem/hpbar_v2/hpbar21.vmt");
	PrecacheModel("materials/eminem/hpbar_v2/hpbar22.vmt");
	PrecacheModel("materials/eminem/hpbar_v2/hpbar23.vmt");
	PrecacheModel("materials/eminem/hpbar_v2/hpbar24.vmt");
	PrecacheModel("materials/eminem/hpbar_v2/hpbar25.vmt");
	PrecacheModel("materials/eminem/hpbar_v2/hpbar26.vmt");
	PrecacheModel("materials/eminem/hpbar_v2/hpbar27.vmt");
	PrecacheModel("materials/eminem/hpbar_v2/hpbar28.vmt");
	PrecacheModel("materials/eminem/hpbar_v2/hpbar29.vmt");
	PrecacheModel("materials/eminem/hpbar_v2/hpbar30.vmt");
	PrecacheModel("materials/eminem/hpbar_v2/hpbar31.vmt");
	PrecacheModel("materials/eminem/hpbar_v2/hpbar32.vmt");
	PrecacheModel("materials/eminem/hpbar_v2/hpbar33.vmt");
	PrecacheModel("materials/eminem/hpbar_v2/hpbar34.vmt");
	PrecacheModel("materials/eminem/hpbar_v2/hpbar35.vmt");
	PrecacheModel("materials/eminem/hpbar_v2/hpbar36.vmt");
	PrecacheModel("materials/eminem/hpbar_v2/hpbar37.vmt");
	PrecacheModel("materials/eminem/hpbar_v2/hpbar38.vmt");
	PrecacheModel("materials/eminem/hpbar_v2/hpbar39.vmt");
	PrecacheModel("materials/eminem/hpbar_v2/hpbar40.vmt");
}

public ZR_OnClientInfected(client, attacker, bool:motherInfect, bool:respawnOverride, bool:respawn)
{
	maxvida[client] = GetClientHealth(client);
	//ClearIcon(client);
	//ClearTimer(Timers[client]);
}

public Action:event_Death(Handle:event, const String:name[], bool:dontBroadcast)
{
	new client = GetClientOfUserId(GetEventInt(event, "userid"));
	ClearIcon(client);
	ClearTimer(Timers[client]);
}

public OnClientPutInServer(client)
{
	maxvida[client] = 6000;
	icon[client] = 0;
}

public OnClientDisconnect(client)
{
	ClearTimer(Timers[client]);
	ClearIcon(client);
}

public Action:Event_PlayerHurt(Handle:event, const String:name[], bool:dontBroadcast)
{	
	new client = GetClientOfUserId(GetEventInt(event, "userid"));
	new attacker = GetClientOfUserId(GetEventInt(event, "attacker"));
	if(ZR_IsClientZombie(client) && (!IsValidClient(attacker) || !ZR_IsClientZombie(attacker)))
	{
		new total = RoundToNearest((GetEventFloat(event, "health") / maxvida[client])*100.0);
		if(IconValid(client)) Comprobar(client, total);
		else icon[client] = CreateIcon(client, total);
		ClearTimer(Timers[client]);
		Timers[client] = CreateTimer(4.0, Pasado, client);
	}
}

public Action:Pasado(Handle:timer, any:client)
{
	Timers[client] = INVALID_HANDLE;
	ClearIcon(client);
}

CreateIcon(client, hp) 
{
	if(hp <= 0) return 0;
	
	decl String:iTarget[16];
	Format(iTarget, 16, "client%d", client);
	DispatchKeyValue(client, "targetname", iTarget);

	decl Float:origin[3];
  
	GetClientAbsOrigin(client, origin);				
	origin[2] = origin[2] + 80.0;

	new Ent = CreateEntityByName("env_sprite");
	if(!Ent) return 0;
	
	if(hp >= 100) DispatchKeyValue(Ent, "model", "materials/eminem/hpbar_v2/hpbar01.vmt");
	else if(hp >= 97.5) DispatchKeyValue(Ent, "model", "materials/eminem/hpbar_v2/hpbar02.vmt");
	else if(hp >= 95) DispatchKeyValue(Ent, "model", "materials/eminem/hpbar_v2/hpbar03.vmt");
	else if(hp >= 92.5) DispatchKeyValue(Ent, "model", "materials/eminem/hpbar_v2/hpbar04.vmt");
	else if(hp >= 90) DispatchKeyValue(Ent, "model", "materials/eminem/hpbar_v2/hpbar05.vmt");
	else if(hp >= 87.5) DispatchKeyValue(Ent, "model", "materials/eminem/hpbar_v2/hpbar06.vmt");
	else if(hp >= 85) DispatchKeyValue(Ent, "model", "materials/eminem/hpbar_v2/hpbar07.vmt");
	else if(hp >= 82.5) DispatchKeyValue(Ent, "model", "materials/eminem/hpbar_v2/hpbar08.vmt");
	else if(hp >= 80) DispatchKeyValue(Ent, "model", "materials/eminem/hpbar_v2/hpbar09.vmt");
	else if(hp >= 77.5) DispatchKeyValue(Ent, "model", "materials/eminem/hpbar_v2/hpbar10.vmt");
	else if(hp >= 75) DispatchKeyValue(Ent, "model", "materials/eminem/hpbar_v2/hpbar11.vmt");
	else if(hp >= 72.5) DispatchKeyValue(Ent, "model", "materials/eminem/hpbar_v2/hpbar12.vmt");
	else if(hp >= 70) DispatchKeyValue(Ent, "model", "materials/eminem/hpbar_v2/hpbar13.vmt");
	else if(hp >= 67.5) DispatchKeyValue(Ent, "model", "materials/eminem/hpbar_v2/hpbar14.vmt");
	else if(hp >= 65) DispatchKeyValue(Ent, "model", "materials/eminem/hpbar_v2/hpbar15.vmt");
	else if(hp >= 62.5) DispatchKeyValue(Ent, "model", "materials/eminem/hpbar_v2/hpbar16.vmt");
	else if(hp >= 60) DispatchKeyValue(Ent, "model", "materials/eminem/hpbar_v2/hpbar17.vmt");
	else if(hp >= 57.5) DispatchKeyValue(Ent, "model", "materials/eminem/hpbar_v2/hpbar18.vmt");
	else if(hp >= 55) DispatchKeyValue(Ent, "model", "materials/eminem/hpbar_v2/hpbar19.vmt");
	else if(hp >= 52.5) DispatchKeyValue(Ent, "model", "materials/eminem/hpbar_v2/hpbar20.vmt");
	else if(hp >= 50) DispatchKeyValue(Ent, "model", "materials/eminem/hpbar_v2/hpbar21.vmt");
	else if(hp >= 47.5) DispatchKeyValue(Ent, "model", "materials/eminem/hpbar_v2/hpbar22.vmt");
	else if(hp >= 45) DispatchKeyValue(Ent, "model", "materials/eminem/hpbar_v2/hpbar23.vmt");
	else if(hp >= 42.5) DispatchKeyValue(Ent, "model", "materials/eminem/hpbar_v2/hpbar24.vmt");
	else if(hp >= 40) DispatchKeyValue(Ent, "model", "materials/eminem/hpbar_v2/hpbar25.vmt");
	else if(hp >= 37.5) DispatchKeyValue(Ent, "model", "materials/eminem/hpbar_v2/hpbar26.vmt");
	else if(hp >= 35) DispatchKeyValue(Ent, "model", "materials/eminem/hpbar_v2/hpbar27.vmt");
	else if(hp >= 32.5) DispatchKeyValue(Ent, "model", "materials/eminem/hpbar_v2/hpbar28.vmt");
	else if(hp >= 30) DispatchKeyValue(Ent, "model", "materials/eminem/hpbar_v2/hpbar29.vmt");
	else if(hp >= 27.5) DispatchKeyValue(Ent, "model", "materials/eminem/hpbar_v2/hpbar30.vmt");
	else if(hp >= 25) DispatchKeyValue(Ent, "model", "materials/eminem/hpbar_v2/hpbar31.vmt");
	else if(hp >= 22.5) DispatchKeyValue(Ent, "model", "materials/eminem/hpbar_v2/hpbar32.vmt");
	else if(hp >= 20) DispatchKeyValue(Ent, "model", "materials/eminem/hpbar_v2/hpbar33.vmt");
	else if(hp >= 17.5) DispatchKeyValue(Ent, "model", "materials/eminem/hpbar_v2/hpbar34.vmt");
	else if(hp >= 15) DispatchKeyValue(Ent, "model", "materials/eminem/hpbar_v2/hpbar35.vmt");
	else if(hp >= 12.5) DispatchKeyValue(Ent, "model", "materials/eminem/hpbar_v2/hpbar36.vmt");
	else if(hp >= 10) DispatchKeyValue(Ent, "model", "materials/eminem/hpbar_v2/hpbar37.vmt");
	else if(hp >= 7.5) DispatchKeyValue(Ent, "model", "materials/eminem/hpbar_v2/hpbar38.vmt");
	else if(hp >= 5) DispatchKeyValue(Ent, "model", "materials/eminem/hpbar_v2/hpbar39.vmt");
	else DispatchKeyValue(Ent, "model", "materials/eminem/hpbar_v2/hpbar40.vmt");
	

	DispatchKeyValue(Ent, "classname", "barra");
	DispatchKeyValue(Ent, "spawnflags", "1");
	DispatchKeyValue(Ent, "scale", "0.08");
	DispatchKeyValue(Ent, "rendermode", "1");
	DispatchKeyValue(Ent, "rendercolor", "255 255 255");
	DispatchSpawn(Ent);
	TeleportEntity(Ent, origin, NULL_VECTOR, NULL_VECTOR);
	SetVariantString(iTarget);
	AcceptEntityInput(Ent, "SetParent", Ent, Ent, 0);
 
	return EntIndexToEntRef(Ent);
}

ClearIcon(client)
{
	if(icon[client] != 0)
	{
		new entity = EntRefToEntIndex(icon[client]);
		if(entity != INVALID_ENT_REFERENCE) AcceptEntityInput(entity, "Kill");
		
		icon[client] = 0;
	}
}

IconValid(client)
{
	if(icon[client] != 0)
	{
		new entity = EntRefToEntIndex(icon[client]);
		if(entity != INVALID_ENT_REFERENCE) return true;
	}
	return false;
}

stock ClearTimer(&Handle:timer)
{
    if (timer != INVALID_HANDLE)
    {
        KillTimer(timer);
        timer = INVALID_HANDLE;
    }     
} 

public IsValidClient( client ) 
{ 
    if ( !( 1 <= client <= MaxClients ) || !IsClientInGame(client) || !IsPlayerAlive(client) ) 
        return false; 
     
    return true; 
}

Comprobar(client, hp)
{
	new entidad = EntRefToEntIndex(icon[client]);
	
	if(hp >= 100) {

			SetEntityModel(entidad, "materials/eminem/hpbar_v2/hpbar01.vmt");
		
	}
	else if(hp >= 97.5) {

			SetEntityModel(entidad, "materials/eminem/hpbar_v2/hpbar02.vmt");
	}
	else if(hp >= 95) {

			SetEntityModel(entidad, "materials/eminem/hpbar_v2/hpbar03.vmt");
	}
	else if(hp >= 92.5) {

			SetEntityModel(entidad, "materials/eminem/hpbar_v2/hpbar04.vmt");
	}
	else if(hp >= 90) {

			SetEntityModel(entidad, "materials/eminem/hpbar_v2/hpbar05.vmt");
	}
	else if(hp >= 87.5) {

			SetEntityModel(entidad, "materials/eminem/hpbar_v2/hpbar06.vmt");
	}
	else if(hp >= 85) {

			SetEntityModel(entidad, "materials/eminem/hpbar_v2/hpbar07.vmt");
	}
	else if(hp >= 82.5) {

			SetEntityModel(entidad, "materials/eminem/hpbar_v2/hpbar08.vmt");
	}
	else if(hp >= 80) {

			SetEntityModel(entidad, "materials/eminem/hpbar_v2/hpbar09.vmt");
	}
	else if(hp >= 77.5) {

			SetEntityModel(entidad, "materials/eminem/hpbar_v2/hpbar10.vmt");
	}
	else if(hp >= 75) {

			SetEntityModel(entidad, "materials/eminem/hpbar_v2/hpbar11.vmt");
	}
	else if(hp >= 72.5) {

			SetEntityModel(entidad, "materials/eminem/hpbar_v2/hpbar12.vmt");
	}
	else if(hp >= 70) {

			SetEntityModel(entidad, "materials/eminem/hpbar_v2/hpbar13.vmt");
	}
	else if(hp >= 67.5) {

			SetEntityModel(entidad, "materials/eminem/hpbar_v2/hpbar14.vmt");
	}
	else if(hp >= 65) {

			SetEntityModel(entidad, "materials/eminem/hpbar_v2/hpbar15.vmt");
	}
	else if(hp >= 62.5) {

			SetEntityModel(entidad, "materials/eminem/hpbar_v2/hpbar16.vmt");
	}
	else if(hp >= 60) {

			SetEntityModel(entidad, "materials/eminem/hpbar_v2/hpbar17.vmt");
	}
	else if(hp >= 57.5) {

			SetEntityModel(entidad, "materials/eminem/hpbar_v2/hpbar18.vmt");
	}
	else if(hp >= 55) {

			SetEntityModel(entidad, "materials/eminem/hpbar_v2/hpbar19.vmt");
	}
	else if(hp >= 52.5) {

			SetEntityModel(entidad, "materials/eminem/hpbar_v2/hpbar20.vmt");
	}
	else if(hp >= 50) {

			SetEntityModel(entidad, "materials/eminem/hpbar_v2/hpbar21.vmt");
	}
	else if(hp >= 47.5) {

			SetEntityModel(entidad, "materials/eminem/hpbar_v2/hpbar22.vmt");
	}
	else if(hp >= 45) {

			SetEntityModel(entidad, "materials/eminem/hpbar_v2/hpbar23.vmt");
	}
	else if(hp >= 42.5) {

			SetEntityModel(entidad, "materials/eminem/hpbar_v2/hpbar24.vmt");
	}
	else if(hp >= 40) {

			SetEntityModel(entidad, "materials/eminem/hpbar_v2/hpbar25.vmt");
	}
	else if(hp >= 37.5) {

			SetEntityModel(entidad, "materials/eminem/hpbar_v2/hpbar26.vmt");
	}
	else if(hp >= 35) {

			SetEntityModel(entidad, "materials/eminem/hpbar_v2/hpbar27.vmt");
	}
	else if(hp >= 32.5) {

			SetEntityModel(entidad, "materials/eminem/hpbar_v2/hpbar28.vmt");
	}
	else if(hp >= 30) {

			SetEntityModel(entidad, "materials/eminem/hpbar_v2/hpbar29.vmt");
	}
	else if(hp >= 27.5) {

			SetEntityModel(entidad, "materials/eminem/hpbar_v2/hpbar30.vmt");
	}
	else if(hp >= 25) {

			SetEntityModel(entidad, "materials/eminem/hpbar_v2/hpbar31.vmt");
	}
	else if(hp >= 22.5) {

			SetEntityModel(entidad, "materials/eminem/hpbar_v2/hpbar32.vmt");
	}
	else if(hp >= 20) {

			SetEntityModel(entidad, "materials/eminem/hpbar_v2/hpbar33.vmt");
	}
	else if(hp >= 17.5) {

			SetEntityModel(entidad, "materials/eminem/hpbar_v2/hpbar34.vmt");
	}
	else if(hp >= 15) {

			SetEntityModel(entidad, "materials/eminem/hpbar_v2/hpbar35.vmt");
	}
	else if(hp >= 12.5) {

			SetEntityModel(entidad, "materials/eminem/hpbar_v2/hpbar36.vmt");
	}
	else if(hp >= 10) {

			SetEntityModel(entidad, "materials/eminem/hpbar_v2/hpbar37.vmt");
	}
	else if(hp >= 7.5) {

			SetEntityModel(entidad, "materials/eminem/hpbar_v2/hpbar38.vmt");
	}
	else if(hp >= 5) {

			SetEntityModel(entidad, "materials/eminem/hpbar_v2/hpbar39.vmt");
	}
	else {


			SetEntityModel(entidad, "materials/eminem/hpbar_v2/hpbar40.vmt");
	}
}