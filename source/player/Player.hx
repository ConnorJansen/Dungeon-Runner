package player;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;
import haxe.ds.Vector;
import player.fsm.PlayerState;
import player.fsm.PlayerStates;
import player.fsm.State;
import player.fsm.states.AttackState;
import player.fsm.states.DeathState;
import player.fsm.states.StandState;

class Player extends FlxSprite
{
	
	
	
	public var speed:Float = 200;
	
	
	
	
	public function new(?X:Float=0, ?Y:Float=0)
	{
		
		
		super(X, Y);
		
		loadGraphic(AssetPaths.Knightv02__png, false, 16, 16);
		drag.x = drag.y = 1600;
		setSize(8, 8);
		offset.set(4, 4);
		
	}
	
	
	private function movement():Void
	{
		var _up:Bool = false;
		var _down:Bool = false;
		var _left:Bool = false;
		var _right:Bool = false;
		
		_up = FlxG.keys.anyPressed([UP, W]);
		_down = FlxG.keys.anyPressed([DOWN, S]);
		_left = FlxG.keys.anyPressed([LEFT, A]);
		_right = FlxG.keys.anyPressed([RIGHT, D]);
		
		if (_up && _down)
			_up = _down = false;
		if (_left && _right)
			_left = _right = false;
			
			
		if (_up || _down || _left || _right)
			{
				var mA:Float = 0;
				if (_up)
					{
					mA = -90;
					facing = FlxObject.UP;
					}
				else if (_down)
				{
					mA = 90;
					facing = FlxObject.DOWN;
				}
				else if (_left)
				{
					mA = 180;
					facing = FlxObject.LEFT;
				}
				else if (_right)
				{
					mA = 0;
					facing = FlxObject.RIGHT;
				}
				velocity.set(speed, 0);
				velocity.rotate(FlxPoint.weak(0, 0), mA);
				
				
				if ((velocity.x != 0 || velocity.y != 0) && touching == FlxObject.NONE)
				{
					switch (facing)
					{
						case FlxObject.UP:
							this.set_angle(0);						
						case FlxObject.DOWN:
							this.set_angle(180);							
						case FlxObject.LEFT:
							this.set_angle( -90);
						case FlxObject.RIGHT:
							this.set_angle(90);
					}
				}
			}

	}
	
	override public function update(elapsed:Float) 
	{
		movement();
		super.update(elapsed);
		
	}
	
	
}

