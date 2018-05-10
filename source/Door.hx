package;

import flixel.FlxSprite;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;


class Door extends FlxSprite 
{

	public var dType(default, null):FlxColor;
	
	public function new(?X:Float=0, ?Y:Float=0, DType:FlxColor) 
	{
		super(X, Y);
		dType = DType;
		loadGraphic(AssetPaths.door_blank__png, true, 16, 16);
		width = 16;
		height = 16;
		
		color = dType;
		immovable = true;
		
	}
	
	override public function kill():Void
	{
		alive = false;
		FlxTween.tween(this, { alpha: 0, y: y-16 }, .33,  { ease: FlxEase.circOut, onComplete: finishKill });
	}
	
	function finishKill(_):Void
	{
		exists = false;
	}
	
}