package states;


import flixel.FlxCamera.FlxCameraFollowStyle;
import flixel.FlxG;
import flixel.FlxState;
import player.Player;

class PlayState extends FlxState
{
	private var _player:Player;
	
	
	override public function create():Void
	{
		
		 _player = new Player(20, 20);
		add(_player);
		//FlxG.camera.follow(player, FlxCameraFollowStyle.PLATFORMER, 1);
		//FlxG.camera.zoom = 2;
		
		
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}