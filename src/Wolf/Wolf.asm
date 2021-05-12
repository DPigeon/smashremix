// Wolf.asm

// This file contains file inclusions, action edits, and assembly for Wolf.

scope Wolf {
    // Insert Moveset files
    insert USP_1,"moveset/USP_1.bin"
	insert USP_2,"moveset/USP_2.bin"
	insert DSP_INITIAL,"moveset/DSP_INITIAL.bin"
	insert NSP_GROUND,"moveset/NSP_GROUND.bin"
	insert NSP_AIR,"moveset/NSP_AIR.bin"
    insert FTHROWDATA, "moveset/FTHROWDATA.bin"
    FTHROW:; Moveset.THROW_DATA(FTHROWDATA); insert "moveset/FTHROW.bin"
	insert JAB1,"moveset/JAB1.bin"
	insert JAB2,"moveset/JAB2.bin"
	insert JAB3,"moveset/JAB3.bin"
	insert DTILT,"moveset/DTILT.bin"
	insert FTILT_HIGH,"moveset/FTILT_HIGH.bin"
	insert FTILT_MID,"moveset/FTILT_MID.bin"
	insert FTILT_LOW,"moveset/FTILT_LOW.bin"
	insert UTILT,"moveset/UTILT.bin"
	insert DAIR,"moveset/DAIR.bin"
	insert NAIR,"moveset/NAIR.bin"
	insert BAIR,"moveset/BAIR.bin"
	insert FAIR,"moveset/FAIR.bin"
	insert UAIR,"moveset/UAIR.bin"
	insert FSMASH,"moveset/FSMASH.bin"
	insert USMASH,"moveset/USMASH.bin"
	insert DSMASH,"moveset/DSMASH.bin"
	insert DASHATTACK,"moveset/DASHATTACK.bin"
	insert DOWNATTACKU,"moveset/DOWNATTACKU.bin"
	insert DOWNATTACKD,"moveset/DOWNATTACKD.bin"
	insert GRAB,"moveset/GRAB.bin"
    insert VICTORY,"moveset/VICTORY.bin"
    insert IDLE,"moveset/IDLE.bin"
	insert DSP_LOOP,"moveset/DSP_LOOP.bin"
    insert TAUNT,"moveset/TAUNT.bin"
    insert ONEP_CPU,"moveset/ONEP_CPU.bin"
    insert DASH,"moveset/DASH.bin"
    insert RUN, "moveset/RUN.bin"; Moveset.GO_TO(RUN)         // loops
    insert SPARKLE,"moveset/SPARKLE.bin"; Moveset.GO_TO(SPARKLE)            // loops
    insert SHIELD_BREAK,"moveset/SHIELD_BREAK.bin"; Moveset.GO_TO(SPARKLE)            // loops
    insert STUN, "moveset/STUN.bin"; Moveset.GO_TO(STUN)         // loops
    insert ASLEEP, "moveset/ASLEEP.bin"; Moveset.GO_TO(ASLEEP)   // loops
    insert TECH_STAND, "moveset/TECH_STAND.bin"
    insert TECH_ROLL, "moveset/TECH_FROLL.bin"
    insert FROLL, "moveset/FROLL.bin"
    insert BROLL, "moveset/BROLL.bin"
    insert BTHROWDATA, "moveset/BTHROWDATA.bin"
    BTHROW:; Moveset.THROW_DATA(BTHROWDATA); insert "moveset/BTHROW.bin"
    insert TEETER, "moveset/TEETER.bin"
    insert JUMPAIR, "moveset/JUMPAIR.bin"
    insert CLAP, "moveset/CLAP.bin"

    
    // Modify Action Parameters             // Action                   // Animation                // Moveset Data             // Flags
    Character.edit_action_parameters(WOLF,  Action.Idle,                File.WOLF_IDLE,         	IDLE,               	-1)
	Character.edit_action_parameters(WOLF,  0xE1,                       File.WOLF_NSP,         		NSP_GROUND,               	-1)
 	Character.edit_action_parameters(WOLF,  0xE2,                       File.WOLF_NSP_AIR,          NSP_AIR,               	-1)
	Character.edit_action_parameters(WOLF,  0xE3,                       File.WOLF_USP_1,            USP_1,               			0x00000000)
	Character.edit_action_parameters(WOLF,  0xE8,                       File.WOLF_USP_2,            USP_2,               			0x00000000)
    Character.edit_action_parameters(WOLF,  0xE4,                       File.WOLF_USP_1,            USP_1,               			0x00000000)
	Character.edit_action_parameters(WOLF,  0xE6,                       File.WOLF_USP_2,            USP_2,               			0x00000000)
    
	Character.edit_action_parameters(WOLF,  0xEF,                       -1,         		        DSP_LOOP,               	-1)
	Character.edit_action_parameters(WOLF,  0xF0,                       -1,         		        DSP_LOOP,               	-1)
	Character.edit_action_parameters(WOLF,  0xF4,                       -1,         		        DSP_LOOP,               	-1)
	Character.edit_action_parameters(WOLF,  0xF5,                       -1,         		        DSP_LOOP,               	-1)
    
    Character.edit_action_parameters(WOLF, Action.RollF,                -1,                        FROLL,                      -1)
    Character.edit_action_parameters(WOLF, Action.RollB,                -1,                        BROLL,                      -1)
	
	Character.edit_action_parameters(WOLF,  0xEC,                       -1,         		        DSP_INITIAL,               	-1)
	Character.edit_action_parameters(WOLF,  0xEE,                       File.WOLF_DSP_END_GRND,     -1,               	    -1)
    Character.edit_action_parameters(WOLF,  0xF1,          		        -1,           		        DSP_INITIAL,                     -1)
    Character.edit_action_parameters(WOLF,  0xF3,                       File.WOLF_DSP_END_AIR,      -1,               	    -1)
    
    Character.edit_action_parameters(WOLF,    Action.Sleep,             -1,                      ASLEEP,                     -1)
    Character.edit_action_parameters(WOLF,    Action.ShieldBreak,       -1,                      SHIELD_BREAK,               -1)
    Character.edit_action_parameters(WOLF,    Action.Stun,              -1,                      STUN,                       -1)
    
    Character.edit_action_parameters(WOLF,    Action.ShieldOn,          File.WOLF_SHIELDON,       -1,                       -1)
    Character.edit_action_parameters(WOLF,    Action.ShieldOff,         File.WOLF_SHIELDOFF,      -1,                       -1)
	Character.edit_action_parameters(WOLF,    Action.FallSpecial,       File.WOLF_FALLSPECIAL,    -1,                       -1)
	Character.edit_action_parameters(WOLF,    Action.Teeter,            -1,                     TEETER,                   -1)
	Character.edit_action_parameters(WOLF, 	  Action.LightItemPickup,   File.WOLF_ITEM_PICKUP,          -1,                         -1)
    Character.edit_action_parameters(WOLF,    Action.ItemDrop,          File.WOLF_ITEM_DROP,          -1,                         -1)
    Character.edit_action_parameters(WOLF,    Action.ItemThrowF,        File.WOLF_ITEM_THROWF,        -1,                         -1)
    Character.edit_action_parameters(WOLF,    Action.ItemThrowB,        File.WOLF_ITEM_THROWF,        -1,                         -1)
    Character.edit_action_parameters(WOLF,    Action.ItemThrowSmashF,   File.WOLF_ITEM_THROWF,        -1,                         -1)
    Character.edit_action_parameters(WOLF,    Action.ItemThrowSmashB,   File.WOLF_ITEM_THROWF,        -1,                         -1)
	Character.edit_action_parameters(WOLF,    Action.ItemThrowU,        File.WOLF_ITEM_THROWU,        -1,                         -1)
	Character.edit_action_parameters(WOLF,    Action.ItemThrowSmashU,   File.WOLF_ITEM_THROWU,        -1,                         -1)
	Character.edit_action_parameters(WOLF,    Action.ItemThrowD,        File.WOLF_ITEM_THROWD,        -1,                         -1)
	Character.edit_action_parameters(WOLF,    Action.ItemThrowSmashD,   File.WOLF_ITEM_THROWD,        -1,                         -1)
	Character.edit_action_parameters(WOLF,    Action.ItemThrowDash,     File.WOLF_ITEM_THROW_DASH,    -1,                         -1)
	
	Character.edit_action_parameters(WOLF,    Action.ItemThrowAirF,      File.WOLF_ITEM_THROWF_AIR,        -1,                         -1)
    Character.edit_action_parameters(WOLF,    Action.ItemThrowAirB,      File.WOLF_ITEM_THROWF_AIR,        -1,                         -1)
    Character.edit_action_parameters(WOLF,    Action.ItemThrowAirU,      File.WOLF_ITEM_THROWU_AIR,        -1,                         -1)
    Character.edit_action_parameters(WOLF,    Action.ItemThrowAirD,      File.WOLF_ITEM_THROWD_AIR,        -1,                         -1)
    Character.edit_action_parameters(WOLF,    Action.ItemThrowAirSmashF, File.WOLF_ITEM_THROWF_AIR,        -1,                         -1)
    Character.edit_action_parameters(WOLF,    Action.ItemThrowAirSmashB, File.WOLF_ITEM_THROWF_AIR,        -1,                         -1)
    Character.edit_action_parameters(WOLF,    Action.ItemThrowAirSmashU, File.WOLF_ITEM_THROWU_AIR,        -1,                         -1)
    Character.edit_action_parameters(WOLF,    Action.ItemThrowAirSmashD, File.WOLF_ITEM_THROWD_AIR,        -1,                         -1)
	
	Character.edit_action_parameters(WOLF,    Action.BeamSwordNeutral, File.WOLF_SWING_NEUTRAL, -1,                         -1)
	Character.edit_action_parameters(WOLF,    Action.BeamSwordTilt,    File.WOLF_SWING_TILT,     -1,                         -1)
	Character.edit_action_parameters(WOLF,    Action.BeamSwordSmash,   File.WOLF_SWING_SMASH,    -1,                         -1)
	Character.edit_action_parameters(WOLF,    Action.BeamSwordDash,    File.WOLF_SWING_DASH,     -1,                         -1)
	
	Character.edit_action_parameters(WOLF,    Action.BatNeutral, 		File.WOLF_SWING_NEUTRAL,  -1,                         -1)
	Character.edit_action_parameters(WOLF,    Action.BatTilt,   		File.WOLF_SWING_TILT,     -1,                         -1)
	Character.edit_action_parameters(WOLF,    Action.BatSmash,  		File.WOLF_SWING_SMASH,    -1,                         -1)
	Character.edit_action_parameters(WOLF,    Action.BatDash,   		File.WOLF_SWING_DASH,     -1,                         -1)
	
	Character.edit_action_parameters(WOLF,    Action.FanNeutral, 		File.WOLF_SWING_NEUTRAL,  -1,                         -1)
	Character.edit_action_parameters(WOLF,    Action.FanTilt,   		File.WOLF_SWING_TILT,     -1,                         -1)
	Character.edit_action_parameters(WOLF,    Action.FanSmash,  		File.WOLF_SWING_SMASH,    -1,                         -1)
	Character.edit_action_parameters(WOLF,    Action.FanDash,   		File.WOLF_SWING_DASH,     -1,                         -1)
	
	Character.edit_action_parameters(WOLF,    Action.StarRodNeutral,  File.WOLF_SWING_NEUTRAL,  -1,                         -1)
	Character.edit_action_parameters(WOLF,    Action.StarRodTilt,     File.WOLF_SWING_TILT,     -1,                         -1)
	Character.edit_action_parameters(WOLF,    Action.StarRodSmash,    File.WOLF_SWING_SMASH,    -1,                         -1)
	Character.edit_action_parameters(WOLF,    Action.StarRodDash,     File.WOLF_SWING_DASH,     -1,                         -1)
	
	Character.edit_action_parameters(WOLF,    Action.RayGunShoot,     File.WOLF_RAYGUN_GND,      -1,                         -1)
    Character.edit_action_parameters(WOLF,    Action.RayGunShootAir,  File.WOLF_RAYGUN_AIR,      -1,                         -1)
	
	Character.edit_action_parameters(WOLF, 	  Action.FireFlowerShoot, File.WOLF_RAYGUN_GND,      -1,                        -1)
    Character.edit_action_parameters(WOLF,    Action.FireFlowerShootAir, File.WOLF_RAYGUN_AIR,    -1,                        -1)
    
	Character.edit_action_parameters(WOLF,    Action.ShieldDrop, 		 File.WOLF_SHIELD_DROP,   			-1,                         -1)
	Character.edit_action_parameters(WOLF,    Action.Pass, 				 File.WOLF_SHIELD_DROP,   			-1,                         -1)
	
    Character.edit_action_parameters(WOLF,    Action.Taunt,          File.WOLF_TAUNT,          TAUNT,                      -1)
    Character.edit_action_parameters(WOLF,    Action.Grab,           File.WOLF_GRAB,           -1,                       -1)
    Character.edit_action_parameters(WOLF,    Action.GrabPull,       File.WOLF_PULL,         -1,                  -1)
	Character.edit_action_parameters(WOLF,    Action.ThrowF,         File.WOLF_THROWF,         FTHROW,                       0x50000000)
    Character.edit_action_parameters(WOLF,    Action.ThrowB,         -1,                       BTHROW,                       -1)
    Character.edit_action_parameters(WOLF,    Action.Turn,           File.WOLF_TURN,           -1,                       -1)
    Character.edit_action_parameters(WOLF,    Action.Jab1,           File.WOLF_JAB1,           JAB1,                       -1)
    Character.edit_action_parameters(WOLF,    Action.Jab2,           File.WOLF_JAB2,           JAB2,                       -1)
	Character.edit_action_parameters(WOLF,    0xDC,            	     File.WOLF_JAB3,           JAB3,                     0x40000000)
    
	Character.edit_action_parameters(WOLF,    Action.DTilt,          File.WOLF_DTILT,          DTILT,                      -1)
    Character.edit_action_parameters(WOLF,    Action.UTilt,          File.WOLF_UTILT,          UTILT,                      -1)
    
	Character.edit_action_parameters(WOLF,    Action.Entry,      	 File.WOLF_IDLE,   		 IDLE,                        -1)
	Character.edit_action_parameters(WOLF,    Action.ReviveWait,     File.WOLF_IDLE,   		 IDLE,                        -1)
	Character.edit_action_parameters(WOLF,    0x06,      		     File.WOLF_IDLE,   		 IDLE,                        -1)
	
	Character.edit_action_parameters(WOLF,    Action.Walk1,      	 File.WOLF_WALK1,   		 IDLE,                     	-1)
	Character.edit_action_parameters(WOLF,    Action.Walk2,      	 File.WOLF_WALK2,   		 IDLE,                     -1)
	Character.edit_action_parameters(WOLF,    Action.Walk3,      	 File.WOLF_WALK3,   		 IDLE,                     -1)
    Character.edit_action_parameters(WOLF,    Action.Idle,           File.WOLF_IDLE,             -1,                         -1)
    Character.edit_action_parameters(WOLF,    Action.JumpSquat,      File.WOLF_JUMP_SQUAT,        -1,                      -1)
    Character.edit_action_parameters(WOLF,    Action.ShieldJumpSquat, File.WOLF_JUMP_SQUAT,        -1,                      -1)
	Character.edit_action_parameters(WOLF,    Action.LandingLight,   File.WOLF_JUMP_SQUAT,        -1,                      -1)
	Character.edit_action_parameters(WOLF,    Action.LandingHeavy,   File.WOLF_JUMP_SQUAT,        -1,                      -1)
	Character.edit_action_parameters(WOLF,    Action.LandingSpecial, File.WOLF_JUMP_SQUAT,        -1,                      -1)
    Character.edit_action_parameters(WOLF,    Action.LandingAirX,    File.WOLF_JUMP_SQUAT,        -1,                      -1)
    Character.edit_action_parameters(WOLF,    Action.LandingAirF,    File.WOLF_FAIR_LANDING,      -1,                      -1)
    Character.edit_action_parameters(WOLF,    Action.LandingAirB,    File.WOLF_BAIR_LANDING,      -1,                      -1)
	
	Character.edit_action_parameters(WOLF,    Action.Fall,            File.WOLF_FALLING,           -1,                         -1)
    Character.edit_action_parameters(WOLF,    Action.FallAerial,      File.WOLF_FALLING_AERIAL,    -1,                        -1)
	
	Character.edit_action_parameters(WOLF,    Action.AttackAirN,      File.WOLF_NAIR,           NAIR,                       -1)
	Character.edit_action_parameters(WOLF,    Action.AttackAirF,      File.WOLF_FAIR,           FAIR,                       -1)
    Character.edit_action_parameters(WOLF,    Action.AttackAirB,      File.WOLF_BAIR,           BAIR,                       -1)
    Character.edit_action_parameters(WOLF,    Action.AttackAirU,      File.WOLF_UAIR,           UAIR,                       -1)
    Character.edit_action_parameters(WOLF,    Action.AttackAirD,      File.WOLF_DAIR,           DAIR,                       -1)
	
	Character.edit_action_parameters(WOLF,    Action.FSmash,          File.WOLF_FSMASH,         FSMASH,                        0x40000000)
    Character.edit_action_parameters(WOLF,    Action.FSmashHigh,      0,                          0x80000000,              0)
    Character.edit_action_parameters(WOLF,    Action.FSmashLow,       0,                          0x80000000,              0)
    Character.edit_action_parameters(WOLF,    Action.USmash,          File.WOLF_USMASH,         USMASH,                      -1)
	Character.edit_action_parameters(WOLF,    Action.DSmash,          File.WOLF_DSMASH,         DSMASH,                      -1)
	
	Character.edit_action_parameters(WOLF,    Action.FTiltHigh,       File.WOLF_FTILT_HIGH,     FTILT_HIGH,                      -1)
    Character.edit_action_parameters(WOLF,    Action.FTiltMidHigh,    0,                        0x80000000,               0)
	Character.edit_action_parameters(WOLF,    Action.FTilt,           File.WOLF_FTILT_MID,          FTILT_MID,                      -1)
    Character.edit_action_parameters(WOLF,    Action.FTiltMidLow,     0,          				0x80000000,                      0)
	Character.edit_action_parameters(WOLF,    Action.FTiltLow,        File.WOLF_FTILT_LOW,      FTILT_LOW,               -1)
    
    Character.edit_action_parameters(WOLF,    Action.Dash,            File.WOLF_DASH,           DASH,                       -1)
    Character.edit_action_parameters(WOLF,    Action.Run,             File.WOLF_RUN,            RUN,                       -1)
    Character.edit_action_parameters(WOLF,    Action.TurnRun,         File.WOLF_TURN_RUN,       -1,                       -1)
    Character.edit_action_parameters(WOLF,    Action.RunBrake,        File.WOLF_RUN_BRAKE,      -1,                       -1)
    Character.edit_action_parameters(WOLF,    Action.DashAttack,      File.WOLF_DASH_ATTACK,    DASHATTACK,                       -1)
    Character.edit_action_parameters(WOLF,    Action.JumpF,           File.WOLF_JUMP_F,          -1,                       -1)
    Character.edit_action_parameters(WOLF,    Action.JumpB,           File.WOLF_JUMP_B,          -1,                       -1)
    Character.edit_action_parameters(WOLF,    Action.JumpAerialB,     File.WOLF_JUMP_AB,        JUMPAIR,                       -1)
    Character.edit_action_parameters(WOLF,    Action.JumpAerialF,     File.WOLF_JUMP_AF,        JUMPAIR,                     -1)
	
	Character.edit_action_parameters(WOLF,    Action.Crouch,          File.WOLF_CROUCH,          -1,                       -1)
    Character.edit_action_parameters(WOLF,    Action.CrouchIdle,      File.WOLF_CROUCH_IDLE,     -1,                       -1)
    Character.edit_action_parameters(WOLF,    Action.CrouchEnd,       File.WOLF_CROUCH_END,      -1,                       -1)
    
    Character.edit_action_parameters(WOLF,    Action.Tech,            File.WOLF_TECH,           TECH_STAND,                       -1)
    Character.edit_action_parameters(WOLF,    Action.TechF,           File.WOLF_TECHF,          TECH_ROLL,                       -1)
    Character.edit_action_parameters(WOLF,    Action.TechB,           File.WOLF_TECHB,          TECH_ROLL,               -1)
    
    Character.edit_action_parameters(WOLF,    Action.DownStandD,      File.WOLF_DOWNSTANDD,     -1,                       -1)
    Character.edit_action_parameters(WOLF,    Action.Revive2,         File.WOLF_DOWNSTANDD,     -1,                       -1)
    Character.edit_action_parameters(WOLF,    Action.StunStartD,      File.WOLF_DOWNSTANDD,     -1,                       -1)
    Character.edit_action_parameters(WOLF,    Action.DownForwardD,    File.WOLF_DOWNFORWARDD,     -1,                       -1)
    Character.edit_action_parameters(WOLF,    Action.DownAttackD,     File.WOLF_DOWNATTACKD,     DOWNATTACKD,               -1)
    Character.edit_action_parameters(WOLF,    Action.DownStandU,      File.WOLF_DOWNSTANDU,     -1,                       -1)
    Character.edit_action_parameters(WOLF,    Action.StunStartU,      File.WOLF_DOWNSTANDU,     -1,                       -1)
    Character.edit_action_parameters(WOLF,    Action.DownForwardU,    File.WOLF_DOWNFORWARDU,     -1,                       -1)
    Character.edit_action_parameters(WOLF,    Action.DownAttackU,     File.WOLF_DOWNATTACKU,     DOWNATTACKU,               -1)
    Character.edit_action_parameters(WOLF,    Action.DownBackU,       File.WOLF_DOWNBACKU,     -1,                       -1)
    Character.edit_action_parameters(WOLF,    Action.DownBackD,       File.WOLF_DOWNBACKD,     -1,                       -1)
    Character.edit_action_parameters(WOLF,    Action.DownBounceD,     File.WOLF_DOWNBOUNCED,   -1,                       -1)
    Character.edit_action_parameters(WOLF,    Action.StunLandD,       File.WOLF_DOWNBOUNCED,   -1,                       -1)
    Character.edit_action_parameters(WOLF,    Action.Revive1,         File.WOLF_DOWNBOUNCED,   -1,                       -1)
    Character.edit_action_parameters(WOLF,    Action.DownBounceU,     File.WOLF_DOWNBOUNCEU,   -1,                       -1)
    Character.edit_action_parameters(WOLF,    Action.StunLandU,       File.WOLF_DOWNBOUNCEU,   -1,                       -1)
    
    Character.edit_action_parameters(WOLF,    Action.EnterPipe,       File.WOLF_ENTERPIPE,     -1,                       -1)
    Character.edit_action_parameters(WOLF,    Action.ExitPipe,        File.WOLF_EXITPIPE,      -1,                       -1)
    
    Character.edit_action_parameters(WOLF,    0xDF,                   File.WOLF_APPEAR,        -1,                       -1)
    Character.edit_action_parameters(WOLF,    0xE0,                   File.WOLF_APPEAR_L,      -1,                       -1)
 

    // Modify Actions            // Action          // Staling ID   // Main ASM                 // Interrupt/Other ASM          // Movement/Physics ASM         // Collision ASM
    Character.edit_action(WOLF,  0xDC,              -1,             0x8014FE40,  				0x00000000,                     0x800D8CCC,                     0x800DDF44)
	Character.edit_action(WOLF,  0xE1,              -1,             WolfNSP.main,  				-1,                             -1,                             -1)
	Character.edit_action(WOLF,  0xE2,              -1,             WolfNSP.main,  				-1,                             -1,                            WolfNSP.air_collision_)
    Character.edit_action(WOLF,  0xE4,              -1,             WolfUSP.main_air,           WolfUSP.change_direction_,      WolfUSP.physics_,              WolfUSP.collision_)
	Character.edit_action(WOLF,  0xE3,              -1,             WolfUSP.main_ground,        WolfUSP.change_direction_,      WolfUSP.physics_,              WolfUSP.collision_)
	Character.edit_action(WOLF,  0xE6,              -1,             WolfUSP.main_2,             WolfUSP.change_direction_,      WolfUSP.physics_,              WolfUSP.collision_)
	Character.edit_action(WOLF,  0xE8,              -1,             WolfUSP.main_2,             WolfUSP.change_direction_,      WolfUSP.physics_,              WolfUSP.collision_)
	
	Character.edit_action(WOLF,  0xF4,              -1,             -1,                         -1,                             WolfDSP.physics_,                     -1)
    Character.edit_action(WOLF,  0xF3,              -1,             -1,                         -1,                             WolfDSP.physics_,                     -1)
    Character.edit_action(WOLF,  0xF5,              -1,             -1,                         -1,                             WolfDSP.physics_,                     -1)

	
    // Modify Menu Action Parameters                // Action           // Animation                // Moveset Data             // Flags
    Character.edit_menu_action_parameters(WOLF,    0x0,               File.WOLF_IDLE,               IDLE,                       -1)
	Character.edit_menu_action_parameters(WOLF,    0x1,               File.WOLF_VICTORY1,           0x80000000,                 -1)
    Character.edit_menu_action_parameters(WOLF,    0x2,               File.WOLF_VICTORY2,           0x80000000,                 -1)
    Character.edit_menu_action_parameters(WOLF,    0x3,               File.WOLF_CSS,                0x80000000,                 -1)
	Character.edit_menu_action_parameters(WOLF,    0x4,               File.WOLF_CSS,                0x80000000,                 -1)
    Character.edit_menu_action_parameters(WOLF,    0x5,               -1,                           CLAP,                       -1)
    Character.edit_menu_action_parameters(WOLF,    0xD,               File.WOLF_1P_HMN,             0x80000000,                 -1)
    Character.edit_menu_action_parameters(WOLF,    0xE,               File.WOLF_1P_CPU,             ONEP_CPU,                   -1)
    
    
    // Set crowd chant FGM.
    Character.table_patch_start(crowd_chant_fgm, Character.id.WOLF, 0x2)
    dh  0x03C3
    OS.patch_end()
	 
	Character.table_patch_start(air_usp, Character.id.WOLF, 0x4)
    dw      WolfUSP.initial_air
    OS.patch_end()
	Character.table_patch_start(ground_usp, Character.id.WOLF, 0x4)
    dw      WolfUSP.initial_ground
    OS.patch_end()
	//Character.table_patch_start(ground_nsp, Character.id.WOLF, 0x4)
    //dw      0x80156014
    //OS.patch_end()
    
    // Set Kirby copy power and hat_id
    Character.table_patch_start(kirby_inhale_struct, 0x02, Character.id.WOLF, 0xC)
    dh 0x1A
    OS.patch_end()
	 
	// @ Description
    // This adds a check to the reflection routine that looks to see if wolf is reflecting, if so it doubles speed
    scope wolf_reflect_speed: {
        OS.patch_start(0xE181C, 0x80166DDC)
        j       wolf_reflect_speed
        nop
        _return:
        OS.patch_end()
        
        addiu   sp, sp,-0x0010              // allocate stack space
        sw      t0, 0x0004(sp)              // ~
        sw      t1, 0x0008(sp)              // store registers
        swc1    f2, 0x000C(sp)
        swc1    f4, 0x0010(sp)

        lw      t0, 0x0008(v1)              // t0 = projectile owner object struct
        lw      t0, 0x0084(t0)              // t0 = projectile owner player struct
        
		lw		t0, 0x0008(t0)				// load player id from reflecting player's player struct

		lli     t1, Character.id.WOLF       // t1 = id.WOLF
        bne     t0, t1, _end                // if not Wolf, skip
        nop
        
        lwc1    f2, 0x0020(v1)              // load reflecting projectiles horizontal speed
        lui     at, 0x4000                  // load number 2.0
        mtc1    at, f4                      // move to floating point
        mul.s   f2, f2, f4                  // multiply current projectile speed by 2
        swc1    f2, 0x0020(v1)              // save product to active projectile horizontal speed
                       
        _end:
        lw      t0, 0x0004(sp)              // ~
        lw      t1, 0x0008(sp)              // load t0, t1
        lwc1    f2, 0x000C(sp)
        lwc1    f4, 0x0010(sp)
        addiu   sp, sp, 0x0010              // deallocate stack space
        mtc1    t6, f16                     // original line 1
        j       _return
        lui     at, 0x8019                  // original line 2
    }
	
	// @ Description
    // This adds a check to Fox's main reflection subroutine that looks to see if wolf is reflecting, if so it changes hardcoding to his graphic
    scope wolf_reflect_graphic: {
        OS.patch_start(0x7C7B4, 0x80100FB4)
        j       wolf_reflect_graphic
        nop
        _return:
        OS.patch_end()
        
        lw      t6, 0x0008(v1)              // t6 = character ID

		lli     t0, Character.id.WOLF       // t1 = id.WOLF
        beq     t6, t0, _wolf               // if Wolf, jump
        nop
        
		li		a0, 0x8012E0EC				// modified original line 2
		beq		r0, r0, _end
		nop
		
		_wolf:
		li		a0, reflect_graphic_struct
                              
        _end:
        jal		0x800FDB1C					// original line 1
		nop
		j       _return
        nop
    }
	
	// this struct needs updated whenever Reflector File updated
	OS.align(16)
	reflect_graphic_struct:
    dw  0x060F0000
    dw  Character.WOLF_file_7_ptr
    OS.copy_segment(0xA98F4, 0x8)
	dw	reflector_graphic_routine
	dw	0x80014038
	dw	0x00000288
	dw	0x00000000
	dw	0x0000041C
	dw	0x00000000
	
	// below is another hardcoding relevant to the the looping of the reflector. This required just making a new subroutine and routine to be placed in the struct above
	
	reflector_graphic_routine:
	OS.copy_segment(0x7C6D0, 0x70)
	jal	reflector_graphic_subroutine
	sw	a2, 0x0024(sp)
	OS.copy_segment(0x7C748, 0x34)
	jal	reflector_graphic_subroutine
	sw	a2, 0x0024(sp)
	OS.copy_segment(0x7C784, 0x20)
	
	reflector_graphic_subroutine:
    OS.copy_segment(0x7C684, 0x10)
	sw	a1, 0x0018(v0)
	li	t7, reflector_struct
	addu t7, t7, t6
	lw t7, 0x0000(t7)
	li	t8, Character.WOLF_file_7_ptr
	lw	t8, 0x0000(t8)
	OS.copy_segment(0x7C6AC, 0x28)
	
	reflector_struct:
	dw	0x0000041C
	dw	0x000004C4
	dw	0x000005E8
	dw	0x000006FC
	
	// @ Description
    // This adds a check to Fox's Arwing entry subroutine that looks to see if wolf is entering, if so it changes hardcoding to his Wolfen
    scope wolfen_entry: {
        OS.patch_start(0x7F004, 0x80103804)
        j       wolfen_entry
        nop
        _return:
        OS.patch_end()
        
        lw      t6, 0x0008(s0)              // t6 = character ID

		lli     t0, Character.id.WOLF       // t1 = id.WOLF
        beq     t6, t0, _wolf               // if Wolf, jump
        nop
        
		li		a0, 0x8012E6F4				// modified original line 2
		beq		r0, r0, _end
		nop
		
		_wolf:
		li		a0, entry_anim_struct_WOLF
                              
        _end:
        jal		0x800FDAFC					// original line 1
		nop
		j       _return
        nop
    }
	
	// @ Description
	// NEEDS UPDATED WITH NEW IMPORT
    // This adds a check to Fox's Arwing entry subroutine that looks to see if wolf is entering, if so it changes hardcoding to his Wolfen
    scope wolfen_entry_2: {
        OS.patch_start(0x7F05C, 0x8010385C)
        j       wolfen_entry_2
        nop
		nop
		nop
        _return:
        OS.patch_end()
        
        lw      t6, 0x0018(sp)              // t6 = player struct
		lw      t6, 0x0008(t6)              // t6 = character ID
		lli     t5, Character.id.WOLF       // t1 = id.WOLF
        beq     t6, t5, _wolf               // if Wolf, jump
        nop
        
		li		t6, 0x00002E74
		lui		t5, 0x8013					// original line 1
		beq		r0, r0, _end
		lw		t5, 0x0EA4(t5)				// original line 2
		
		_wolf:
		li		t5, Character.WOLF_file_8_ptr
		lw		t5, 0x0000(t5)
		li		t6, 0x0000284C				// needs updated with new import
                              
        _end:
        j       _return
        nop
    }
	
	// @ Description
	// NEEDS UPDATED WITH NEW IMPORT OF REFLECTOR OR WOLFEN
    // This adds a check to Fox's Arwing entry subroutine that looks to see if wolf is entering, if so it changes hardcoding to his Wolfen
    scope wolfen_entry_3: {
        OS.patch_start(0x7F088, 0x80103888)
        j       wolfen_entry_3
        nop
		nop
		nop
		nop
		nop
        _return:
        OS.patch_end()
        
        lw      t0, 0x0018(sp)              // t6 = player struct
		lw      t0, 0x0008(t0)              // t6 = character ID
		lli     t8, Character.id.WOLF       // t1 = id.WOLF
        beq     t0, t8, _wolf               // if Wolf, jump
        nop
        
					
		bne		t7, at, _branch_1			// original line 2 modified
		lui		t0, 0x8013					// original line 1	
		lui		t8, 0x8013
		li		t9, 0x000009E0
		j		_return
		lw		t8, 0x0EA0(t8)
		
		
		_branch_1:
		j		0x801038B8
		nop
		
		
		_wolf:
		li		t0, Character.WOLF_file_7_ptr
		bne		t7, at, _branch_2
        lw		t0, 0x0000(t0)                      
		li		t8, Character.WOLF_file_7_ptr
		li		t9, 0x00000F74              // Needs updated when Reflector Updated
        j       _return
        lw		t8, 0x0000(t8)
		
		_branch_2:
		lui		t1, 0x0000
		j		0x801038C4
		addiu	t1, t1, 0x0B24              // Needs updated when Reflector Updated
    }
	
	// Needs updated when wolfen updated
	entry_anim_struct_WOLF:
    dw  0x070A0000
    dw  Character.WOLF_file_8_ptr
    OS.copy_segment(0xA9EFC, 0x10)
	dw	0x00002610
	dw	0x00000000
	dw	0x00000000
	dw	0x00000000
}
