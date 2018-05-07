package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("assets/data/data-goes-here.txt", "assets/data/data-goes-here.txt");
			type.set ("assets/data/data-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/d_r_project.oep", "assets/data/d_r_project.oep");
			type.set ("assets/data/d_r_project.oep", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/level001.oel", "assets/data/level001.oel");
			type.set ("assets/data/level001.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/images-go-here.txt", "assets/images/images-go-here.txt");
			type.set ("assets/images/images-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/key_green.png", "assets/images/key_green.png");
			type.set ("assets/images/key_green.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/key_red.png", "assets/images/key_red.png");
			type.set ("assets/images/key_red.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/key_yellow.png", "assets/images/key_yellow.png");
			type.set ("assets/images/key_yellow.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Knight.png", "assets/images/Knight.png");
			type.set ("assets/images/Knight.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Knightv02.png", "assets/images/Knightv02.png");
			type.set ("assets/images/Knightv02.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/tiles_basic.png", "assets/images/tiles_basic.png");
			type.set ("assets/images/tiles_basic.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/music/music-goes-here.txt", "assets/music/music-goes-here.txt");
			type.set ("assets/music/music-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/sounds/sounds-go-here.txt", "assets/sounds/sounds-go-here.txt");
			type.set ("assets/sounds/sounds-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("flixel/sounds/beep.ogg", "flixel/sounds/beep.ogg");
			type.set ("flixel/sounds/beep.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/sounds/flixel.ogg", "flixel/sounds/flixel.ogg");
			type.set ("flixel/sounds/flixel.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/fonts/nokiafc22.ttf", "flixel/fonts/nokiafc22.ttf");
			type.set ("flixel/fonts/nokiafc22.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/fonts/monsterrat.ttf", "flixel/fonts/monsterrat.ttf");
			type.set ("flixel/fonts/monsterrat.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/images/ui/button.png", "flixel/images/ui/button.png");
			type.set ("flixel/images/ui/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/images/logo/default.png", "flixel/images/logo/default.png");
			type.set ("flixel/images/logo/default.png", Reflect.field (AssetType, "image".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
