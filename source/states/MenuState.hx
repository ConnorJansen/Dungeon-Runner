package states;


import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;


class MenuState extends FlxState
{

	private var _btnPlay:FlxButton;
	private var _txtTitle:FlxText;
	private var _btnControls:FlxButton;
	
	override public function create():Void
	{
		_txtTitle = new FlxText(20, 0, 0, "Dungeon\nRunner", 22);
		_txtTitle.alignment = CENTER;
		_txtTitle.screenCenter(X);
		add(_txtTitle);
		_btnPlay = new FlxButton(0, 0, "Play", clickPlay);
		_btnPlay.screenCenter();
		add(_btnPlay);
		
		_btnControls = new FlxButton(0, 0, "Controls", showControls);
		_btnControls.screenCenter(X);
		_btnControls.y = _btnPlay.y + 20;
		add(_btnControls);
		
		super.create();
	}
	
	
	 private function clickPlay():Void
	{
     FlxG.switchState(new PlayState());
	}
	
	private function showControls():Void
	{
		FlxG.switchState(new ControlState());
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}