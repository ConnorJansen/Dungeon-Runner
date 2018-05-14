package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxAxes;
import flixel.util.FlxColor;
import flixel.util.FlxSave;


class ControlState extends FlxState 
{
	var _txtMessage:FlxText;
	var _btnMainMenu:FlxButton;
	
	public function new() 
	{
		super();
	}
	
	function goMainMenu():Void
	{
		FlxG.switchState(new MenuState());
	}
	
	override public function create():Void
	{
		_txtMessage = new FlxText(0, 20, 0, "ArrowKeys/WASD to move\nCollect the keys to open the correleated doors", 11);
		_txtMessage.alignment = CENTER;
		_txtMessage.screenCenter(FlxAxes.X);
		add(_txtMessage);
		
		_btnMainMenu = new FlxButton(0, FlxG.height - 32, "Main Menu", goMainMenu);
		_btnMainMenu.screenCenter(FlxAxes.X);
		add(_btnMainMenu);
		
		super.create();
	
	}
	
	
}