package player;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import haxe.ds.Vector;
import player.fsm.PlayerState;
import player.fsm.PlayerStates;
import player.fsm.State;
import player.fsm.states.AttackState;
import player.fsm.states.DeathState;
import player.fsm.states.StandState;

class Player extends FlxSprite
{
	
	
	
	
	
	
	
	
	public function new(?X:Float=0, ?Y:Float = 0)
	{
		super(X, Y);
		loadGraphic(AssetPaths.Knight__png, true, 0, 0);
	}
	
	override public function update(elapsed:Float) {
		super.update(elapsed);
		
	}
}

