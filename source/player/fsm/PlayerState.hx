package player.fsm;

import player.Player;
import player.fsm.State;



class PlayerState implements State
{
	
	private var managedHero:Player;

	public function new(hero:Player) 
	{
		this.managedHero = hero;
	}
	
	public function update():Void {}

}