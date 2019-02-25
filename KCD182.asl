state("KingdomCome")
{   
    // adapted to 1.8.2-247i  by mojo_tsi
	
	// old bool FastTravel : "WHGame.DLL", 0x32C8D88;
	// old bool waiting : "WHGame.DLL", 0x32C8D68;
	// old bool transition : "WHGame.DLL", 0x031F2938, 0x38, 0x728, 0xA8;
	// old bool loading : "WHGame.DLL", 0x348CE20;
	// old uint quest : "WHGame.DLL", 0x026E2D18, 0xD8, 0x88, 0xA8;
	
	//Fasttravel_Sleep_Wait_Jail_Read is a static 1 Byte value that is 1 while any of the actions is active
	// uint FastTravel : "WHGame.DLL", 0x32F9438; seems to be the same at a different address
	byte FastTravel : "WHGame.DLL", 0x279A259;
	
	//loading is a 4 Byte value that is non zero(1 or 2) during loading and transition states
	// it is also 1 during dialog wich needs to be corrected with another pointer
	// u need to have a look at the code that acesses this value,
	// to find the last offset(1000A0) before pointerscanning for it
	uint loading :  "WHGame.DLL", 0x2799B18, 0x150, 0x1000A0;
	
	//dialog is a 4 Byte value that is 1 during dialog used to correct the loading value
	uint dialog : "WHGame.DLL", 0x2799B18, 0x30, 0x750, 0xA8;
	
	uint quest : "WHGame.DLL", 0x02799B18, 0xD8, 0x88, 0xA8;
	

	
	}

startup
{
	vars.triggered = 0;

}

init 
{

}

exit
{
	timer.IsGameTimePaused = true;
}

	
isLoading
{	// correct loading to be true only while not in dialog
	current.loadingstate = (current.loading != 0 && current.dialog != 1 )|| ( current.FastTravel != 0);	
	return current.loadingstate;
}

split
{
	vars.split = false;
	if(old.quest!=current.quest){
		if(current.quest==33046666){
			vars.split = true;
			vars.triggered = 1;
		}
		if(current.quest==39550793&&vars.triggered<2){
			vars.split = true;
			vars.triggered = 2;
		}
		if(current.quest==46019608&&vars.triggered<3){
			vars.split = true;
			vars.triggered = 3;
		}
		if(current.quest==32364606&&vars.triggered<4){
			vars.split = true;
			vars.triggered = 4;
		}
		if(current.quest==26815832&&vars.triggered<5){
			vars.split = true;
			vars.triggered = 5;
		}
		if(current.quest==27875920&&vars.triggered<6){
			vars.split = true;
			vars.triggered = 6;
		}
		if(current.quest==45073577&&vars.triggered<7){
			vars.split = true;
			vars.triggered = 7;
		}
		if(current.quest==45407921&&vars.triggered<8){
			vars.split = true;
			vars.triggered = 8;
		}
		if(current.quest==50330758&&vars.triggered<9){
			vars.split = true;
			vars.triggered = 9;
		}
		if(current.quest==33995473&&vars.triggered<10){
			vars.split = true;
			vars.triggered = 10;
		}
		if(current.quest==34072744&&vars.triggered<11){
			vars.split = true;
			vars.triggered = 11;
		}
		if(current.quest==35218424&&vars.triggered<12){
			vars.split = true;
			vars.triggered = 12;
		}
		if(current.quest==44792891&&vars.triggered<13){
			vars.split = true;
			vars.triggered = 13;
		}
		if(current.quest==52072947&&vars.triggered<14){
			vars.split = true;
			vars.triggered = 14;
		}
		if(current.quest==51638816&&vars.triggered<15){
			vars.split = true;
			vars.triggered = 15;
		}
		if(current.quest==47892696&&vars.triggered<16){
			vars.split = true;
			vars.triggered = 16;
		}
		if(current.quest==50222777&&vars.triggered<17){
			vars.split = true;
			vars.triggered = 17;
		}
		if(current.quest==51547682&&vars.triggered<18){
			vars.split = true;
			vars.triggered = 18;
		}
		if(current.quest==54479418&&vars.triggered<19){
			vars.split = true;
			vars.triggered = 19;
		}
		if(current.quest==51375406&&vars.triggered<20){
			vars.split = true;
			vars.triggered = 20;
		}
		if(current.quest==54489849&&vars.triggered<21){
			vars.split = true;
			vars.triggered = 21;
		}
		if(current.quest==52739772&&vars.triggered<22){
			vars.split = true;
			vars.triggered = 22;
		}
		if(current.quest==52645191&&vars.triggered<23){
			vars.split = true;
			vars.triggered = 23;
		}
		if(current.quest==53962142&&vars.triggered<24){
			vars.split = true;
			vars.triggered = 24;
		}
		if(current.quest==53358937&&vars.triggered<25){
			vars.split = true;
			vars.triggered = 25;
		}
	}	
	//if(old.time>16.5f&&old.time<16.7f&&current.time==18.5f)		//Credits trigger (need to replace)
	//	vars.split = true;
		
	return vars.split;
}