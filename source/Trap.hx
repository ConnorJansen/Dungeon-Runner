package;

import flixel.FlxSprite;

class Trap extends FlxSprite 
{

	public var tType(default, null):Int;
	
	public function new(?X:Float=0, ?Y:Float=0, TType:Int) 
	{
		super(X, Y);
		tType = TType;
		loadGraphic("assets/images/trap_" + tType + ".png", true, 16, 16);
		width = 16;
		height = 16;
		visible = false;
		immovable = true;
	}
	
}