package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import morn.core.handlers.Handler;
	
	import rightaway3d.house.lib.CabinetLib;
	
	public class MikeUI extends Sprite
	{
		public static var instance:MikeUI;
		public var mainUI:MainUI;
		
		// 树选择Item的处理方法
		public var treeSelectHandler:Function;
		// 列表选择Item的处理方法
		public var listSelectHandler:Function;
		// 底部Btns选择Item的处理方法
		public var bottomBtnsHandler:Function;
		
		public var mainBtnPressed:Function;
		
		public var itemList:XMLList;
		
		// 下方按钮列表内容
		public var bbtns:Array = ['删除', '生成面板', '重建台面'];
		
		public function MikeUI()
		{
			if (!instance) {
				instance = this;
			}
			
			CabinetLib.lib.addEventListener(Event.COMPLETE, function():void {
				App.init(instance);
				App.loader.loadAssets(['assets/comp.swf'], new Handler(uiLoadComplete));
			});
		}
		
		/**
		 * 设置底部的BottomBts内容, 参数为一个String数组,
		 * 如不指针arr,默认为 MikeUI.instance.bbtns
		 */
		public function setBottomBtns(arr:Array = null):void {
			if (!arr) {
				arr = bbtns;
			}
			
			var realArr:Array = [];
			for (var i:int = 0;i < arr.length; i++) {
				realArr.push({label:arr[i]});
			}
			
			mainUI.bottomBtns.array = realArr;
			mainUI.bottomBtns.width = arr.length * 98 - 5; 
		}
		
		private function onStageResize(e:Event):void {
			if (mainUI) {
				mainUI.width = stage.stageWidth;
				mainUI.height = stage.stageHeight;
			}
		}
		
		public function uiLoadComplete():void {
			mainUI = new MainUI();
			mainUI.list.array = [];
			mainUI.tree.xml = CabinetLib.lib.getProductTypeList();
			
			setBottomBtns();
			
//			bottomBtnsHandler = function(item):void {
//				trace(item);
//			}
			
			treeSelectHandler = function(item):void {
				var arr:Array = [];
				mainUI.list.selectedIndex = -1;
				var dataList:XMLList = CabinetLib.lib.getProductList(item.type, item.cate);
				itemList = dataList;
				
				if (dataList.length() > 0) {
					mainUI.assets.width = 410;
					//mainUI.width = 410;
					//mainUI.mouseEnabled = mainUI.mouseChildren = true;
				} else {
					mainUI.assets.width = 150;
					//mainUI.width = 150;
					//mainUI.mouseEnabled = mainUI.mouseChildren = false;
				}
				
				for each( var xml:XML in dataList) {
					var _name:String = xml.name
					var _spce:String = xml.spce;
					var _price:String = xml.price + ' 元';
					var _desc:String = xml.dscp;
					var _image:String = xml.image;
					arr.push({
						name: _name,
						size: _spce,
						price: _price,
						desc: _desc,
						image:_image
					});
				}

				mainUI.list.array = arr;
			};
			
			// create Btn Click
//			mainUI.createBtn.addEventListener(MouseEvent.CLICK, function():void {
//				if(createBtnClick) {
//					createBtnClick();
//				}
//			});
			
			// delete Btn Click
//			mainUI.deleteBtn.addEventListener(MouseEvent.CLICK, function():void {
//				if(deleteBtnClick) {
//					deleteBtnClick();
//				}
//			});
			
			addChild(mainUI);
			stage.addEventListener(Event.RESIZE, onStageResize);
			onStageResize(null);
		}
	}
}