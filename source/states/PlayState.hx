package states;


import flixel.FlxCamera.FlxCameraFollowStyle;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxState;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.tile.FlxTilemap;
import flixel.util.FlxColor;
import player.Player;

class PlayState extends FlxState
{
	private var _player:Player;
	
	var _map:FlxOgmoLoader;
	var _mWalls:FlxTilemap;
	var _grpKeys:FlxTypedGroup<Key>;
	var _grpTraps:FlxTypedGroup<Trap>;
	var _grpGoal:FlxTypedGroup<Goal>;
	var _grpDoors:FlxTypedGroup<Door>;
	var _ending:Bool;
	var _won:Bool;
	
	
	override public function create():Void
	{
		_map = new FlxOgmoLoader(AssetPaths.level001__oel);
		_mWalls = _map.loadTilemap(AssetPaths.tiles_basic__png, 16, 16, "Walls");
		_mWalls.follow();
		_mWalls.setTileProperties(1, FlxObject.NONE);
		_mWalls.setTileProperties(2, FlxObject.ANY);
		add(_mWalls);
		
		_grpKeys = new FlxTypedGroup<Key>();
		add(_grpKeys);
		_grpTraps = new FlxTypedGroup<Trap>();
		add(_grpTraps);
		_grpDoors = new FlxTypedGroup<Door>();
		add(_grpDoors);
		_grpGoal = new FlxTypedGroup<Goal>();
		add(_grpGoal);
		_player = new Player();
		_map.loadEntities(placeEntities, "Entities");
		 
		add(_player);
		FlxG.camera.follow(_player, TOPDOWN, 1);
		
		
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
		
		else if (entityName == "key")
		{
			_grpKeys.add(new Key(x + 4, y + 4, FlxColor.fromString(entityData.get("kType"))));
		}
		else if (entityName == "trap")
		{
			_grpTraps.add(new Trap(x, y, Std.parseInt(entityData.get("tType"))));
		}
		else if (entityName == "door")
		{
			_grpDoors.add(new Door(x, y, FlxColor.fromString(entityData.get("dType"))));
		}
		else if (entityName == "goal")
		{
			_grpGoal.add(new Goal(x, y));
		}
	}
	
	function playerTouchKey(P:Player, K:Key):Void
	{
		if (P.alive && P.exists && K.alive && K.exists)
			{
				K.kill();
				P.giveKey(K.kType);
			}
	}
	
	function playerTouchDoor(P:Player, D:Door):Void
	{
		if (P.alive && P.exists && P.hasKey(D.dType) && D.alive && D.exists)
			{
				D.kill();
			}
	}
	
	function playerTouchTrap(P:Player, T:Trap):Void
	{
		T.visible = true;
		_ending = true;
	}
	
	
	function playerTouchGoal(P:Player, G:Goal):Void
	{
		_won = true;
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (_ending)
		{
			#if !html5 
				Sys.sleep(.5);
			#end
			FlxG.switchState(new GameOverState(false));
		}
		
		if (_won)
		{
			FlxG.switchState(new GameOverState(true));
		}
		
		
		FlxG.collide(_mWalls, _player);
		FlxG.collide(_player, _grpDoors, playerTouchDoor);
		FlxG.overlap(_player, _grpKeys, playerTouchKey);
		FlxG.overlap(_player, _grpGoal, playerTouchGoal);
		FlxG.collide(_player, _grpTraps, playerTouchTrap);
		/*if ()
		{
			_won = false;
			_ending = false;
		} */
		
		
	}	
}