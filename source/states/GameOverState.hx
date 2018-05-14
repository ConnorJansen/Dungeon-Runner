package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxAxes;
import flixel.util.FlxColor;
import flixel.util.FlxSave;


class GameOverState extends FlxState 
{
	var _txtMessage:FlxText;
	var _btnMainMenu:FlxButton;
	var _win:Bool;
	
	public function new(Win:Bool) 
	{
		_win = Win;
		super();
	}
	function goMainMenu():Void
	{
		FlxG.switchState(new MenuState());
	}
	
	override public function create():Void
	{
		_txtMessage = new FlxText(0, 20, 0, _win ? "You Win!" : "Game Over!", 22);
		_txtMessage.alignment = CENTER;
		_txtMessage.screenCenter(FlxAxes.X);
		add(_txtMessage);
		
		_btnMainMenu = new FlxButton(0, FlxG.height - 32, "Main Menu", goMainMenu);
		_btnMainMenu.screenCenter(FlxAxes.X);
		add(_btnMainMenu);
		
		super.create();
	
	}
	
	
}