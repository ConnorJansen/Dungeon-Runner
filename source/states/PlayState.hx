package states;


import flixel.FlxCamera.FlxCameraFollowStyle;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxState;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.tile.FlxTilemap;
import player.Player;

class PlayState extends FlxState
{
	private var _player:Player;
	
	var _map:FlxOgmoLoader;
	var _mWalls:FlxTilemap;
	var _grpKeys:FlxTypedGroup<Keys>;
	
	override public function create():Void
	{
		_map = new FlxOgmoLoader(AssetPaths.level001__oel);
		_mWalls = _map.loadTilemap(AssetPaths.tiles_basic__png, 16, 16, "Walls");
		_mWalls.follow();
		_mWalls.setTileProperties(1, FlxObject.NONE);
		_mWalls.setTileProperties(2, FlxObject.ANY);
		add(_mWalls);
		_player = new Player();
		_map.loadEntities(placeEntities, "Entities");
		 
		add(_player);
		FlxG.camera.follow(_player, TOPDOWN, 1);
		//FlxG.camera.follow(player, FlxCameraFollowStyle.PLATFORMER, 1);
		//FlxG.camera.zoom = 2;
		
		
		super.create();
	}
	
	function placeEntities(entityName:String, entityData:Xml):Void
	{
		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));
		if (entityName == "player_01")
		{
			_player.x = x;
			_player.y = y;
		}
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		FlxG.collide(_player, _mWalls);
	}
}