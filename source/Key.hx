package;

import flixel.FlxSprite;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;


class Key extends FlxSprite 
{

	public var kType(default, null):FlxColor;
	
	public function new(?X:Float=0, ?Y:Float=0, KType:FlxColor) 
	{
		super(X, Y);
		kType = KType;
		loadGraphic(AssetPaths.key_blank__png, false, 8, 8);
		
		color = kType;
		
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