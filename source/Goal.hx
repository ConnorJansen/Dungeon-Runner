package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;

/**
 * ...
 * @author Conor
 */
class Goal extends FlxSprite 
{

	public function new(?X:Float=0, ?Y:Float=0) 
	{
		super(X, Y);
		makeGraphic(16, 16, FlxColor.BROWN, false);
		
		
	}
	
}