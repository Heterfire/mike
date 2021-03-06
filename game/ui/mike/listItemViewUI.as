/**Created by the Morn,do not modify.*/
package game.ui.mike {
	import morn.core.components.*;
	public class listItemViewUI extends View {
		protected static var uiXML:XML =
			<View>
			  <Image skin="png.comp.blank" x="0" y="0" width="240" height="96"/>
			  <Clip skin="png.comp.clip_selectBox" x="0" y="0" clipY="2" width="240" height="96" name="selectBox"/>
			  <Image skin="png.comp.mike_cat" x="5" y="7" width="80" height="80" name="image"/>
			  <Label text="名称:" x="92" y="3" color="0xffffff"/>
			  <Label text="规格:" x="92" y="21" color="0xffffff"/>
			  <Label text="价格:" x="92" y="39" color="0xffffff" width="31" height="19"/>
			  <Label text="描述:" x="92" y="57" color="0xffffff"/>
			  <Label x="124" y="4" color="0xffffff" text="?????" width="115" height="18" name="name"/>
			  <Label x="124" y="22" color="0xffffff" text="?????" width="114" height="18" name="size"/>
			  <Label x="124" y="40" color="0xffffff" text="?????" width="114" height="18" name="price" bold="true"/>
			  <Label x="124" y="58" color="0xffffff" width="114" height="36" name="desc" text="?????" wordWrap="true" multiline="true"/>
			</View>;
		public function listItemViewUI(){}
		override protected function createChildren():void {
			super.createChildren();
			createView(uiXML);
		}
	}
}