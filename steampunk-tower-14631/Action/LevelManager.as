﻿package 
{
    import __AS3__.vec.*;
    import com.greensock.*;
    import flash.events.*;

    public class LevelManager extends Object
    {
        public var infoImgLifeTime:int = 10000;
        private var levels:Vector.<XML>;
        private var levelsChallenge:Vector.<XML>;
        private var curLevel:int = 0;
        public var isChallenge:Boolean = false;
        public var gameStarted:Boolean = false;
        private var waveGroups:Vector.<WaveGroup>;
        private var curWaveGroupIndex:int = 0;
        private var curWaveGroups:Vector.<WaveGroup>;
        private var curLevelXml:XML;
        public var level:Level;
        public var preStartMoney:int = 0;
        public var twoStarHealth:int = 0;
        public var threeStarHealth:int = 0;
        public var maxFloorsCount:int = 2;
        public var maxCannonsCount:int = 4;
        public var maxUpgradeIndex:int = 0;
        public var upgradeTwo:Boolean = false;

        public function LevelManager(param1:Level)
        {
            this.levels = new Vector.<XML>;
            this.levelsChallenge = new Vector.<XML>;
            this.level = param1;
            var _loc_2:* = <level eye=""off"" money=""11000"" maxTower=""2"" maxUpgrade=""0"" upgradeTwo=""false"" threeStarHealth=""80"" twoStarHealth=""60"" preStartMoney=""1000"" bg=""1"">
n	t<!-- 
n	t	tpreStartMoney - денег за досрочный вызов волны, может указываться у level и wave
n	t	tpause - пауза перед появлением, (секунды)
n	t	tlifeTime - время жизни волны, (секунды)
n	t	timg - картинка, иконка досрочного вызова волны
n	t	tside - сторона, откуда появится враг (left, right), - можно указывать целиком волне(wave) и также отдельным юнитам(enemy)
n	t-->
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""20"" side=""right"" img=""1"">
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""6""/>
n	t	t</wave>
n	t</group>
n	t
n	t<group pause=""2"">
n	t	t<wave pause=""0"" lifeTime=""10"" side=""left"" img=""1"">
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""20"" side=""right"" img=""1"">
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit1"" delay=""17""/>
n	t	t	t<enemy name=""unit1"" delay=""19""/>
n	t	t	t<enemy name=""unit1"" delay=""20""/>
n	t	t	t<enemy name=""unit1"" delay=""21""/>
n	t	t	t<enemy name=""unit1"" delay=""22""/>
n	t	t	t<enemy name=""unit1"" delay=""23""/>
n	t	t	t<enemy name=""unit1"" delay=""24""/>
n	t	t	t<enemy name=""unit1"" delay=""24""/>
n	t	t	t<enemy name=""unit1"" delay=""24""/>
n	t	t	t<enemy name=""unit1"" delay=""25""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""20"" side=""left"" img=""1"">
n	t	t  	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""20"" side=""left"" img=""1"">
n	t	t	t	t<enemy name=""unit2"" delay=""2""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""20"" side=""right"" img=""1"">
n	t	t	t	t<enemy name=""unit2"" delay=""2""/>
n	t	t</wave>
n	t</group>
n	t
n</level>")("<level eye="off" money="11000" maxTower="2" maxUpgrade="0" upgradeTwo="false" threeStarHealth="80" twoStarHealth="60" preStartMoney="1000" bg="1">
	<!-- 
		preStartMoney - денег за досрочный вызов волны, может указываться у level и wave
		pause - пауза перед появлением, (секунды)
		lifeTime - время жизни волны, (секунды)
		img - картинка, иконка досрочного вызова волны
		side - сторона, откуда появится враг (left, right), - можно указывать целиком волне(wave) и также отдельным юнитам(enemy)
	-->
	<group pause="0">
		<wave pause="0" lifeTime="20" side="right" img="1">
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit1" delay="6"/>
		</wave>
	</group>
	
	<group pause="2">
		<wave pause="0" lifeTime="10" side="left" img="1">
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="5"/>
		</wave>
	</group>
	<group pause="0">
		<wave pause="0" lifeTime="20" side="right" img="1">
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit1" delay="7"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit1" delay="17"/>
			<enemy name="unit1" delay="19"/>
			<enemy name="unit1" delay="20"/>
			<enemy name="unit1" delay="21"/>
			<enemy name="unit1" delay="22"/>
			<enemy name="unit1" delay="23"/>
			<enemy name="unit1" delay="24"/>
			<enemy name="unit1" delay="24"/>
			<enemy name="unit1" delay="24"/>
			<enemy name="unit1" delay="25"/>
		</wave>
	</group>
	<group pause="0">
		<wave pause="0" lifeTime="20" side="left" img="1">
		  	<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit1" delay="5"/>
		</wave>
	</group>
	<group pause="0">
		<wave pause="0" lifeTime="20" side="left" img="1">
				<enemy name="unit2" delay="2"/>
		</wave>
		<wave pause="0" lifeTime="20" side="right" img="1">
				<enemy name="unit2" delay="2"/>
		</wave>
	</group>
	
</level>;
            var _loc_3:* = <level eye=""off"" money=""21000"" maxTower=""3"" maxUpgrade=""1"" bg=""1"" threeStarHealth=""80"" twoStarHealth=""60"" preStartMoney=""1000"">
n	t<!-- 
n	t	tpause - пауза перед появлением, (секунды)
n	t	tlifeTime - время жизни волны, (секунды)
n	t	timg - картинка, иконка досрочного вызова волны
n	t	tside - сторона, откуда появится враг (left, right), - можно указывать целиком волне и также отдельным юнитам
n	t-->
n
n	t<group pause=""5"">
n	t	t<wave pause=""0"" lifeTime=""20"" side=""left"" img=""1"">
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""20"" side=""right"" img=""1"">
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""40"" side=""left"" img=""1"">
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""12""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit1"" delay=""19""/>
n	t	t	t<enemy name=""unit1"" delay=""20""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""40"" side=""right"" img=""1"">
n	t	t	t<enemy name=""unit2"" delay=""3""/>
n	t	t	t<enemy name=""unit2"" delay=""5""/>
n	t	t	t<enemy name=""unit2"" delay=""7""/>
n	t	t	t<enemy name=""unit2"" delay=""9""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""5"">
n	t	t<wave pause=""0"" lifeTime=""20"" side=""left"" img=""1"">
n	t	t	t<enemy name=""unit2"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""wheel"" delay=""4""/>
n	t	t	t<enemy name=""wheel"" delay=""15""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""20"" side=""right"" img=""1"">
n	t	t	t<enemy name=""unit2"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""wheel"" delay=""4""/>
n	t	t	t<enemy name=""wheel"" delay=""15""/>
n	t	t</wave>
n	t</group>
n	t
n	t<group pause=""5"">
n	t	t<wave pause=""0"" lifeTime=""40"" side=""left"" img=""1"">
n	t	t        <enemy name=""unit1"" delay=""1""/>
n	t	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t	t<enemy name=""unit2"" delay=""2""/>
n	t	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t	t<enemy name=""unit2"" delay=""12""/>
n	t	t	t	t<enemy name=""wheel"" delay=""4""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""40"" side=""right"" img=""1"">
n	t	t        <enemy name=""unit1"" delay=""1""/>
n	t	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t	t<enemy name=""unit2"" delay=""2""/>
n	t	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t	t<enemy name=""unit2"" delay=""12""/>
n	t	t	t	t<enemy name=""wheel"" delay=""4""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""1"">
n	t	t<wave pause=""0"" lifeTime=""20"" side=""left"" img=""1"">
n	t	t	t	t<enemy name=""wheel"" delay=""4""/>
n	t	t	t	t<enemy name=""wheel"" delay=""5""/>
n	t	t	t	t<enemy name=""wheel"" delay=""6""/>
n	t	t	t	t<enemy name=""wheel"" delay=""7""/>
n	t	t	t	t<enemy name=""wheel"" delay=""8""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""5"">
n	t	t<wave pause=""0"" lifeTime=""40"" side=""left"" img=""1"">
n	t	t	t	t<enemy name=""unit2"" delay=""2""/>
n	t	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t	t<enemy name=""unit2"" delay=""4""/>
n	t	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t	t<enemy name=""unit2"" delay=""6""/>
n	t	t	t	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t	t<enemy name=""unit2"" delay=""8""/>
n	t	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""40"" side=""right"" img=""1"">
n	t	t        <enemy name=""unit2"" delay=""2""/>
n	t	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t	t<enemy name=""unit2"" delay=""4""/>
n	t	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t	t<enemy name=""unit2"" delay=""6""/>
n	t	t	t	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t	t<enemy name=""unit2"" delay=""8""/>
n	t	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t</wave>
n	t</group>
n	t
n</level>")("<level eye="off" money="21000" maxTower="3" maxUpgrade="1" bg="1" threeStarHealth="80" twoStarHealth="60" preStartMoney="1000">
	<!-- 
		pause - пауза перед появлением, (секунды)
		lifeTime - время жизни волны, (секунды)
		img - картинка, иконка досрочного вызова волны
		side - сторона, откуда появится враг (left, right), - можно указывать целиком волне и также отдельным юнитам
	-->

	<group pause="5">
		<wave pause="0" lifeTime="20" side="left" img="1">
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="9"/>
		</wave>
		<wave pause="0" lifeTime="20" side="right" img="1">
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="9"/>
		</wave>
	</group>
	<group pause="0">
		<wave pause="0" lifeTime="40" side="left" img="1">
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="12"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit1" delay="19"/>
			<enemy name="unit1" delay="20"/>
		</wave>
		<wave pause="0" lifeTime="40" side="right" img="1">
			<enemy name="unit2" delay="3"/>
			<enemy name="unit2" delay="5"/>
			<enemy name="unit2" delay="7"/>
			<enemy name="unit2" delay="9"/>
		</wave>
	</group>
	<group pause="5">
		<wave pause="0" lifeTime="20" side="left" img="1">
			<enemy name="unit2" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="wheel" delay="4"/>
			<enemy name="wheel" delay="15"/>
		</wave>
		<wave pause="0" lifeTime="20" side="right" img="1">
			<enemy name="unit2" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="wheel" delay="4"/>
			<enemy name="wheel" delay="15"/>
		</wave>
	</group>
	
	<group pause="5">
		<wave pause="0" lifeTime="40" side="left" img="1">
		        <enemy name="unit1" delay="1"/>
				<enemy name="unit1" delay="2"/>
				<enemy name="unit2" delay="2"/>
				<enemy name="unit1" delay="5"/>
				<enemy name="unit1" delay="9"/>
				<enemy name="unit2" delay="12"/>
				<enemy name="wheel" delay="4"/>
		</wave>
		<wave pause="0" lifeTime="40" side="right" img="1">
		        <enemy name="unit1" delay="1"/>
				<enemy name="unit1" delay="2"/>
				<enemy name="unit2" delay="2"/>
				<enemy name="unit1" delay="5"/>
				<enemy name="unit1" delay="9"/>
				<enemy name="unit2" delay="12"/>
				<enemy name="wheel" delay="4"/>
		</wave>
	</group>
	<group pause="1">
		<wave pause="0" lifeTime="20" side="left" img="1">
				<enemy name="wheel" delay="4"/>
				<enemy name="wheel" delay="5"/>
				<enemy name="wheel" delay="6"/>
				<enemy name="wheel" delay="7"/>
				<enemy name="wheel" delay="8"/>
		</wave>
	</group>
	<group pause="5">
		<wave pause="0" lifeTime="40" side="left" img="1">
				<enemy name="unit2" delay="2"/>
				<enemy name="unit1" delay="3"/>
				<enemy name="unit2" delay="4"/>
				<enemy name="unit1" delay="5"/>
				<enemy name="unit2" delay="6"/>
				<enemy name="unit1" delay="7"/>
				<enemy name="unit2" delay="8"/>
				<enemy name="unit1" delay="9"/>
		</wave>
		<wave pause="0" lifeTime="40" side="right" img="1">
		        <enemy name="unit2" delay="2"/>
				<enemy name="unit1" delay="3"/>
				<enemy name="unit2" delay="4"/>
				<enemy name="unit1" delay="5"/>
				<enemy name="unit2" delay="6"/>
				<enemy name="unit1" delay="7"/>
				<enemy name="unit2" delay="8"/>
				<enemy name="unit1" delay="9"/>
		</wave>
	</group>
	
</level>;
            var _loc_4:* = <level eye=""normal"" money=""24000"" maxTower=""3"" maxUpgrade=""1"" bg=""1"" threeStarHealth=""80"" twoStarHealth=""60"" preStartMoney=""2000"">
n	t<!-- 
n	t	tpause - пауза перед появлением, (секунды)
n	t	tlifeTime - время жизни волны, (секунды)
n	t	timg - картинка, иконка досрочного вызова волны
n	t	tside - сторона, откуда появится враг (left, right), - можно указывать целиком волне и также отдельным юнитам
n	t-->
n
n	t<group pause=""5"">
n	t	t<wave pause=""0"" lifeTime=""20"" side=""left"" img=""1"">
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""20"" side=""right"" img=""1"">
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""5"">
n	t	t<wave pause=""0"" lifeTime=""30"" side=""left"" img=""1"">
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""6""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""wheel"" delay=""15""/>
n	t	t	t<enemy name=""wheel"" delay=""20""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""30"" side=""right"" img=""1"">
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""6""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""wheel"" delay=""15""/>
n	t	t	t<enemy name=""wheel"" delay=""20""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""20"" side=""left"" img=""1"">
n	t	t	t <enemy name=""unit2"" delay=""3""/>
n	t	t	t <enemy name=""unit2"" delay=""5""/>
n	t	t	t <enemy name=""unit2"" delay=""8""/>
n	t	t     <enemy name=""unit2-line-3"" delay=""10""/>
n	t	t	t <enemy name=""unit2-line-3"" delay=""13""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""20"" side=""right"" img=""1"">
n             <enemy name=""unit2"" delay=""3""/>
n             <enemy name=""unit2"" delay=""5""/>
n	t	t	t <enemy name=""unit2"" delay=""8""/>
n	t	t     <enemy name=""unit2-line-3"" delay=""10""/>
n	t	t	t <enemy name=""unit2-line-3"" delay=""13""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""40"" side=""left"" img=""1"">
n	t	t	t <enemy name=""unit2"" delay=""5""/>
n	t	t	t <enemy name=""unit2"" delay=""6""/>
n	t	t	t <enemy name=""unit2"" delay=""9""/>
n	t	t	t <enemy name=""unit2"" delay=""10""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""40"" side=""right"" img=""1"">
n             <enemy name=""unit2"" delay=""5""/>
n	t	t	t <enemy name=""unit2"" delay=""6""/>
n	t	t	t <enemy name=""unit2"" delay=""9""/>
n	t	t	t <enemy name=""unit2"" delay=""10""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""20"" side=""left"" img=""1"">
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit1"" delay=""17""/>
n	t	t	t<enemy name=""unit1"" delay=""17""/>
n	t	t	t<enemy name=""unit1"" delay=""18""/>
n	t	t	t<enemy name=""unit1"" delay=""18""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""5"">
n	t	t<wave pause=""0"" lifeTime=""20"" side=""right"" img=""1"">
n             <enemy name=""car"" delay=""5""/>
n	t	t	t <enemy name=""car"" delay=""10""/>
n	t	t     <enemy name=""car"" delay=""15""/>
n	t	t	t <enemy name=""car"" delay=""20""/>
n	t	t</wave>
n	t</group>
n	t
n</level>")("<level eye="normal" money="24000" maxTower="3" maxUpgrade="1" bg="1" threeStarHealth="80" twoStarHealth="60" preStartMoney="2000">
	<!-- 
		pause - пауза перед появлением, (секунды)
		lifeTime - время жизни волны, (секунды)
		img - картинка, иконка досрочного вызова волны
		side - сторона, откуда появится враг (left, right), - можно указывать целиком волне и также отдельным юнитам
	-->

	<group pause="5">
		<wave pause="0" lifeTime="20" side="left" img="1">
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit1" delay="11"/>
		</wave>
		<wave pause="0" lifeTime="20" side="right" img="1">
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit1" delay="11"/>
		</wave>
	</group>
	<group pause="5">
		<wave pause="0" lifeTime="30" side="left" img="1">
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit1" delay="6"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="wheel" delay="15"/>
			<enemy name="wheel" delay="20"/>
		</wave>
		<wave pause="0" lifeTime="30" side="right" img="1">
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit1" delay="6"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="wheel" delay="15"/>
			<enemy name="wheel" delay="20"/>
		</wave>
	</group>
	<group pause="0">
		<wave pause="0" lifeTime="20" side="left" img="1">
			 <enemy name="unit2" delay="3"/>
			 <enemy name="unit2" delay="5"/>
			 <enemy name="unit2" delay="8"/>
		     <enemy name="unit2-line-3" delay="10"/>
			 <enemy name="unit2-line-3" delay="13"/>
		</wave>
		<wave pause="0" lifeTime="20" side="right" img="1">
             <enemy name="unit2" delay="3"/>
             <enemy name="unit2" delay="5"/>
			 <enemy name="unit2" delay="8"/>
		     <enemy name="unit2-line-3" delay="10"/>
			 <enemy name="unit2-line-3" delay="13"/>
		</wave>
	</group>
	<group pause="0">
		<wave pause="0" lifeTime="40" side="left" img="1">
			 <enemy name="unit2" delay="5"/>
			 <enemy name="unit2" delay="6"/>
			 <enemy name="unit2" delay="9"/>
			 <enemy name="unit2" delay="10"/>
		</wave>
		<wave pause="0" lifeTime="40" side="right" img="1">
             <enemy name="unit2" delay="5"/>
			 <enemy name="unit2" delay="6"/>
			 <enemy name="unit2" delay="9"/>
			 <enemy name="unit2" delay="10"/>
		</wave>
	</group>
	<group pause="0">
		<wave pause="0" lifeTime="20" side="left" img="1">
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit1" delay="7"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit1" delay="17"/>
			<enemy name="unit1" delay="17"/>
			<enemy name="unit1" delay="18"/>
			<enemy name="unit1" delay="18"/>
		</wave>
	</group>
	<group pause="5">
		<wave pause="0" lifeTime="20" side="right" img="1">
             <enemy name="car" delay="5"/>
			 <enemy name="car" delay="10"/>
		     <enemy name="car" delay="15"/>
			 <enemy name="car" delay="20"/>
		</wave>
	</group>
	
</level>;
            var _loc_5:* = <level eye=""normal"" money=""29000"" maxTower=""4"" maxUpgrade=""1"" bg=""2"" threeStarHealth=""80"" twoStarHealth=""60"" preStartMoney=""2000"">
n	t<!-- 
n	t	tpause - пауза перед появлением, (секунды)
n	t	tlifeTime - время жизни волны, (секунды)
n	t	timg - картинка, иконка досрочного вызова волны
n	t	tside - сторона, откуда появится враг (left, right), - можно указывать целиком волне и также отдельным юнитам
n	t-->
n
n	t<group pause=""5"">
n	t	t<wave pause=""0"" lifeTime=""20"" side=""left"" img=""1"">
n	t	t	t<enemy name=""aerostat"" delay=""1""/>
n	t	t	t<enemy name=""aerostat"" delay=""10""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""20"" side=""right"" img=""1"">
n            <enemy name=""aerostat"" delay=""1""/>
n	t	t	t<enemy name=""aerostat"" delay=""10""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""20"" side=""left"" img=""1"">
n	t	t	t<enemy name=""aerostat"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""18""/>
n	t	t	t<enemy name=""unit1"" delay=""19""/>
n	t	t	t<enemy name=""unit1"" delay=""20""/>
n	t	t	t<enemy name=""aerostat"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""20"" side=""right"" img=""1"">
n	t	t	t<enemy name=""aerostat"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""18""/>
n	t	t	t<enemy name=""unit1"" delay=""19""/>
n	t	t	t<enemy name=""unit1"" delay=""20""/>
n	t	t	t<enemy name=""aerostat"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""3"">
n	t	t<wave pause=""0"" lifeTime=""20"" side=""left"" img=""1"">
n	t	t	t<enemy name=""unit2"" delay=""1""/>
n	t	t	t<enemy name=""unit2"" delay=""2""/>
n	t	t	t<enemy name=""unit2"" delay=""3""/>
n	t	t	t<enemy name=""unit2"" delay=""4""/>
n	t	t	t<enemy name=""unit2"" delay=""5""/>
n	t	t	t<enemy name=""unit2"" delay=""6""/>
n	t	t	t<enemy name=""unit2"" delay=""7""/>
n	t	t	t<enemy name=""unit2"" delay=""8""/>
n	t	t	t<enemy name=""unit2"" delay=""9""/>
n	t	t	t<enemy name=""unit1-line-3"" delay=""10""/>
n	t	t	t<enemy name=""unit1-line-3"" delay=""12""/>
n	t	t	t<enemy name=""unit2"" delay=""13""/>
n	t	t	t<enemy name=""unit2"" delay=""14""/>
n	t	t	t<enemy name=""unit2"" delay=""15""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""20"" side=""right"" img=""1"">
n	t	t    <enemy name=""aerostat"" delay=""1""/>
n	t	t    <enemy name=""aerostat"" delay=""5""/>
n	t	t	t<enemy name=""aerostat"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""6""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit1-line-3"" delay=""10""/>
n	t	t	t<enemy name=""unit1-line-3"" delay=""12""/>
n	t	t	t<enemy name=""unit2"" delay=""13""/>
n	t	t	t<enemy name=""unit2"" delay=""14""/>
n	t	t	t<enemy name=""unit2"" delay=""15""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""20"" side=""left"" img=""1"">
n	t	t    <enemy name=""unit2"" delay=""1""/>
n	t	t	t<enemy name=""unit2"" delay=""5""/>
n	t	t	t<enemy name=""unit2"" delay=""10""/>
n	t	t    <enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""12""/>
n	t	t	t<enemy name=""unit1"" delay=""12""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""20""/>
n	t	t	t<enemy name=""unit1"" delay=""20""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""20"" side=""right"" img=""1"">
n	t	t    <enemy name=""unit2"" delay=""1""/>
n	t	t	t<enemy name=""unit2"" delay=""5""/>
n	t	t	t<enemy name=""unit2"" delay=""10""/>
n	t	t    <enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""12""/>
n	t	t	t<enemy name=""unit1"" delay=""12""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""20""/>
n	t	t	t<enemy name=""unit1"" delay=""20""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""20"" side=""left"" img=""1"">
n	t	t	t<enemy name=""airplane"" delay=""5""/>
n	t	t	t<enemy name=""airplane"" delay=""7""/>
n	t	t	t<enemy name=""airplane"" delay=""9""/>
n	t	t	t<enemy name=""airplane"" delay=""11""/>
n	t	t	t<enemy name=""airplane"" delay=""13""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""20"" side=""right"" img=""1"">
n	t	t    <enemy name=""airplane"" delay=""5""/>
n	t	t	t<enemy name=""airplane"" delay=""7""/>
n	t	t	t<enemy name=""airplane"" delay=""9""/>
n	t	t	t<enemy name=""airplane"" delay=""11""/>
n	t	t	t<enemy name=""airplane"" delay=""13""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""3"">
n	t	t<wave pause=""0"" lifeTime=""20"" side=""left"" img=""1"">
n             <enemy name=""unit1"" delay=""2""/>
n	t	t     <enemy name=""car"" delay=""3""/>
n	t	t	t <enemy name=""car"" delay=""8""/>
n	t	t	t <enemy name=""unit1"" delay=""10""/>
n	t	t	t <enemy name=""unit1"" delay=""11""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""20"" side=""right"" img=""1"">
n             <enemy name=""unit1"" delay=""2""/>
n	t	t     <enemy name=""car"" delay=""3""/>
n	t	t	t <enemy name=""car"" delay=""8""/>
n	t	t	t <enemy name=""unit1"" delay=""10""/>
n	t	t	t <enemy name=""unit1"" delay=""11""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""3"">
n	t	t<wave pause=""0"" lifeTime=""20"" side=""left"" img=""1"">
n	t	t	t<enemy name=""aerostat"" delay=""1""/>
n	t	t	t<enemy name=""aerostat"" delay=""5""/>
n	t	t	t<enemy name=""aerostat"" delay=""10""/>
n	t	t	t<enemy name=""airplane"" delay=""5""/>
n	t	t	t<enemy name=""airplane"" delay=""7""/>
n	t	t	t<enemy name=""unit2"" delay=""3""/>
n	t	t	t<enemy name=""unit2"" delay=""4""/>
n	t	t	t<enemy name=""unit2"" delay=""5""/>
n	t	t	t<enemy name=""unit2"" delay=""6""/>
n	t	t	t<enemy name=""unit1-line-3"" delay=""10""/>
n	t	t	t<enemy name=""unit1-line-3"" delay=""11""/>
n	t	t	t<enemy name=""unit2-line-2"" delay=""13""/>
n	t	t	t<enemy name=""unit2-line-2"" delay=""14""/>
n	t	t	t<enemy name=""unit2-line-2"" delay=""15""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""20"" side=""right"" img=""1"">
n	t	t    <enemy name=""aerostat"" delay=""1""/>
n	t	t	t<enemy name=""aerostat"" delay=""5""/>
n	t	t	t<enemy name=""aerostat"" delay=""10""/>
n	t	t	t<enemy name=""airplane"" delay=""5""/>
n	t	t	t<enemy name=""airplane"" delay=""7""/>
n	t	t	t<enemy name=""unit2"" delay=""3""/>
n	t	t	t<enemy name=""unit2"" delay=""4""/>
n	t	t	t<enemy name=""unit2"" delay=""5""/>
n	t	t	t<enemy name=""unit2"" delay=""6""/>
n	t	t	t<enemy name=""unit1-line-3"" delay=""10""/>
n	t	t	t<enemy name=""unit1-line-3"" delay=""11""/>
n	t	t	t<enemy name=""unit2-line-2"" delay=""13""/>
n	t	t	t<enemy name=""unit2-line-2"" delay=""14""/>
n	t	t	t<enemy name=""unit2-line-2"" delay=""15""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""3"">
n	t	t<wave pause=""0"" lifeTime=""20"" side=""left"" img=""1"">
n             <enemy name=""car"" delay=""2""/>
n             <enemy name=""car"" delay=""6""/>
n	t	t     <enemy name=""car"" delay=""10""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""20"" side=""right"" img=""1"">
n             <enemy name=""car"" delay=""2""/>
n             <enemy name=""car"" delay=""6""/>
n	t	t     <enemy name=""car"" delay=""10""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""5"">
n	t	t<wave pause=""0"" lifeTime=""30"" side=""left"" img=""1"">
n	t	t     <enemy name=""unit1-line-3"" delay=""1""/>
n             <enemy name=""tank1"" delay=""1""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""30"" side=""right"" img=""1"">
n             <enemy name=""unit1-line-3"" delay=""1""/>
n	t	t	t <enemy name=""tank1"" delay=""1""/>
n	t	t</wave>
n	t</group>
n</level>")("<level eye="normal" money="29000" maxTower="4" maxUpgrade="1" bg="2" threeStarHealth="80" twoStarHealth="60" preStartMoney="2000">
	<!-- 
		pause - пауза перед появлением, (секунды)
		lifeTime - время жизни волны, (секунды)
		img - картинка, иконка досрочного вызова волны
		side - сторона, откуда появится враг (left, right), - можно указывать целиком волне и также отдельным юнитам
	-->

	<group pause="5">
		<wave pause="0" lifeTime="20" side="left" img="1">
			<enemy name="aerostat" delay="1"/>
			<enemy name="aerostat" delay="10"/>
		</wave>
		<wave pause="0" lifeTime="20" side="right" img="1">
            <enemy name="aerostat" delay="1"/>
			<enemy name="aerostat" delay="10"/>
		</wave>
	</group>
	<group pause="0">
		<wave pause="0" lifeTime="20" side="left" img="1">
			<enemy name="aerostat" delay="1"/>
			<enemy name="unit1" delay="18"/>
			<enemy name="unit1" delay="19"/>
			<enemy name="unit1" delay="20"/>
			<enemy name="aerostat" delay="7"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="15"/>
		</wave>
		<wave pause="0" lifeTime="20" side="right" img="1">
			<enemy name="aerostat" delay="1"/>
			<enemy name="unit1" delay="18"/>
			<enemy name="unit1" delay="19"/>
			<enemy name="unit1" delay="20"/>
			<enemy name="aerostat" delay="7"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="15"/>
		</wave>
	</group>
	<group pause="3">
		<wave pause="0" lifeTime="20" side="left" img="1">
			<enemy name="unit2" delay="1"/>
			<enemy name="unit2" delay="2"/>
			<enemy name="unit2" delay="3"/>
			<enemy name="unit2" delay="4"/>
			<enemy name="unit2" delay="5"/>
			<enemy name="unit2" delay="6"/>
			<enemy name="unit2" delay="7"/>
			<enemy name="unit2" delay="8"/>
			<enemy name="unit2" delay="9"/>
			<enemy name="unit1-line-3" delay="10"/>
			<enemy name="unit1-line-3" delay="12"/>
			<enemy name="unit2" delay="13"/>
			<enemy name="unit2" delay="14"/>
			<enemy name="unit2" delay="15"/>
		</wave>
		<wave pause="0" lifeTime="20" side="right" img="1">
		    <enemy name="aerostat" delay="1"/>
		    <enemy name="aerostat" delay="5"/>
			<enemy name="aerostat" delay="10"/>
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="6"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit1-line-3" delay="10"/>
			<enemy name="unit1-line-3" delay="12"/>
			<enemy name="unit2" delay="13"/>
			<enemy name="unit2" delay="14"/>
			<enemy name="unit2" delay="15"/>
		</wave>
	</group>
	<group pause="0">
		<wave pause="0" lifeTime="20" side="left" img="1">
		    <enemy name="unit2" delay="1"/>
			<enemy name="unit2" delay="5"/>
			<enemy name="unit2" delay="10"/>
		    <enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="12"/>
			<enemy name="unit1" delay="12"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="20"/>
			<enemy name="unit1" delay="20"/>
		</wave>
		<wave pause="0" lifeTime="20" side="right" img="1">
		    <enemy name="unit2" delay="1"/>
			<enemy name="unit2" delay="5"/>
			<enemy name="unit2" delay="10"/>
		    <enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="12"/>
			<enemy name="unit1" delay="12"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="20"/>
			<enemy name="unit1" delay="20"/>
		</wave>
	</group>
	<group pause="0">
		<wave pause="0" lifeTime="20" side="left" img="1">
			<enemy name="airplane" delay="5"/>
			<enemy name="airplane" delay="7"/>
			<enemy name="airplane" delay="9"/>
			<enemy name="airplane" delay="11"/>
			<enemy name="airplane" delay="13"/>
		</wave>
		<wave pause="0" lifeTime="20" side="right" img="1">
		    <enemy name="airplane" delay="5"/>
			<enemy name="airplane" delay="7"/>
			<enemy name="airplane" delay="9"/>
			<enemy name="airplane" delay="11"/>
			<enemy name="airplane" delay="13"/>
		</wave>
	</group>
	<group pause="3">
		<wave pause="0" lifeTime="20" side="left" img="1">
             <enemy name="unit1" delay="2"/>
		     <enemy name="car" delay="3"/>
			 <enemy name="car" delay="8"/>
			 <enemy name="unit1" delay="10"/>
			 <enemy name="unit1" delay="11"/>
		</wave>
		<wave pause="0" lifeTime="20" side="right" img="1">
             <enemy name="unit1" delay="2"/>
		     <enemy name="car" delay="3"/>
			 <enemy name="car" delay="8"/>
			 <enemy name="unit1" delay="10"/>
			 <enemy name="unit1" delay="11"/>
		</wave>
	</group>
	<group pause="3">
		<wave pause="0" lifeTime="20" side="left" img="1">
			<enemy name="aerostat" delay="1"/>
			<enemy name="aerostat" delay="5"/>
			<enemy name="aerostat" delay="10"/>
			<enemy name="airplane" delay="5"/>
			<enemy name="airplane" delay="7"/>
			<enemy name="unit2" delay="3"/>
			<enemy name="unit2" delay="4"/>
			<enemy name="unit2" delay="5"/>
			<enemy name="unit2" delay="6"/>
			<enemy name="unit1-line-3" delay="10"/>
			<enemy name="unit1-line-3" delay="11"/>
			<enemy name="unit2-line-2" delay="13"/>
			<enemy name="unit2-line-2" delay="14"/>
			<enemy name="unit2-line-2" delay="15"/>
		</wave>
		<wave pause="0" lifeTime="20" side="right" img="1">
		    <enemy name="aerostat" delay="1"/>
			<enemy name="aerostat" delay="5"/>
			<enemy name="aerostat" delay="10"/>
			<enemy name="airplane" delay="5"/>
			<enemy name="airplane" delay="7"/>
			<enemy name="unit2" delay="3"/>
			<enemy name="unit2" delay="4"/>
			<enemy name="unit2" delay="5"/>
			<enemy name="unit2" delay="6"/>
			<enemy name="unit1-line-3" delay="10"/>
			<enemy name="unit1-line-3" delay="11"/>
			<enemy name="unit2-line-2" delay="13"/>
			<enemy name="unit2-line-2" delay="14"/>
			<enemy name="unit2-line-2" delay="15"/>
		</wave>
	</group>
	<group pause="3">
		<wave pause="0" lifeTime="20" side="left" img="1">
             <enemy name="car" delay="2"/>
             <enemy name="car" delay="6"/>
		     <enemy name="car" delay="10"/>
		</wave>
		<wave pause="0" lifeTime="20" side="right" img="1">
             <enemy name="car" delay="2"/>
             <enemy name="car" delay="6"/>
		     <enemy name="car" delay="10"/>
		</wave>
	</group>
	<group pause="5">
		<wave pause="0" lifeTime="30" side="left" img="1">
		     <enemy name="unit1-line-3" delay="1"/>
             <enemy name="tank1" delay="1"/>
		</wave>
		<wave pause="0" lifeTime="30" side="right" img="1">
             <enemy name="unit1-line-3" delay="1"/>
			 <enemy name="tank1" delay="1"/>
		</wave>
	</group>
</level>;
            var _loc_6:* = <level eye=""normal"" money=""32000"" maxTower=""4"" maxUpgrade=""2"" upgradeTwo=""false"" bg=""2"" threeStarHealth=""80"" twoStarHealth=""60"" preStartMoney=""2000"">
n	t<!-- 
n	t	tpause - пауза перед появлением, (секунды)
n	t	tlifeTime - время жизни волны, (секунды)
n	t	timg - картинка, иконка досрочного вызова волны
n	t	tside - сторона, откуда появится враг (left, right), - можно указывать целиком волне и также отдельным юнитам
n	t-->
n	t<group pause=""5"">
n	t	t<wave pause=""0"" lifeTime=""20"" side=""left"" img=""1"">
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""20"" side=""right"" img=""1"">
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""2"">
n	t	t<wave pause=""0"" lifeTime=""10"" side=""right"" img=""1"">
n            <enemy name=""unit2"" delay=""1""/>
n	t	t	t<enemy name=""unit2"" delay=""6""/>
n	t	t	t<enemy name=""unit2"" delay=""10""/>
n	t	t	t<enemy name=""unit2"" delay=""16""/>
n	t	t	t<enemy name=""unit2"" delay=""20""/>
n	t	t	t<enemy name=""unit2"" delay=""26""/>
n	t	t	t<enemy name=""unit2"" delay=""30""/>
n	t	t	t<enemy name=""unit2"" delay=""36""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""10"" side=""left"" img=""1"">
n	t	t	t<enemy name=""aerostat"" delay=""1""/>
n	t	t	t<enemy name=""aerostat"" delay=""6""/>
n	t	t	t<enemy name=""aerostat"" delay=""10""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""10"" side=""right"" img=""1"">
n            <enemy name=""aerostat"" delay=""1""/>
n	t	t	t<enemy name=""aerostat"" delay=""6""/>
n	t	t	t<enemy name=""aerostat"" delay=""10""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""2"">
n	t	t<wave pause=""0"" lifeTime=""10"" side=""left"" img=""1"">
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""tanket"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""tanket"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""10"" side=""right"" img=""1"">
n            <enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""tanket"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""tanket"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""10"">
n	t	t<wave pause=""0"" lifeTime=""10"" side=""left"" img=""1"">
n	t	t	t	t<enemy name=""wheel"" delay=""4""/>
n	t	t	t	t<enemy name=""wheel"" delay=""5""/>
n	t	t	t	t<enemy name=""wheel"" delay=""6""/>
n	t	t	t	t<enemy name=""wheel"" delay=""7""/>
n	t	t	t	t<enemy name=""wheel"" delay=""8""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""20"" side=""right"" img=""1"">
n	t	t	t	t<enemy name=""wheel"" delay=""4""/>
n	t	t	t	t<enemy name=""wheel"" delay=""5""/>
n	t	t	t	t<enemy name=""wheel"" delay=""6""/>
n	t	t	t	t<enemy name=""wheel"" delay=""7""/>
n	t	t	t	t<enemy name=""wheel"" delay=""8""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""20"" side=""left"" img=""1"">
n	t	t	t<enemy name=""airplane"" delay=""5""/>
n	t	t	t<enemy name=""airplane"" delay=""6""/>
n	t	t	t<enemy name=""airplane"" delay=""7""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""20"" side=""right"" img=""1"">
n	t	t	t<enemy name=""airplane"" delay=""5""/>
n	t	t	t<enemy name=""airplane"" delay=""6""/>
n	t	t	t<enemy name=""airplane"" delay=""7""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""5"">
n	t	t<wave pause=""0"" lifeTime=""5"" side=""left"" img=""1"">
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit2"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit2"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t<enemy name=""unit2"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""18""/>
n	t	t	t<enemy name=""unit1"" delay=""19""/>
n	t	t	t<enemy name=""unit1"" delay=""20""/>
n	t	t	t<enemy name=""unit1"" delay=""20""/>
n	t	t	t<enemy name=""unit1"" delay=""22""/>
n	t	t	t<enemy name=""unit1"" delay=""24""/>
n	t	t	t<enemy name=""unit1"" delay=""26""/>
n	t	t	t<enemy name=""unit1"" delay=""27""/>
n	t	t	t<enemy name=""unit1"" delay=""28""/>
n	t	t	t<enemy name=""unit1"" delay=""28""/>
n	t	t	t<enemy name=""unit1"" delay=""30""/>
n	t	t	t<enemy name=""unit1"" delay=""31""/>
n	t	t	t<enemy name=""unit1"" delay=""34""/>
n	t	t	t<enemy name=""unit1"" delay=""35""/>
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""17""/>
n	t	t	t<enemy name=""unit1"" delay=""18""/>
n	t	t	t<enemy name=""unit1"" delay=""19""/>
n	t	t	t<enemy name=""unit1"" delay=""20""/>
n	t	t	t<enemy name=""unit1"" delay=""22""/>
n	t	t	t<enemy name=""unit1"" delay=""23""/>
n	t	t	t<enemy name=""unit1"" delay=""24""/>
n	t	t	t<enemy name=""unit1"" delay=""26""/>
n	t	t	t<enemy name=""unit1"" delay=""27""/>
n	t	t	t<enemy name=""unit1"" delay=""28""/>
n	t	t	t<enemy name=""unit1"" delay=""30""/>
n	t	t	t<enemy name=""unit1"" delay=""31""/>
n	t	t	t<enemy name=""unit1"" delay=""32""/>
n	t	t	t<enemy name=""unit1"" delay=""34""/>
n	t	t	t<enemy name=""unit1"" delay=""35""/>
n	t	t	t<enemy name=""unit1"" delay=""36""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""20"" side=""right"" img=""1"">
n             <enemy name=""car"" delay=""2""/>
n	t	t	t <enemy name=""tanket"" delay=""7""/>
n	t	t     <enemy name=""car"" delay=""12""/>
n	t	t	t <enemy name=""wheel"" delay=""15""/>
n	t	t	t <enemy name=""car"" delay=""18""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""5"">
n	t	t<wave pause=""0"" lifeTime=""30"" side=""left"" img=""1"">
n             <enemy name=""heli"" delay=""1""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""30"" side=""right"" img=""1"">
n             <enemy name=""heli"" delay=""1""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""3"">
n	t	t<wave pause=""0"" lifeTime=""30"" side=""left"" img=""1"">
n	t	t	t<enemy name=""airplane"" delay=""5""/>
n	t	t	t<enemy name=""airplane"" delay=""7""/>
n	t	t	t<enemy name=""airplane"" delay=""9""/>
n	t	t	t<enemy name=""airplane"" delay=""11""/>
n	t	t	t<enemy name=""airplane"" delay=""13""/>
n	t	t	t<enemy name=""heli"" delay=""1""/>
n	t	t	t<enemy name=""heli"" delay=""3""/>
n	t	t	t<enemy name=""heli"" delay=""7""/>
n	t	t	t<enemy name=""heli"" delay=""10""/>
n	t	t	t<enemy name=""heli"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""30"" side=""right"" img=""1"">
n	t	t	t<enemy name=""airplane"" delay=""5""/>
n	t	t	t<enemy name=""airplane"" delay=""7""/>
n	t	t	t<enemy name=""airplane"" delay=""9""/>
n	t	t	t<enemy name=""airplane"" delay=""11""/>
n	t	t	t<enemy name=""airplane"" delay=""13""/>
n	t	t	t<enemy name=""heli"" delay=""1""/>
n	t	t	t<enemy name=""heli"" delay=""3""/>
n	t	t	t<enemy name=""heli"" delay=""7""/>
n	t	t	t<enemy name=""heli"" delay=""10""/>
n	t	t	t<enemy name=""heli"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""7"">
n	t	t<wave pause=""0"" lifeTime=""40"" side=""left"" img=""1"">
n	t	t	t <enemy name=""unit2"" delay=""5""/>
n	t	t	t <enemy name=""unit2"" delay=""5""/>
n	t	t	t <enemy name=""unit2"" delay=""6""/>
n	t	t	t <enemy name=""unit2"" delay=""6""/>
n	t	t	t <enemy name=""unit2"" delay=""7""/>
n	t	t	t <enemy name=""unit2"" delay=""7""/>
n	t	t	t <enemy name=""unit2"" delay=""10""/>
n	t	t	t <enemy name=""unit2"" delay=""10""/>
n	t	t	t <enemy name=""unit2"" delay=""11""/>
n	t	t	t <enemy name=""unit2"" delay=""11""/>
n	t	t	t <enemy name=""unit2"" delay=""12""/>
n	t	t	t <enemy name=""unit2"" delay=""12""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""40"" side=""right"" img=""1"">
n             <enemy name=""unit2"" delay=""5""/>
n	t	t	t <enemy name=""unit2"" delay=""5""/>
n	t	t	t <enemy name=""unit2"" delay=""6""/>
n	t	t	t <enemy name=""unit2"" delay=""6""/>
n	t	t	t <enemy name=""unit2"" delay=""7""/>
n	t	t	t <enemy name=""unit2"" delay=""7""/>
n	t	t	t <enemy name=""unit2"" delay=""10""/>
n	t	t	t <enemy name=""unit2"" delay=""10""/>
n	t	t	t <enemy name=""unit2"" delay=""11""/>
n	t	t	t <enemy name=""unit2"" delay=""11""/>
n	t	t	t <enemy name=""unit2"" delay=""12""/>
n	t	t	t <enemy name=""unit2"" delay=""12""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""3"">
n	t	t<wave pause=""0"" lifeTime=""20"" side=""left"" img=""1"">
n	t	t	t<enemy name=""aerostat"" delay=""1""/>
n	t	t	t<enemy name=""aerostat"" delay=""10""/>
n	t	t	t<enemy name=""airplane"" delay=""5""/>
n	t	t	t<enemy name=""airplane"" delay=""7""/>
n	t	t	t<enemy name=""airplane"" delay=""9""/>
n	t	t	t<enemy name=""airplane"" delay=""11""/>
n	t	t	t<enemy name=""unit2"" delay=""3""/>
n	t	t	t<enemy name=""unit2"" delay=""6""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""20"" side=""right"" img=""1"">
n	t	t    <enemy name=""aerostat"" delay=""1""/>
n	t	t	t<enemy name=""aerostat"" delay=""10""/>
n	t	t	t<enemy name=""airplane"" delay=""5""/>
n	t	t	t<enemy name=""airplane"" delay=""7""/>
n	t	t	t<enemy name=""airplane"" delay=""9""/>
n	t	t	t<enemy name=""airplane"" delay=""11""/>
n	t	t	t<enemy name=""unit2"" delay=""3""/>
n	t	t	t<enemy name=""unit2"" delay=""6""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""5"">
n	t	t<wave pause=""0"" lifeTime=""30"" side=""left"" img=""1"">
n             <enemy name=""tank1"" delay=""1""/>
n	t	t	t <enemy name=""tank1"" delay=""7""/>
n	t	t	t <enemy name=""unit1"" delay=""10""/>
n	t	t	t <enemy name=""unit1"" delay=""11""/>
n	t	t	t <enemy name=""unit1"" delay=""12""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""30"" side=""right"" img=""1"">
n             <enemy name=""tank1"" delay=""1""/>
n	t	t	t <enemy name=""tank1"" delay=""7""/>
n	t	t	t <enemy name=""unit1"" delay=""10""/>
n	t	t	t <enemy name=""unit1"" delay=""11""/>
n	t	t	t <enemy name=""unit1"" delay=""12""/>
n	t	t</wave>
n	t</group>
n</level>")("<level eye="normal" money="32000" maxTower="4" maxUpgrade="2" upgradeTwo="false" bg="2" threeStarHealth="80" twoStarHealth="60" preStartMoney="2000">
	<!-- 
		pause - пауза перед появлением, (секунды)
		lifeTime - время жизни волны, (секунды)
		img - картинка, иконка досрочного вызова волны
		side - сторона, откуда появится враг (left, right), - можно указывать целиком волне и также отдельным юнитам
	-->
	<group pause="5">
		<wave pause="0" lifeTime="20" side="left" img="1">
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="9"/>
		</wave>
		<wave pause="0" lifeTime="20" side="right" img="1">
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="9"/>
		</wave>
	</group>
	<group pause="2">
		<wave pause="0" lifeTime="10" side="right" img="1">
            <enemy name="unit2" delay="1"/>
			<enemy name="unit2" delay="6"/>
			<enemy name="unit2" delay="10"/>
			<enemy name="unit2" delay="16"/>
			<enemy name="unit2" delay="20"/>
			<enemy name="unit2" delay="26"/>
			<enemy name="unit2" delay="30"/>
			<enemy name="unit2" delay="36"/>
		</wave>
	</group>
	<group pause="0">
		<wave pause="0" lifeTime="10" side="left" img="1">
			<enemy name="aerostat" delay="1"/>
			<enemy name="aerostat" delay="6"/>
			<enemy name="aerostat" delay="10"/>
		</wave>
		<wave pause="0" lifeTime="10" side="right" img="1">
            <enemy name="aerostat" delay="1"/>
			<enemy name="aerostat" delay="6"/>
			<enemy name="aerostat" delay="10"/>
		</wave>
	</group>
	<group pause="2">
		<wave pause="0" lifeTime="10" side="left" img="1">
			<enemy name="unit1" delay="1"/>
			<enemy name="tanket" delay="3"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="tanket" delay="7"/>
			<enemy name="unit1" delay="10"/>
		</wave>
		<wave pause="0" lifeTime="10" side="right" img="1">
            <enemy name="unit1" delay="1"/>
			<enemy name="tanket" delay="3"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="tanket" delay="7"/>
			<enemy name="unit1" delay="10"/>
		</wave>
	</group>
	<group pause="10">
		<wave pause="0" lifeTime="10" side="left" img="1">
				<enemy name="wheel" delay="4"/>
				<enemy name="wheel" delay="5"/>
				<enemy name="wheel" delay="6"/>
				<enemy name="wheel" delay="7"/>
				<enemy name="wheel" delay="8"/>
		</wave>
		<wave pause="0" lifeTime="20" side="right" img="1">
				<enemy name="wheel" delay="4"/>
				<enemy name="wheel" delay="5"/>
				<enemy name="wheel" delay="6"/>
				<enemy name="wheel" delay="7"/>
				<enemy name="wheel" delay="8"/>
		</wave>
	</group>
	<group pause="0">
		<wave pause="0" lifeTime="20" side="left" img="1">
			<enemy name="airplane" delay="5"/>
			<enemy name="airplane" delay="6"/>
			<enemy name="airplane" delay="7"/>
		</wave>
		<wave pause="0" lifeTime="20" side="right" img="1">
			<enemy name="airplane" delay="5"/>
			<enemy name="airplane" delay="6"/>
			<enemy name="airplane" delay="7"/>
		</wave>
	</group>
	<group pause="5">
		<wave pause="0" lifeTime="5" side="left" img="1">
			<enemy name="unit1" delay="1"/>
			<enemy name="unit2" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit2" delay="5"/>
			<enemy name="unit1" delay="7"/>
			<enemy name="unit2" delay="8"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="18"/>
			<enemy name="unit1" delay="19"/>
			<enemy name="unit1" delay="20"/>
			<enemy name="unit1" delay="20"/>
			<enemy name="unit1" delay="22"/>
			<enemy name="unit1" delay="24"/>
			<enemy name="unit1" delay="26"/>
			<enemy name="unit1" delay="27"/>
			<enemy name="unit1" delay="28"/>
			<enemy name="unit1" delay="28"/>
			<enemy name="unit1" delay="30"/>
			<enemy name="unit1" delay="31"/>
			<enemy name="unit1" delay="34"/>
			<enemy name="unit1" delay="35"/>
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit1" delay="7"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="17"/>
			<enemy name="unit1" delay="18"/>
			<enemy name="unit1" delay="19"/>
			<enemy name="unit1" delay="20"/>
			<enemy name="unit1" delay="22"/>
			<enemy name="unit1" delay="23"/>
			<enemy name="unit1" delay="24"/>
			<enemy name="unit1" delay="26"/>
			<enemy name="unit1" delay="27"/>
			<enemy name="unit1" delay="28"/>
			<enemy name="unit1" delay="30"/>
			<enemy name="unit1" delay="31"/>
			<enemy name="unit1" delay="32"/>
			<enemy name="unit1" delay="34"/>
			<enemy name="unit1" delay="35"/>
			<enemy name="unit1" delay="36"/>
		</wave>
	</group>
	<group pause="0">
		<wave pause="0" lifeTime="20" side="right" img="1">
             <enemy name="car" delay="2"/>
			 <enemy name="tanket" delay="7"/>
		     <enemy name="car" delay="12"/>
			 <enemy name="wheel" delay="15"/>
			 <enemy name="car" delay="18"/>
		</wave>
	</group>
	<group pause="5">
		<wave pause="0" lifeTime="30" side="left" img="1">
             <enemy name="heli" delay="1"/>
		</wave>
		<wave pause="0" lifeTime="30" side="right" img="1">
             <enemy name="heli" delay="1"/>
		</wave>
	</group>
	<group pause="3">
		<wave pause="0" lifeTime="30" side="left" img="1">
			<enemy name="airplane" delay="5"/>
			<enemy name="airplane" delay="7"/>
			<enemy name="airplane" delay="9"/>
			<enemy name="airplane" delay="11"/>
			<enemy name="airplane" delay="13"/>
			<enemy name="heli" delay="1"/>
			<enemy name="heli" delay="3"/>
			<enemy name="heli" delay="7"/>
			<enemy name="heli" delay="10"/>
			<enemy name="heli" delay="14"/>
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit1" delay="10"/>
		</wave>
		<wave pause="0" lifeTime="30" side="right" img="1">
			<enemy name="airplane" delay="5"/>
			<enemy name="airplane" delay="7"/>
			<enemy name="airplane" delay="9"/>
			<enemy name="airplane" delay="11"/>
			<enemy name="airplane" delay="13"/>
			<enemy name="heli" delay="1"/>
			<enemy name="heli" delay="3"/>
			<enemy name="heli" delay="7"/>
			<enemy name="heli" delay="10"/>
			<enemy name="heli" delay="14"/>
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit1" delay="10"/>
		</wave>
	</group>
	<group pause="7">
		<wave pause="0" lifeTime="40" side="left" img="1">
			 <enemy name="unit2" delay="5"/>
			 <enemy name="unit2" delay="5"/>
			 <enemy name="unit2" delay="6"/>
			 <enemy name="unit2" delay="6"/>
			 <enemy name="unit2" delay="7"/>
			 <enemy name="unit2" delay="7"/>
			 <enemy name="unit2" delay="10"/>
			 <enemy name="unit2" delay="10"/>
			 <enemy name="unit2" delay="11"/>
			 <enemy name="unit2" delay="11"/>
			 <enemy name="unit2" delay="12"/>
			 <enemy name="unit2" delay="12"/>
		</wave>
		<wave pause="0" lifeTime="40" side="right" img="1">
             <enemy name="unit2" delay="5"/>
			 <enemy name="unit2" delay="5"/>
			 <enemy name="unit2" delay="6"/>
			 <enemy name="unit2" delay="6"/>
			 <enemy name="unit2" delay="7"/>
			 <enemy name="unit2" delay="7"/>
			 <enemy name="unit2" delay="10"/>
			 <enemy name="unit2" delay="10"/>
			 <enemy name="unit2" delay="11"/>
			 <enemy name="unit2" delay="11"/>
			 <enemy name="unit2" delay="12"/>
			 <enemy name="unit2" delay="12"/>
		</wave>
	</group>
	<group pause="3">
		<wave pause="0" lifeTime="20" side="left" img="1">
			<enemy name="aerostat" delay="1"/>
			<enemy name="aerostat" delay="10"/>
			<enemy name="airplane" delay="5"/>
			<enemy name="airplane" delay="7"/>
			<enemy name="airplane" delay="9"/>
			<enemy name="airplane" delay="11"/>
			<enemy name="unit2" delay="3"/>
			<enemy name="unit2" delay="6"/>
		</wave>
		<wave pause="0" lifeTime="20" side="right" img="1">
		    <enemy name="aerostat" delay="1"/>
			<enemy name="aerostat" delay="10"/>
			<enemy name="airplane" delay="5"/>
			<enemy name="airplane" delay="7"/>
			<enemy name="airplane" delay="9"/>
			<enemy name="airplane" delay="11"/>
			<enemy name="unit2" delay="3"/>
			<enemy name="unit2" delay="6"/>
		</wave>
	</group>
	<group pause="5">
		<wave pause="0" lifeTime="30" side="left" img="1">
             <enemy name="tank1" delay="1"/>
			 <enemy name="tank1" delay="7"/>
			 <enemy name="unit1" delay="10"/>
			 <enemy name="unit1" delay="11"/>
			 <enemy name="unit1" delay="12"/>
		</wave>
		<wave pause="0" lifeTime="30" side="right" img="1">
             <enemy name="tank1" delay="1"/>
			 <enemy name="tank1" delay="7"/>
			 <enemy name="unit1" delay="10"/>
			 <enemy name="unit1" delay="11"/>
			 <enemy name="unit1" delay="12"/>
		</wave>
	</group>
</level>;
            var _loc_7:* = <level eye=""normal"" money=""32000"" maxTower=""4"" maxUpgrade=""2"" bg=""2"" threeStarHealth=""80"" twoStarHealth=""50"" preStartMoney=""2000"">
n	t<!-- 
n	t	tpause - пауза перед появлением, (секунды)
n	t	tlifeTime - время жизни волны, (секунды)
n	t	timg - картинка, иконка досрочного вызова волны
n	t	tside - сторона, откуда появится враг (left, right), - можно указывать целиком волне и также отдельным юнитам
n	t-->
n	t<group pause=""5"">
n	t	t<wave pause=""0"" lifeTime=""20"" side=""left"" img=""1"">
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""12""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""18""/>
n	t	t	t<enemy name=""parashut"" delay=""10""/>
n	t	t	t<enemy name=""parashut"" delay=""12""/>
n	t	t	t<enemy name=""parashut"" delay=""14""/>
n	t	t	t<enemy name=""parashut"" delay=""15""/>
n	t	t	t<enemy name=""parashut"" delay=""17""/>
n	t	t	t<enemy name=""parashut"" delay=""18""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""20"" side=""right"" img=""1"">
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""12""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""18""/>
n	t	t	t<enemy name=""parashut"" delay=""10""/>
n	t	t	t<enemy name=""parashut"" delay=""12""/>
n	t	t	t<enemy name=""parashut"" delay=""14""/>
n	t	t	t<enemy name=""parashut"" delay=""15""/>
n	t	t	t<enemy name=""parashut"" delay=""17""/>
n	t	t	t<enemy name=""parashut"" delay=""18""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""3"">
n	t	t<wave pause=""0"" lifeTime=""20"" side=""left"" img=""1"">
n	t	t	t<enemy name=""airplane"" delay=""8""/>
n	t	t	t<enemy name=""airplane"" delay=""10""/>
n	t	t	t<enemy name=""airplane"" delay=""12""/>
n	t	t	t<enemy name=""aerostat"" delay=""1""/>
n	t	t	t<enemy name=""aerostat"" delay=""4""/>
n	t	t	t<enemy name=""aerostat"" delay=""7""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""20"" side=""right"" img=""1"">
n	t	t	t<enemy name=""airplane"" delay=""8""/>
n	t	t	t<enemy name=""airplane"" delay=""10""/>
n	t	t	t<enemy name=""airplane"" delay=""12""/>
n	t	t	t<enemy name=""aerostat"" delay=""1""/>
n	t	t	t<enemy name=""aerostat"" delay=""4""/>
n	t	t	t<enemy name=""aerostat"" delay=""7""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""2"">
n	t	t<wave pause=""0"" lifeTime=""30"" side=""left"" img=""1"">
n            <enemy name=""unit2"" delay=""1""/>
n	t	t	t<enemy name=""unit2"" delay=""6""/>
n	t	t	t<enemy name=""unit2"" delay=""10""/>
n	t	t	t<enemy name=""unit2"" delay=""16""/>
n	t	t	t<enemy name=""unit2"" delay=""20""/>
n	t	t	t<enemy name=""unit2"" delay=""26""/>
n	t	t	t<enemy name=""unit2"" delay=""30""/>
n	t	t	t<enemy name=""parashut"" delay=""1""/>
n	t	t	t<enemy name=""parashut"" delay=""2""/>
n	t	t	t<enemy name=""parashut"" delay=""3""/>
n	t	t	t<enemy name=""parashut"" delay=""8""/>
n	t	t	t<enemy name=""parashut"" delay=""9""/>
n	t	t	t<enemy name=""parashut"" delay=""12""/>
n	t	t	t<enemy name=""parashut"" delay=""13""/>
n	t	t	t<enemy name=""parashut"" delay=""14""/>
n	t	t	t<enemy name=""parashut"" delay=""15""/>
n	t	t	t<enemy name=""parashut"" delay=""16""/>
n	t	t	t<enemy name=""parashut"" delay=""17""/>
n	t	t	t<enemy name=""parashut"" delay=""18""/>
n	t	t	t<enemy name=""parashut"" delay=""19""/>
n	t	t	t<enemy name=""parashut"" delay=""20""/>
n	t	t	t<enemy name=""parashut"" delay=""21""/>
n	t	t	t<enemy name=""parashut"" delay=""22""/>
n	t	t	t<enemy name=""parashut"" delay=""23""/>
n	t	t	t<enemy name=""parashut"" delay=""24""/>
n	t	t	t<enemy name=""parashut"" delay=""25""/>
n	t	t	t<enemy name=""parashut"" delay=""26""/>
n	t	t	t<enemy name=""parashut"" delay=""27""/>
n	t	t	t<enemy name=""parashut"" delay=""28""/>
n	t	t	t<enemy name=""parashut"" delay=""29""/>
n	t	t	t<enemy name=""parashut"" delay=""30""/>
n	t	t	t<enemy name=""parashut"" delay=""32""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""30"" side=""right"" img=""1"">
n            <enemy name=""unit2"" delay=""1""/>
n	t	t	t<enemy name=""unit2"" delay=""6""/>
n	t	t	t<enemy name=""unit2"" delay=""10""/>
n	t	t	t<enemy name=""unit2"" delay=""16""/>
n	t	t	t<enemy name=""unit2"" delay=""20""/>
n	t	t	t<enemy name=""unit2"" delay=""26""/>
n	t	t	t<enemy name=""unit2"" delay=""30""/>
n	t	t	t<enemy name=""parashut"" delay=""1""/>
n	t	t	t<enemy name=""parashut"" delay=""2""/>
n	t	t	t<enemy name=""parashut"" delay=""3""/>
n	t	t	t<enemy name=""parashut"" delay=""8""/>
n	t	t	t<enemy name=""parashut"" delay=""9""/>
n	t	t	t<enemy name=""parashut"" delay=""12""/>
n	t	t	t<enemy name=""parashut"" delay=""13""/>
n	t	t	t<enemy name=""parashut"" delay=""14""/>
n	t	t	t<enemy name=""parashut"" delay=""15""/>
n	t	t	t<enemy name=""parashut"" delay=""16""/>
n	t	t	t<enemy name=""parashut"" delay=""17""/>
n	t	t	t<enemy name=""parashut"" delay=""18""/>
n	t	t	t<enemy name=""parashut"" delay=""19""/>
n	t	t	t<enemy name=""parashut"" delay=""20""/>
n	t	t	t<enemy name=""parashut"" delay=""21""/>
n	t	t	t<enemy name=""parashut"" delay=""22""/>
n	t	t	t<enemy name=""parashut"" delay=""23""/>
n	t	t	t<enemy name=""parashut"" delay=""24""/>
n	t	t	t<enemy name=""parashut"" delay=""25""/>
n	t	t	t<enemy name=""parashut"" delay=""26""/>
n	t	t	t<enemy name=""parashut"" delay=""27""/>
n	t	t	t<enemy name=""parashut"" delay=""28""/>
n	t	t	t<enemy name=""parashut"" delay=""29""/>
n	t	t	t<enemy name=""parashut"" delay=""30""/>
n	t	t	t<enemy name=""parashut"" delay=""32""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""3"">
n	t	t<wave pause=""0"" lifeTime=""20"" side=""left"" img=""1"">
n	t	t     <enemy name=""car"" delay=""7""/>
n	t	t	t <enemy name=""car"" delay=""12""/>
n	t	t	t <enemy name=""car"" delay=""16""/>
n	t	t     <enemy name=""wheel"" delay=""5""/>
n	t	t	t <enemy name=""wheel"" delay=""7""/>
n	t	t     <enemy name=""wheel"" delay=""9""/>
n	t	t	t <enemy name=""wheel"" delay=""11""/>
n	t	t	t <enemy name=""wheel"" delay=""12""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""20"" side=""right"" img=""1"">
n	t     	t <enemy name=""car"" delay=""7""/>
n	t	t	t <enemy name=""car"" delay=""12""/>
n	t	t	t <enemy name=""car"" delay=""16""/>
n	t	t     <enemy name=""wheel"" delay=""5""/>
n	t	t	t <enemy name=""wheel"" delay=""7""/>
n	t	t     <enemy name=""wheel"" delay=""9""/>
n	t	t	t <enemy name=""wheel"" delay=""11""/>
n	t	t	t <enemy name=""wheel"" delay=""12""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""5"">
n	t	t<wave pause=""0"" lifeTime=""40"" side=""left"" img=""1"">
n            <enemy name=""unit2"" delay=""1""/>
n	t	t	t<enemy name=""unit2"" delay=""1""/>
n	t	t	t<enemy name=""unit2"" delay=""5""/>
n	t	t	t<enemy name=""unit2"" delay=""5""/>
n	t	t	t<enemy name=""unit2"" delay=""10""/>
n	t	t	t<enemy name=""unit2"" delay=""10""/>
n	t	t	t<enemy name=""unit2"" delay=""15""/>
n	t	t	t<enemy name=""unit2"" delay=""15""/>
n	t	t	t<enemy name=""unit2"" delay=""20""/>
n	t	t	t<enemy name=""unit2"" delay=""20""/>
n	t	t	t<enemy name=""airplane"" delay=""1""/>
n	t	t	t<enemy name=""airplane"" delay=""5""/>
n	t	t	t<enemy name=""airplane"" delay=""10""/>
n	t	t	t<enemy name=""airplane"" delay=""20""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""40"" side=""right"" img=""1"">
n	t	t	t<enemy name=""unit2"" delay=""1""/>
n	t	t	t<enemy name=""unit2"" delay=""1""/>
n	t	t	t<enemy name=""unit2"" delay=""5""/>
n	t	t	t<enemy name=""unit2"" delay=""5""/>
n	t	t	t<enemy name=""unit2"" delay=""10""/>
n	t	t	t<enemy name=""unit2"" delay=""10""/>
n	t	t	t<enemy name=""unit2"" delay=""15""/>
n	t	t	t<enemy name=""unit2"" delay=""15""/>
n	t	t	t<enemy name=""unit2"" delay=""20""/>
n	t	t	t<enemy name=""unit2"" delay=""20""/>
n	t	t	t<enemy name=""airplane"" delay=""1""/>
n	t	t	t<enemy name=""airplane"" delay=""5""/>
n	t	t	t<enemy name=""airplane"" delay=""10""/>
n	t	t	t<enemy name=""airplane"" delay=""20""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""3"">
n	t	t<wave pause=""0"" lifeTime=""50"" side=""left"" img=""1"">
n	t	t	t<enemy name=""aerostat"" delay=""1""/>
n	t	t	t<enemy name=""aerostat"" delay=""4""/>
n	t	t	t<enemy name=""aerostat"" delay=""7""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""50"" side=""right"" img=""1"">
n	t	t    <enemy name=""tank1"" delay=""1""/>
n	t	t    <enemy name=""tanket"" delay=""5""/>
n	t	t    <enemy name=""tanket"" delay=""9""/>
n	t	t    <enemy name=""tanket"" delay=""13""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""3"">
n	t	t<wave pause=""0"" lifeTime=""20"" side=""left"" img=""1"">
n             <enemy name=""heli"" delay=""1""/>
n             <enemy name=""heli"" delay=""5""/>
n	t	t	t <enemy name=""heli"" delay=""8""/>
n	t	t	t <enemy name=""tank1"" delay=""1""/>
n	t	t	t <enemy name=""wheel"" delay=""11""/>
n	t	t	t <enemy name=""wheel"" delay=""12""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""20"" side=""right"" img=""1"">
n             <enemy name=""heli"" delay=""1""/>
n             <enemy name=""heli"" delay=""5""/>
n	t	t	t <enemy name=""heli"" delay=""8""/>
n	t	t	t <enemy name=""tank1"" delay=""1""/>
n	t	t	t <enemy name=""wheel"" delay=""11""/>
n	t	t	t <enemy name=""wheel"" delay=""12""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""5"">
n	t	t<wave pause=""0"" lifeTime=""600"" side=""left"" img=""1"">
n            <enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""12""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""18""/>
n	t	t	t<enemy name=""unit1"" delay=""20""/>
n	t	t	t
n	t	t	t<enemy name=""unit1"" delay=""31""/>
n	t	t	t<enemy name=""unit1"" delay=""33""/>
n	t	t	t<enemy name=""unit1"" delay=""34""/>
n	t	t	t<enemy name=""unit1"" delay=""38""/>
n	t	t	t<enemy name=""unit1"" delay=""40""/>
n	t	t	t<enemy name=""unit1"" delay=""42""/>
n	t	t	t<enemy name=""unit1"" delay=""43""/>
n	t	t	t<enemy name=""unit1"" delay=""44""/>
n	t	t	t<enemy name=""unit1"" delay=""48""/>
n	t	t	t<enemy name=""unit1"" delay=""50""/>
n	t	t	t<enemy name=""unit1"" delay=""53""/>
n	t	t	t<enemy name=""unit1"" delay=""55""/>
n	t	t	t<enemy name=""unit1"" delay=""57""/>
n	t	t	t<enemy name=""unit1"" delay=""60""/>
n	t	t	t
n	t	t    <enemy name=""unit2"" delay=""1""/>
n	t	t	t<enemy name=""unit2"" delay=""6""/>
n	t	t	t<enemy name=""unit2"" delay=""10""/>
n	t	t	t<enemy name=""unit2"" delay=""16""/>
n	t	t	t<enemy name=""unit2"" delay=""20""/>
n	t	t	t
n	t	t	t<enemy name=""unit2"" delay=""31""/>
n	t	t	t<enemy name=""unit2"" delay=""35""/>
n	t	t	t<enemy name=""unit2"" delay=""41""/>
n	t	t	t<enemy name=""unit2"" delay=""45""/>
n	t	t	t<enemy name=""unit2"" delay=""51""/>
n	t	t	t<enemy name=""unit2"" delay=""55""/>
n	t	t	t
n	t	t	t<enemy name=""parashut"" delay=""2""/>
n	t	t	t<enemy name=""parashut"" delay=""8""/>
n	t	t	t<enemy name=""parashut"" delay=""12""/>
n	t	t	t<enemy name=""parashut"" delay=""18""/>
n	t	t	t<enemy name=""parashut"" delay=""22""/>
n	t	t	t<enemy name=""parashut"" delay=""28""/>
n	t	t	t<enemy name=""parashut"" delay=""32""/>
n	t	t	t<enemy name=""parashut"" delay=""36""/>
n	t	t	t<enemy name=""parashut"" delay=""40""/>
n	t	t	t<enemy name=""parashut"" delay=""45""/>
n	t	t	t<enemy name=""parashut"" delay=""50""/>
n	t	t	t
n	t	t	t<enemy name=""car"" delay=""20""/>
n	t	t	t<enemy name=""car"" delay=""30""/>
n	t	t	t<enemy name=""car"" delay=""40""/>
n	t	t	t<enemy name=""car"" delay=""50""/>
n	t	t	t<enemy name=""tank1"" delay=""60""/>
n	t	t	t
n	t	t	t<enemy name=""heli"" delay=""22""/>
n	t	t	t<enemy name=""heli"" delay=""32""/>
n	t	t	t<enemy name=""heli"" delay=""42""/>
n	t	t	t<enemy name=""heli"" delay=""52""/>
n	t	t	t<enemy name=""heli"" delay=""62""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""600"" side=""right"" img=""1"">
n	t	t    <enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""12""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""18""/>
n	t	t	t<enemy name=""unit1"" delay=""20""/>
n	t	t	t<enemy name=""unit1"" delay=""21""/>
n	t	t	t<enemy name=""unit1"" delay=""23""/>
n	t	t	t<enemy name=""unit1"" delay=""24""/>
n	t	t	t<enemy name=""unit1"" delay=""28""/>
n	t	t	t<enemy name=""unit1"" delay=""30""/>
n	t	t	t<enemy name=""unit1"" delay=""32""/>
n	t	t	t<enemy name=""unit1"" delay=""33""/>
n	t	t	t<enemy name=""unit1"" delay=""34""/>
n	t	t	t<enemy name=""unit1"" delay=""38""/>
n	t	t	t<enemy name=""unit1"" delay=""40""/>
n	t	t	t<enemy name=""unit1"" delay=""43""/>
n	t	t	t<enemy name=""unit1"" delay=""45""/>
n	t	t	t<enemy name=""unit1"" delay=""47""/>
n	t	t	t<enemy name=""unit1"" delay=""50""/>
n	t	t    <enemy name=""unit2"" delay=""1""/>
n	t	t	t<enemy name=""unit2"" delay=""6""/>
n	t	t	t<enemy name=""unit2"" delay=""10""/>
n	t	t	t<enemy name=""unit2"" delay=""16""/>
n	t	t	t<enemy name=""unit2"" delay=""20""/>
n	t	t	t<enemy name=""unit2"" delay=""26""/>
n	t	t	t<enemy name=""unit2"" delay=""30""/>
n	t	t	t<enemy name=""unit2"" delay=""36""/>
n	t	t	t<enemy name=""unit2"" delay=""40""/>
n	t	t	t<enemy name=""unit2"" delay=""45""/>
n	t	t	t<enemy name=""unit2"" delay=""50""/>
n	t	t	t<enemy name=""parashut"" delay=""2""/>
n	t	t	t<enemy name=""parashut"" delay=""8""/>
n	t	t	t<enemy name=""parashut"" delay=""12""/>
n	t	t	t<enemy name=""parashut"" delay=""18""/>
n	t	t	t<enemy name=""parashut"" delay=""22""/>
n	t	t	t<enemy name=""parashut"" delay=""28""/>
n	t	t	t<enemy name=""parashut"" delay=""32""/>
n	t	t	t<enemy name=""parashut"" delay=""36""/>
n	t	t	t<enemy name=""parashut"" delay=""40""/>
n	t	t	t<enemy name=""parashut"" delay=""45""/>
n	t	t	t<enemy name=""parashut"" delay=""50""/>
n	t	t	t
n	t	t	t<enemy name=""car"" delay=""20""/>
n	t	t	t<enemy name=""car"" delay=""30""/>
n	t	t	t<enemy name=""car"" delay=""40""/>
n	t	t	t<enemy name=""car"" delay=""45""/>
n	t	t	t<enemy name=""tank1"" delay=""50""/>
n	t	t	t
n	t	t	t<enemy name=""heli"" delay=""50""/>
n	t	t	t<enemy name=""heli"" delay=""32""/>
n	t	t	t<enemy name=""heli"" delay=""42""/>
n	t	t	t<enemy name=""heli"" delay=""52""/>
n	t	t	t<enemy name=""heli"" delay=""62""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""5"">
n	t	t<wave pause=""0"" lifeTime=""50"" side=""left"" img=""1"">
n	t	t   <enemy name=""tank1"" delay=""1""/>
n	t	t   <enemy name=""tank1"" delay=""6""/>
n	t	t   <enemy name=""tank1"" delay=""12""/>
n	t	t   <enemy name=""tank1"" delay=""18""/>
n	t	t    <enemy name=""parashut"" delay=""2""/>
n	t	t	t<enemy name=""parashut"" delay=""6""/>
n	t	t	t<enemy name=""parashut"" delay=""10""/>
n	t	t	t<enemy name=""parashut"" delay=""14""/>
n	t	t	t<enemy name=""parashut"" delay=""18""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""50"" side=""right"" img=""1"">
n	t	t   <enemy name=""tank1"" delay=""1""/>
n	t	t   <enemy name=""tank1"" delay=""6""/>
n	t	t   <enemy name=""tank1"" delay=""12""/>
n	t	t   <enemy name=""tank1"" delay=""18""/>
n	t	t    <enemy name=""parashut"" delay=""2""/>
n	t	t	t<enemy name=""parashut"" delay=""6""/>
n	t	t	t<enemy name=""parashut"" delay=""10""/>
n	t	t	t<enemy name=""parashut"" delay=""14""/>
n	t	t	t<enemy name=""parashut"" delay=""18""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""5"">
n	t	t<wave pause=""0"" lifeTime=""50"" side=""left"" img=""1"">
n	t	t   <enemy name=""airplane"" delay=""5""/>
n	t	t   <enemy name=""airplane"" delay=""7""/>
n	t	t   <enemy name=""tank3"" delay=""1""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""50"" side=""right"" img=""1"">
n	t	t   <enemy name=""airplane"" delay=""6""/>
n	t	t   <enemy name=""airplane"" delay=""8""/>
n	t	t   <enemy name=""tank3"" delay=""1""/>
n	t	t</wave>
n	t</group>
n</level>")("<level eye="normal" money="32000" maxTower="4" maxUpgrade="2" bg="2" threeStarHealth="80" twoStarHealth="50" preStartMoney="2000">
	<!-- 
		pause - пауза перед появлением, (секунды)
		lifeTime - время жизни волны, (секунды)
		img - картинка, иконка досрочного вызова волны
		side - сторона, откуда появится враг (left, right), - можно указывать целиком волне и также отдельным юнитам
	-->
	<group pause="5">
		<wave pause="0" lifeTime="20" side="left" img="1">
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="12"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="18"/>
			<enemy name="parashut" delay="10"/>
			<enemy name="parashut" delay="12"/>
			<enemy name="parashut" delay="14"/>
			<enemy name="parashut" delay="15"/>
			<enemy name="parashut" delay="17"/>
			<enemy name="parashut" delay="18"/>
		</wave>
		<wave pause="0" lifeTime="20" side="right" img="1">
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="12"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="18"/>
			<enemy name="parashut" delay="10"/>
			<enemy name="parashut" delay="12"/>
			<enemy name="parashut" delay="14"/>
			<enemy name="parashut" delay="15"/>
			<enemy name="parashut" delay="17"/>
			<enemy name="parashut" delay="18"/>
		</wave>
	</group>
	<group pause="3">
		<wave pause="0" lifeTime="20" side="left" img="1">
			<enemy name="airplane" delay="8"/>
			<enemy name="airplane" delay="10"/>
			<enemy name="airplane" delay="12"/>
			<enemy name="aerostat" delay="1"/>
			<enemy name="aerostat" delay="4"/>
			<enemy name="aerostat" delay="7"/>
		</wave>
		<wave pause="0" lifeTime="20" side="right" img="1">
			<enemy name="airplane" delay="8"/>
			<enemy name="airplane" delay="10"/>
			<enemy name="airplane" delay="12"/>
			<enemy name="aerostat" delay="1"/>
			<enemy name="aerostat" delay="4"/>
			<enemy name="aerostat" delay="7"/>
		</wave>
	</group>
	<group pause="2">
		<wave pause="0" lifeTime="30" side="left" img="1">
            <enemy name="unit2" delay="1"/>
			<enemy name="unit2" delay="6"/>
			<enemy name="unit2" delay="10"/>
			<enemy name="unit2" delay="16"/>
			<enemy name="unit2" delay="20"/>
			<enemy name="unit2" delay="26"/>
			<enemy name="unit2" delay="30"/>
			<enemy name="parashut" delay="1"/>
			<enemy name="parashut" delay="2"/>
			<enemy name="parashut" delay="3"/>
			<enemy name="parashut" delay="8"/>
			<enemy name="parashut" delay="9"/>
			<enemy name="parashut" delay="12"/>
			<enemy name="parashut" delay="13"/>
			<enemy name="parashut" delay="14"/>
			<enemy name="parashut" delay="15"/>
			<enemy name="parashut" delay="16"/>
			<enemy name="parashut" delay="17"/>
			<enemy name="parashut" delay="18"/>
			<enemy name="parashut" delay="19"/>
			<enemy name="parashut" delay="20"/>
			<enemy name="parashut" delay="21"/>
			<enemy name="parashut" delay="22"/>
			<enemy name="parashut" delay="23"/>
			<enemy name="parashut" delay="24"/>
			<enemy name="parashut" delay="25"/>
			<enemy name="parashut" delay="26"/>
			<enemy name="parashut" delay="27"/>
			<enemy name="parashut" delay="28"/>
			<enemy name="parashut" delay="29"/>
			<enemy name="parashut" delay="30"/>
			<enemy name="parashut" delay="32"/>
		</wave>
		<wave pause="0" lifeTime="30" side="right" img="1">
            <enemy name="unit2" delay="1"/>
			<enemy name="unit2" delay="6"/>
			<enemy name="unit2" delay="10"/>
			<enemy name="unit2" delay="16"/>
			<enemy name="unit2" delay="20"/>
			<enemy name="unit2" delay="26"/>
			<enemy name="unit2" delay="30"/>
			<enemy name="parashut" delay="1"/>
			<enemy name="parashut" delay="2"/>
			<enemy name="parashut" delay="3"/>
			<enemy name="parashut" delay="8"/>
			<enemy name="parashut" delay="9"/>
			<enemy name="parashut" delay="12"/>
			<enemy name="parashut" delay="13"/>
			<enemy name="parashut" delay="14"/>
			<enemy name="parashut" delay="15"/>
			<enemy name="parashut" delay="16"/>
			<enemy name="parashut" delay="17"/>
			<enemy name="parashut" delay="18"/>
			<enemy name="parashut" delay="19"/>
			<enemy name="parashut" delay="20"/>
			<enemy name="parashut" delay="21"/>
			<enemy name="parashut" delay="22"/>
			<enemy name="parashut" delay="23"/>
			<enemy name="parashut" delay="24"/>
			<enemy name="parashut" delay="25"/>
			<enemy name="parashut" delay="26"/>
			<enemy name="parashut" delay="27"/>
			<enemy name="parashut" delay="28"/>
			<enemy name="parashut" delay="29"/>
			<enemy name="parashut" delay="30"/>
			<enemy name="parashut" delay="32"/>
		</wave>
	</group>
	<group pause="3">
		<wave pause="0" lifeTime="20" side="left" img="1">
		     <enemy name="car" delay="7"/>
			 <enemy name="car" delay="12"/>
			 <enemy name="car" delay="16"/>
		     <enemy name="wheel" delay="5"/>
			 <enemy name="wheel" delay="7"/>
		     <enemy name="wheel" delay="9"/>
			 <enemy name="wheel" delay="11"/>
			 <enemy name="wheel" delay="12"/>
		</wave>
		<wave pause="0" lifeTime="20" side="right" img="1">
	     	 <enemy name="car" delay="7"/>
			 <enemy name="car" delay="12"/>
			 <enemy name="car" delay="16"/>
		     <enemy name="wheel" delay="5"/>
			 <enemy name="wheel" delay="7"/>
		     <enemy name="wheel" delay="9"/>
			 <enemy name="wheel" delay="11"/>
			 <enemy name="wheel" delay="12"/>
		</wave>
	</group>
	<group pause="5">
		<wave pause="0" lifeTime="40" side="left" img="1">
            <enemy name="unit2" delay="1"/>
			<enemy name="unit2" delay="1"/>
			<enemy name="unit2" delay="5"/>
			<enemy name="unit2" delay="5"/>
			<enemy name="unit2" delay="10"/>
			<enemy name="unit2" delay="10"/>
			<enemy name="unit2" delay="15"/>
			<enemy name="unit2" delay="15"/>
			<enemy name="unit2" delay="20"/>
			<enemy name="unit2" delay="20"/>
			<enemy name="airplane" delay="1"/>
			<enemy name="airplane" delay="5"/>
			<enemy name="airplane" delay="10"/>
			<enemy name="airplane" delay="20"/>
		</wave>
		<wave pause="0" lifeTime="40" side="right" img="1">
			<enemy name="unit2" delay="1"/>
			<enemy name="unit2" delay="1"/>
			<enemy name="unit2" delay="5"/>
			<enemy name="unit2" delay="5"/>
			<enemy name="unit2" delay="10"/>
			<enemy name="unit2" delay="10"/>
			<enemy name="unit2" delay="15"/>
			<enemy name="unit2" delay="15"/>
			<enemy name="unit2" delay="20"/>
			<enemy name="unit2" delay="20"/>
			<enemy name="airplane" delay="1"/>
			<enemy name="airplane" delay="5"/>
			<enemy name="airplane" delay="10"/>
			<enemy name="airplane" delay="20"/>
		</wave>
	</group>
	<group pause="3">
		<wave pause="0" lifeTime="50" side="left" img="1">
			<enemy name="aerostat" delay="1"/>
			<enemy name="aerostat" delay="4"/>
			<enemy name="aerostat" delay="7"/>
		</wave>
		<wave pause="0" lifeTime="50" side="right" img="1">
		    <enemy name="tank1" delay="1"/>
		    <enemy name="tanket" delay="5"/>
		    <enemy name="tanket" delay="9"/>
		    <enemy name="tanket" delay="13"/>
		</wave>
	</group>
	<group pause="3">
		<wave pause="0" lifeTime="20" side="left" img="1">
             <enemy name="heli" delay="1"/>
             <enemy name="heli" delay="5"/>
			 <enemy name="heli" delay="8"/>
			 <enemy name="tank1" delay="1"/>
			 <enemy name="wheel" delay="11"/>
			 <enemy name="wheel" delay="12"/>
		</wave>
		<wave pause="0" lifeTime="20" side="right" img="1">
             <enemy name="heli" delay="1"/>
             <enemy name="heli" delay="5"/>
			 <enemy name="heli" delay="8"/>
			 <enemy name="tank1" delay="1"/>
			 <enemy name="wheel" delay="11"/>
			 <enemy name="wheel" delay="12"/>
		</wave>
	</group>
	<group pause="5">
		<wave pause="0" lifeTime="600" side="left" img="1">
            <enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="12"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="18"/>
			<enemy name="unit1" delay="20"/>
			
			<enemy name="unit1" delay="31"/>
			<enemy name="unit1" delay="33"/>
			<enemy name="unit1" delay="34"/>
			<enemy name="unit1" delay="38"/>
			<enemy name="unit1" delay="40"/>
			<enemy name="unit1" delay="42"/>
			<enemy name="unit1" delay="43"/>
			<enemy name="unit1" delay="44"/>
			<enemy name="unit1" delay="48"/>
			<enemy name="unit1" delay="50"/>
			<enemy name="unit1" delay="53"/>
			<enemy name="unit1" delay="55"/>
			<enemy name="unit1" delay="57"/>
			<enemy name="unit1" delay="60"/>
			
		    <enemy name="unit2" delay="1"/>
			<enemy name="unit2" delay="6"/>
			<enemy name="unit2" delay="10"/>
			<enemy name="unit2" delay="16"/>
			<enemy name="unit2" delay="20"/>
			
			<enemy name="unit2" delay="31"/>
			<enemy name="unit2" delay="35"/>
			<enemy name="unit2" delay="41"/>
			<enemy name="unit2" delay="45"/>
			<enemy name="unit2" delay="51"/>
			<enemy name="unit2" delay="55"/>
			
			<enemy name="parashut" delay="2"/>
			<enemy name="parashut" delay="8"/>
			<enemy name="parashut" delay="12"/>
			<enemy name="parashut" delay="18"/>
			<enemy name="parashut" delay="22"/>
			<enemy name="parashut" delay="28"/>
			<enemy name="parashut" delay="32"/>
			<enemy name="parashut" delay="36"/>
			<enemy name="parashut" delay="40"/>
			<enemy name="parashut" delay="45"/>
			<enemy name="parashut" delay="50"/>
			
			<enemy name="car" delay="20"/>
			<enemy name="car" delay="30"/>
			<enemy name="car" delay="40"/>
			<enemy name="car" delay="50"/>
			<enemy name="tank1" delay="60"/>
			
			<enemy name="heli" delay="22"/>
			<enemy name="heli" delay="32"/>
			<enemy name="heli" delay="42"/>
			<enemy name="heli" delay="52"/>
			<enemy name="heli" delay="62"/>
		</wave>
		<wave pause="0" lifeTime="600" side="right" img="1">
		    <enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="12"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="18"/>
			<enemy name="unit1" delay="20"/>
			<enemy name="unit1" delay="21"/>
			<enemy name="unit1" delay="23"/>
			<enemy name="unit1" delay="24"/>
			<enemy name="unit1" delay="28"/>
			<enemy name="unit1" delay="30"/>
			<enemy name="unit1" delay="32"/>
			<enemy name="unit1" delay="33"/>
			<enemy name="unit1" delay="34"/>
			<enemy name="unit1" delay="38"/>
			<enemy name="unit1" delay="40"/>
			<enemy name="unit1" delay="43"/>
			<enemy name="unit1" delay="45"/>
			<enemy name="unit1" delay="47"/>
			<enemy name="unit1" delay="50"/>
		    <enemy name="unit2" delay="1"/>
			<enemy name="unit2" delay="6"/>
			<enemy name="unit2" delay="10"/>
			<enemy name="unit2" delay="16"/>
			<enemy name="unit2" delay="20"/>
			<enemy name="unit2" delay="26"/>
			<enemy name="unit2" delay="30"/>
			<enemy name="unit2" delay="36"/>
			<enemy name="unit2" delay="40"/>
			<enemy name="unit2" delay="45"/>
			<enemy name="unit2" delay="50"/>
			<enemy name="parashut" delay="2"/>
			<enemy name="parashut" delay="8"/>
			<enemy name="parashut" delay="12"/>
			<enemy name="parashut" delay="18"/>
			<enemy name="parashut" delay="22"/>
			<enemy name="parashut" delay="28"/>
			<enemy name="parashut" delay="32"/>
			<enemy name="parashut" delay="36"/>
			<enemy name="parashut" delay="40"/>
			<enemy name="parashut" delay="45"/>
			<enemy name="parashut" delay="50"/>
			
			<enemy name="car" delay="20"/>
			<enemy name="car" delay="30"/>
			<enemy name="car" delay="40"/>
			<enemy name="car" delay="45"/>
			<enemy name="tank1" delay="50"/>
			
			<enemy name="heli" delay="50"/>
			<enemy name="heli" delay="32"/>
			<enemy name="heli" delay="42"/>
			<enemy name="heli" delay="52"/>
			<enemy name="heli" delay="62"/>
		</wave>
	</group>
	<group pause="5">
		<wave pause="0" lifeTime="50" side="left" img="1">
		   <enemy name="tank1" delay="1"/>
		   <enemy name="tank1" delay="6"/>
		   <enemy name="tank1" delay="12"/>
		   <enemy name="tank1" delay="18"/>
		    <enemy name="parashut" delay="2"/>
			<enemy name="parashut" delay="6"/>
			<enemy name="parashut" delay="10"/>
			<enemy name="parashut" delay="14"/>
			<enemy name="parashut" delay="18"/>
		</wave>
		<wave pause="0" lifeTime="50" side="right" img="1">
		   <enemy name="tank1" delay="1"/>
		   <enemy name="tank1" delay="6"/>
		   <enemy name="tank1" delay="12"/>
		   <enemy name="tank1" delay="18"/>
		    <enemy name="parashut" delay="2"/>
			<enemy name="parashut" delay="6"/>
			<enemy name="parashut" delay="10"/>
			<enemy name="parashut" delay="14"/>
			<enemy name="parashut" delay="18"/>
		</wave>
	</group>
	<group pause="5">
		<wave pause="0" lifeTime="50" side="left" img="1">
		   <enemy name="airplane" delay="5"/>
		   <enemy name="airplane" delay="7"/>
		   <enemy name="tank3" delay="1"/>
		</wave>
		<wave pause="0" lifeTime="50" side="right" img="1">
		   <enemy name="airplane" delay="6"/>
		   <enemy name="airplane" delay="8"/>
		   <enemy name="tank3" delay="1"/>
		</wave>
	</group>
</level>;
            var _loc_8:* = <level eye=""normal"" money=""37000"" maxTower=""5"" maxUpgrade=""2"" bg=""3"" threeStarHealth=""80"" twoStarHealth=""60"" preStartMoney=""2000"">
n	t<!-- 
n	t	tpause - пауза перед появлением, (секунды)
n	t	tlifeTime - время жизни волны, (секунды)
n	t	timg - картинка, иконка досрочного вызова волны
n	t	tside - сторона, откуда появится враг (left, right), - можно указывать целиком волне и также отдельным юнитам
n	t-->
n    <group pause=""5"">
n	t	t<wave pause=""0"" lifeTime=""20"" side=""left"" img=""1"">
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit2"" delay=""1""/>
n
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""20"" side=""right"" img=""1"">
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit2"" delay=""1""/>
n	t	t</wave>
n	t</group>
n	t <group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""30"" side=""left"" img=""1"">
n	t	t    <enemy name=""tanket"" delay=""1""/>
n	t	t	t<enemy name=""unit2"" delay=""1""/>
n	t	t	t<enemy name=""unit2"" delay=""4""/>
n	t	t	t<enemy name=""unit2"" delay=""7""/>
n	t	t	t<enemy name=""unit2"" delay=""10""/>
n	t	t	t<enemy name=""unit2"" delay=""13""/>
n	t	t	t<enemy name=""unit2"" delay=""16""/>
n    	t</wave>
n	t	t<wave pause=""0"" lifeTime=""30"" side=""right"" img=""1"">
n	t	t    <enemy name=""tanket"" delay=""1""/>
n	t	t	t<enemy name=""unit2"" delay=""1""/>
n	t	t	t<enemy name=""unit2"" delay=""4""/>
n	t	t	t<enemy name=""unit2"" delay=""7""/>
n	t	t	t<enemy name=""unit2"" delay=""10""/>
n	t	t	t<enemy name=""unit2"" delay=""13""/>
n	t	t	t<enemy name=""unit2"" delay=""16""/>
n	t	t</wave>
n	t</group>
n	t <group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""50"" side=""left"" img=""1"">
n	t	t	t<enemy name=""aerostat"" delay=""1""/>
n	t	t	t<enemy name=""aerostat"" delay=""4""/>
n	t	t	t<enemy name=""unit2"" delay=""4""/>
n	t	t	t<enemy name=""unit2"" delay=""7""/>
n	t	t	t<enemy name=""unit2"" delay=""10""/>
n	t	t	t<enemy name=""unit2"" delay=""13""/>
n	t	t	t<enemy name=""unit2"" delay=""16""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n    	t</wave>
n	t	t<wave pause=""0"" lifeTime=""50"" side=""right"" img=""1"">
n	t	t	t<enemy name=""aerostat"" delay=""1""/>
n	t	t	t<enemy name=""aerostat"" delay=""4""/>
n	t	t	t<enemy name=""unit2"" delay=""4""/>
n	t	t	t<enemy name=""unit2"" delay=""7""/>
n	t	t	t<enemy name=""unit2"" delay=""10""/>
n	t	t	t<enemy name=""unit2"" delay=""13""/>
n	t	t	t<enemy name=""unit2"" delay=""16""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""5"">
n	t	t<wave pause=""0"" lifeTime=""50"" side=""left"" img=""1"">
n	t	t	t<enemy name=""airplane"" delay=""1""/>
n	t	t	t<enemy name=""airplane"" delay=""2""/>
n	t	t	t<enemy name=""car"" delay=""1""/>
n	t	t	t<enemy name=""tanket"" delay=""5""/>
n	t	t	t<enemy name=""tanket"" delay=""10""/>
n	t	t	t<enemy name=""tanket"" delay=""15""/>
n	t	t	t<enemy name=""tanket"" delay=""20""/>
n	t	t	t<enemy name=""car"" delay=""25""/>
n	t	t	t<enemy name=""unit2"" delay=""5""/>
n	t	t	t<enemy name=""unit1-line-3"" delay=""8""/>
n	t	t	t<enemy name=""unit1-line-3"" delay=""13""/>
n	t	t	t<enemy name=""unit2"" delay=""15""/>
n	t	t	t<enemy name=""unit2"" delay=""16""/>
n	t	t	t<enemy name=""unit2"" delay=""20""/>
n	t	t	t<enemy name=""unit1-line-3"" delay=""23""/>
n	t	t	t<enemy name=""unit2"" delay=""25""/>
n	t	t	t<enemy name=""unit1-line-3"" delay=""27""/>
n    	t</wave>
n	t	t<wave pause=""0"" lifeTime=""50"" side=""right"" img=""1"">
n	t	t	t<enemy name=""airplane"" delay=""1""/>
n	t	t	t<enemy name=""airplane"" delay=""2""/>
n	t	t	t<enemy name=""car"" delay=""1""/>
n	t	t	t<enemy name=""tanket"" delay=""5""/>
n	t	t	t<enemy name=""tanket"" delay=""10""/>
n	t	t	t<enemy name=""tanket"" delay=""15""/>
n	t	t	t<enemy name=""tanket"" delay=""20""/>
n	t	t	t<enemy name=""car"" delay=""25""/>
n	t	t	t<enemy name=""unit2"" delay=""5""/>
n	t	t	t<enemy name=""unit1-line-3"" delay=""8""/>
n	t	t	t<enemy name=""unit1-line-3"" delay=""13""/>
n	t	t	t<enemy name=""unit2"" delay=""15""/>
n	t	t	t<enemy name=""unit2"" delay=""16""/>
n	t	t	t<enemy name=""unit2"" delay=""20""/>
n	t	t	t<enemy name=""unit1-line-3"" delay=""23""/>
n	t	t	t<enemy name=""unit2"" delay=""25""/>
n	t	t	t<enemy name=""unit1-line-3"" delay=""27""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""20"" side=""left"" img=""1"">
n	t	t     <enemy name=""wheel"" delay=""5""/>
n	t	t	t <enemy name=""wheel"" delay=""7""/>
n	t	t     <enemy name=""wheel"" delay=""9""/>
n	t	t	t <enemy name=""wheel"" delay=""11""/>
n	t	t	t <enemy name=""wheel"" delay=""6""/>
n	t	t	t <enemy name=""wheel"" delay=""8""/>
n	t	t     <enemy name=""wheel"" delay=""10""/>
n	t	t	t <enemy name=""wheel"" delay=""12""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""20"" side=""right"" img=""1"">
n	t	t     <enemy name=""wheel"" delay=""5""/>
n	t	t	t <enemy name=""wheel"" delay=""7""/>
n	t	t     <enemy name=""wheel"" delay=""9""/>
n	t	t	t <enemy name=""wheel"" delay=""11""/>
n	t	t	t <enemy name=""wheel"" delay=""6""/>
n	t	t	t <enemy name=""wheel"" delay=""8""/>
n	t	t     <enemy name=""wheel"" delay=""10""/>
n	t	t	t <enemy name=""wheel"" delay=""12""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""20"" side=""right"" img=""1"">
n	t	t     <enemy name=""tank1"" delay=""1""/>
n	t	t     <enemy name=""tank1"" delay=""3""/>
n	t	t     <enemy name=""tank1"" delay=""5""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""20"" side=""left"" img=""1"">
n	t	t     <enemy name=""airplane"" delay=""1""/>
n	t	t     <enemy name=""wheel"" delay=""2""/>
n	t	t	t <enemy name=""wheel"" delay=""4""/>
n	t	t     <enemy name=""wheel"" delay=""6""/>
n	t	t	t <enemy name=""wheel"" delay=""8""/>
n	t	t	t <enemy name=""wheel"" delay=""10""/>
n	t	t	t <enemy name=""wheel"" delay=""12""/>
n	t	t     <enemy name=""wheel"" delay=""14""/>
n	t	t	t <enemy name=""wheel"" delay=""16""/>
n	t	t	t <enemy name=""unit1-line-5"" delay=""3""/>
n	t	t	t <enemy name=""unit1"" delay=""6""/>
n	t	t	t <enemy name=""unit1"" delay=""8""/>
n	t	t	t <enemy name=""unit1-line-5"" delay=""10""/>
n	t	t	t <enemy name=""unit1"" delay=""12""/>
n	t	t	t <enemy name=""unit1"" delay=""14""/>
n	t	t	t <enemy name=""unit1"" delay=""16""/>
n	t	t	t <enemy name=""unit1"" delay=""6""/>
n	t	t	t <enemy name=""unit1"" delay=""8""/>
n	t	t	t <enemy name=""unit1"" delay=""12""/>
n	t	t	t <enemy name=""unit1"" delay=""14""/>
n	t	t	t <enemy name=""unit1"" delay=""16""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""20"" side=""right"" img=""1"">
n	t	t     <enemy name=""airplane"" delay=""1""/>
n	t	t     <enemy name=""wheel"" delay=""2""/>
n	t	t	t <enemy name=""wheel"" delay=""4""/>
n	t	t     <enemy name=""wheel"" delay=""6""/>
n	t	t	t <enemy name=""wheel"" delay=""8""/>
n	t	t	t <enemy name=""wheel"" delay=""10""/>
n	t	t	t <enemy name=""wheel"" delay=""12""/>
n	t	t     <enemy name=""wheel"" delay=""14""/>
n	t	t	t <enemy name=""wheel"" delay=""16""/>
n	t	t	t <enemy name=""unit1-line-5"" delay=""3""/>
n	t	t	t <enemy name=""unit1"" delay=""6""/>
n	t	t	t <enemy name=""unit1"" delay=""8""/>
n	t	t	t <enemy name=""unit1-line-5"" delay=""10""/>
n	t	t	t <enemy name=""unit1"" delay=""12""/>
n	t	t	t <enemy name=""unit1"" delay=""14""/>
n	t	t	t <enemy name=""unit1"" delay=""16""/>
n	t	t	t <enemy name=""unit1"" delay=""6""/>
n	t	t	t <enemy name=""unit1"" delay=""8""/>
n	t	t	t <enemy name=""unit1"" delay=""12""/>
n	t	t	t <enemy name=""unit1"" delay=""14""/>
n	t	t	t <enemy name=""unit1"" delay=""16""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""5"">
n	t	t<wave pause=""0"" lifeTime=""50"" side=""left"" img=""1"">
n	t	t	t<enemy name=""car"" delay=""2""/>
n	t	t	t<enemy name=""car"" delay=""7""/>
n	t	t	t<enemy name=""car"" delay=""12""/>
n	t	t	t<enemy name=""car"" delay=""17""/>
n	t	t	t<enemy name=""car"" delay=""22""/>
n	t	t	t<enemy name=""tanket"" delay=""5""/>
n	t	t	t<enemy name=""tanket"" delay=""10""/>
n	t	t	t<enemy name=""tanket"" delay=""15""/>
n	t	t	t<enemy name=""tanket"" delay=""20""/>
n	t	t	t<enemy name=""tanket"" delay=""25""/>
n	t	t	t<enemy name=""unit2"" delay=""1""/>
n	t	t	t<enemy name=""unit2"" delay=""2""/>
n	t	t	t<enemy name=""unit2"" delay=""3""/>
n	t	t	t<enemy name=""unit2"" delay=""4""/>
n	t	t	t<enemy name=""unit2"" delay=""8""/>
n	t	t	t<enemy name=""unit2"" delay=""10""/>
n	t	t	t<enemy name=""unit2"" delay=""12""/>
n	t	t	t<enemy name=""unit2"" delay=""13""/>
n	t	t	t<enemy name=""unit2"" delay=""14""/>
n	t	t	t<enemy name=""unit2"" delay=""18""/>
n	t	t	t<enemy name=""unit2"" delay=""20""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""50"" side=""right"" img=""1"">
n	t	t	t<enemy name=""car"" delay=""2""/>
n	t	t	t<enemy name=""car"" delay=""7""/>
n	t	t	t<enemy name=""car"" delay=""12""/>
n	t	t	t<enemy name=""car"" delay=""17""/>
n	t	t	t<enemy name=""car"" delay=""22""/>
n	t	t	t<enemy name=""tanket"" delay=""5""/>
n	t	t	t<enemy name=""tanket"" delay=""10""/>
n	t	t	t<enemy name=""tanket"" delay=""15""/>
n	t	t	t<enemy name=""tanket"" delay=""20""/>
n	t	t	t<enemy name=""tanket"" delay=""25""/>
n	t	t	t<enemy name=""unit2"" delay=""1""/>
n	t	t	t<enemy name=""unit2"" delay=""2""/>
n	t	t	t<enemy name=""unit2"" delay=""3""/>
n	t	t	t<enemy name=""unit2"" delay=""4""/>
n	t	t	t<enemy name=""unit2"" delay=""8""/>
n	t	t	t<enemy name=""unit2"" delay=""10""/>
n	t	t	t<enemy name=""unit2"" delay=""12""/>
n	t	t	t<enemy name=""unit2"" delay=""13""/>
n	t	t	t<enemy name=""unit2"" delay=""14""/>
n	t	t	t<enemy name=""unit2"" delay=""18""/>
n	t	t	t<enemy name=""unit2"" delay=""20""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""2"">
n	t     <wave pause=""0"" lifeTime=""50"" side=""left"" img=""1"">
n	t	t    <enemy name=""tank1"" delay=""1""/>
n	t	t	t<enemy name=""tank1"" delay=""5""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""10""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""13""/>
n	t	t	t<enemy name=""tank1"" delay=""15""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""24""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""27""/>
n	t	t	t<enemy name=""parashut"" delay=""10""/>
n	t	t	t<enemy name=""parashut"" delay=""13""/>
n	t	t	t<enemy name=""parashut"" delay=""20""/>
n	t	t	t<enemy name=""parashut"" delay=""24""/>
n	t	t	t<enemy name=""parashut"" delay=""27""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""50"" side=""right"" img=""1"">
n	t	t    <enemy name=""tank1"" delay=""1""/>
n	t	t	t<enemy name=""tank1"" delay=""5""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""10""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""13""/>
n	t	t	t<enemy name=""tank1"" delay=""15""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""24""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""27""/>
n	t	t	t<enemy name=""parashut"" delay=""10""/>
n	t	t	t<enemy name=""parashut"" delay=""13""/>
n	t	t	t<enemy name=""parashut"" delay=""20""/>
n	t	t	t<enemy name=""parashut"" delay=""24""/>
n	t	t	t<enemy name=""parashut"" delay=""27""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""5"">
n	t	t<wave pause=""0"" lifeTime=""40"" side=""left"" img=""1"">
n	t	t    <enemy name=""walker1"" delay=""1""/>
n	t	t    <enemy name=""parashut"" delay=""1""/>
n	t	t    <enemy name=""parashut"" delay=""3""/>
n	t	t	t<enemy name=""parashut"" delay=""6""/>
n	t	t	t<enemy name=""parashut"" delay=""9""/>
n	t	t	t<enemy name=""parashut"" delay=""12""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""40"" side=""right"" img=""1"">
n	t	t    <enemy name=""walker1"" delay=""1""/>
n	t	t    <enemy name=""parashut"" delay=""1""/>
n	t	t    <enemy name=""parashut"" delay=""3""/>
n	t	t	t<enemy name=""parashut"" delay=""6""/>
n	t	t	t<enemy name=""parashut"" delay=""9""/>
n	t	t	t<enemy name=""parashut"" delay=""12""/>
n	t	t</wave>
n	t</group>
n	t
n</level>")("<level eye="normal" money="37000" maxTower="5" maxUpgrade="2" bg="3" threeStarHealth="80" twoStarHealth="60" preStartMoney="2000">
	<!-- 
		pause - пауза перед появлением, (секунды)
		lifeTime - время жизни волны, (секунды)
		img - картинка, иконка досрочного вызова волны
		side - сторона, откуда появится враг (left, right), - можно указывать целиком волне и также отдельным юнитам
	-->
    <group pause="5">
		<wave pause="0" lifeTime="20" side="left" img="1">
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit2" delay="1"/>

		</wave>
		<wave pause="0" lifeTime="20" side="right" img="1">
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit2" delay="1"/>
		</wave>
	</group>
	 <group pause="0">
		<wave pause="0" lifeTime="30" side="left" img="1">
		    <enemy name="tanket" delay="1"/>
			<enemy name="unit2" delay="1"/>
			<enemy name="unit2" delay="4"/>
			<enemy name="unit2" delay="7"/>
			<enemy name="unit2" delay="10"/>
			<enemy name="unit2" delay="13"/>
			<enemy name="unit2" delay="16"/>
    	</wave>
		<wave pause="0" lifeTime="30" side="right" img="1">
		    <enemy name="tanket" delay="1"/>
			<enemy name="unit2" delay="1"/>
			<enemy name="unit2" delay="4"/>
			<enemy name="unit2" delay="7"/>
			<enemy name="unit2" delay="10"/>
			<enemy name="unit2" delay="13"/>
			<enemy name="unit2" delay="16"/>
		</wave>
	</group>
	 <group pause="0">
		<wave pause="0" lifeTime="50" side="left" img="1">
			<enemy name="aerostat" delay="1"/>
			<enemy name="aerostat" delay="4"/>
			<enemy name="unit2" delay="4"/>
			<enemy name="unit2" delay="7"/>
			<enemy name="unit2" delay="10"/>
			<enemy name="unit2" delay="13"/>
			<enemy name="unit2" delay="16"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit1" delay="16"/>
    	</wave>
		<wave pause="0" lifeTime="50" side="right" img="1">
			<enemy name="aerostat" delay="1"/>
			<enemy name="aerostat" delay="4"/>
			<enemy name="unit2" delay="4"/>
			<enemy name="unit2" delay="7"/>
			<enemy name="unit2" delay="10"/>
			<enemy name="unit2" delay="13"/>
			<enemy name="unit2" delay="16"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit1" delay="16"/>
		</wave>
	</group>
	<group pause="5">
		<wave pause="0" lifeTime="50" side="left" img="1">
			<enemy name="airplane" delay="1"/>
			<enemy name="airplane" delay="2"/>
			<enemy name="car" delay="1"/>
			<enemy name="tanket" delay="5"/>
			<enemy name="tanket" delay="10"/>
			<enemy name="tanket" delay="15"/>
			<enemy name="tanket" delay="20"/>
			<enemy name="car" delay="25"/>
			<enemy name="unit2" delay="5"/>
			<enemy name="unit1-line-3" delay="8"/>
			<enemy name="unit1-line-3" delay="13"/>
			<enemy name="unit2" delay="15"/>
			<enemy name="unit2" delay="16"/>
			<enemy name="unit2" delay="20"/>
			<enemy name="unit1-line-3" delay="23"/>
			<enemy name="unit2" delay="25"/>
			<enemy name="unit1-line-3" delay="27"/>
    	</wave>
		<wave pause="0" lifeTime="50" side="right" img="1">
			<enemy name="airplane" delay="1"/>
			<enemy name="airplane" delay="2"/>
			<enemy name="car" delay="1"/>
			<enemy name="tanket" delay="5"/>
			<enemy name="tanket" delay="10"/>
			<enemy name="tanket" delay="15"/>
			<enemy name="tanket" delay="20"/>
			<enemy name="car" delay="25"/>
			<enemy name="unit2" delay="5"/>
			<enemy name="unit1-line-3" delay="8"/>
			<enemy name="unit1-line-3" delay="13"/>
			<enemy name="unit2" delay="15"/>
			<enemy name="unit2" delay="16"/>
			<enemy name="unit2" delay="20"/>
			<enemy name="unit1-line-3" delay="23"/>
			<enemy name="unit2" delay="25"/>
			<enemy name="unit1-line-3" delay="27"/>
		</wave>
	</group>
	<group pause="0">
		<wave pause="0" lifeTime="20" side="left" img="1">
		     <enemy name="wheel" delay="5"/>
			 <enemy name="wheel" delay="7"/>
		     <enemy name="wheel" delay="9"/>
			 <enemy name="wheel" delay="11"/>
			 <enemy name="wheel" delay="6"/>
			 <enemy name="wheel" delay="8"/>
		     <enemy name="wheel" delay="10"/>
			 <enemy name="wheel" delay="12"/>
		</wave>
		<wave pause="0" lifeTime="20" side="right" img="1">
		     <enemy name="wheel" delay="5"/>
			 <enemy name="wheel" delay="7"/>
		     <enemy name="wheel" delay="9"/>
			 <enemy name="wheel" delay="11"/>
			 <enemy name="wheel" delay="6"/>
			 <enemy name="wheel" delay="8"/>
		     <enemy name="wheel" delay="10"/>
			 <enemy name="wheel" delay="12"/>
		</wave>
	</group>
	<group pause="0">
		<wave pause="0" lifeTime="20" side="right" img="1">
		     <enemy name="tank1" delay="1"/>
		     <enemy name="tank1" delay="3"/>
		     <enemy name="tank1" delay="5"/>
		</wave>
	</group>
	<group pause="0">
		<wave pause="0" lifeTime="20" side="left" img="1">
		     <enemy name="airplane" delay="1"/>
		     <enemy name="wheel" delay="2"/>
			 <enemy name="wheel" delay="4"/>
		     <enemy name="wheel" delay="6"/>
			 <enemy name="wheel" delay="8"/>
			 <enemy name="wheel" delay="10"/>
			 <enemy name="wheel" delay="12"/>
		     <enemy name="wheel" delay="14"/>
			 <enemy name="wheel" delay="16"/>
			 <enemy name="unit1-line-5" delay="3"/>
			 <enemy name="unit1" delay="6"/>
			 <enemy name="unit1" delay="8"/>
			 <enemy name="unit1-line-5" delay="10"/>
			 <enemy name="unit1" delay="12"/>
			 <enemy name="unit1" delay="14"/>
			 <enemy name="unit1" delay="16"/>
			 <enemy name="unit1" delay="6"/>
			 <enemy name="unit1" delay="8"/>
			 <enemy name="unit1" delay="12"/>
			 <enemy name="unit1" delay="14"/>
			 <enemy name="unit1" delay="16"/>
		</wave>
		<wave pause="0" lifeTime="20" side="right" img="1">
		     <enemy name="airplane" delay="1"/>
		     <enemy name="wheel" delay="2"/>
			 <enemy name="wheel" delay="4"/>
		     <enemy name="wheel" delay="6"/>
			 <enemy name="wheel" delay="8"/>
			 <enemy name="wheel" delay="10"/>
			 <enemy name="wheel" delay="12"/>
		     <enemy name="wheel" delay="14"/>
			 <enemy name="wheel" delay="16"/>
			 <enemy name="unit1-line-5" delay="3"/>
			 <enemy name="unit1" delay="6"/>
			 <enemy name="unit1" delay="8"/>
			 <enemy name="unit1-line-5" delay="10"/>
			 <enemy name="unit1" delay="12"/>
			 <enemy name="unit1" delay="14"/>
			 <enemy name="unit1" delay="16"/>
			 <enemy name="unit1" delay="6"/>
			 <enemy name="unit1" delay="8"/>
			 <enemy name="unit1" delay="12"/>
			 <enemy name="unit1" delay="14"/>
			 <enemy name="unit1" delay="16"/>
		</wave>
	</group>
	<group pause="5">
		<wave pause="0" lifeTime="50" side="left" img="1">
			<enemy name="car" delay="2"/>
			<enemy name="car" delay="7"/>
			<enemy name="car" delay="12"/>
			<enemy name="car" delay="17"/>
			<enemy name="car" delay="22"/>
			<enemy name="tanket" delay="5"/>
			<enemy name="tanket" delay="10"/>
			<enemy name="tanket" delay="15"/>
			<enemy name="tanket" delay="20"/>
			<enemy name="tanket" delay="25"/>
			<enemy name="unit2" delay="1"/>
			<enemy name="unit2" delay="2"/>
			<enemy name="unit2" delay="3"/>
			<enemy name="unit2" delay="4"/>
			<enemy name="unit2" delay="8"/>
			<enemy name="unit2" delay="10"/>
			<enemy name="unit2" delay="12"/>
			<enemy name="unit2" delay="13"/>
			<enemy name="unit2" delay="14"/>
			<enemy name="unit2" delay="18"/>
			<enemy name="unit2" delay="20"/>
		</wave>
		<wave pause="0" lifeTime="50" side="right" img="1">
			<enemy name="car" delay="2"/>
			<enemy name="car" delay="7"/>
			<enemy name="car" delay="12"/>
			<enemy name="car" delay="17"/>
			<enemy name="car" delay="22"/>
			<enemy name="tanket" delay="5"/>
			<enemy name="tanket" delay="10"/>
			<enemy name="tanket" delay="15"/>
			<enemy name="tanket" delay="20"/>
			<enemy name="tanket" delay="25"/>
			<enemy name="unit2" delay="1"/>
			<enemy name="unit2" delay="2"/>
			<enemy name="unit2" delay="3"/>
			<enemy name="unit2" delay="4"/>
			<enemy name="unit2" delay="8"/>
			<enemy name="unit2" delay="10"/>
			<enemy name="unit2" delay="12"/>
			<enemy name="unit2" delay="13"/>
			<enemy name="unit2" delay="14"/>
			<enemy name="unit2" delay="18"/>
			<enemy name="unit2" delay="20"/>
		</wave>
	</group>
	<group pause="2">
	     <wave pause="0" lifeTime="50" side="left" img="1">
		    <enemy name="tank1" delay="1"/>
			<enemy name="tank1" delay="5"/>
			<enemy name="unit1-line-4" delay="10"/>
			<enemy name="unit1-line-4" delay="13"/>
			<enemy name="tank1" delay="15"/>
			<enemy name="unit1-line-4" delay="24"/>
			<enemy name="unit1-line-4" delay="27"/>
			<enemy name="parashut" delay="10"/>
			<enemy name="parashut" delay="13"/>
			<enemy name="parashut" delay="20"/>
			<enemy name="parashut" delay="24"/>
			<enemy name="parashut" delay="27"/>
		</wave>
		<wave pause="0" lifeTime="50" side="right" img="1">
		    <enemy name="tank1" delay="1"/>
			<enemy name="tank1" delay="5"/>
			<enemy name="unit1-line-4" delay="10"/>
			<enemy name="unit1-line-4" delay="13"/>
			<enemy name="tank1" delay="15"/>
			<enemy name="unit1-line-4" delay="24"/>
			<enemy name="unit1-line-4" delay="27"/>
			<enemy name="parashut" delay="10"/>
			<enemy name="parashut" delay="13"/>
			<enemy name="parashut" delay="20"/>
			<enemy name="parashut" delay="24"/>
			<enemy name="parashut" delay="27"/>
		</wave>
	</group>
	<group pause="5">
		<wave pause="0" lifeTime="40" side="left" img="1">
		    <enemy name="walker1" delay="1"/>
		    <enemy name="parashut" delay="1"/>
		    <enemy name="parashut" delay="3"/>
			<enemy name="parashut" delay="6"/>
			<enemy name="parashut" delay="9"/>
			<enemy name="parashut" delay="12"/>
		</wave>
		<wave pause="0" lifeTime="40" side="right" img="1">
		    <enemy name="walker1" delay="1"/>
		    <enemy name="parashut" delay="1"/>
		    <enemy name="parashut" delay="3"/>
			<enemy name="parashut" delay="6"/>
			<enemy name="parashut" delay="9"/>
			<enemy name="parashut" delay="12"/>
		</wave>
	</group>
	
</level>;
            var _loc_9:* = <level eye=""normal"" money=""39000"" maxTower=""5"" maxUpgrade=""2"" bg=""3"" upgradeTwo=""true"" threeStarHealth=""80"" twoStarHealth=""60"" preStartMoney=""2000"">
n	t<!-- 
n	t	tpause - пауза перед появлением, (секунды)
n	t	tlifeTime - время жизни волны, (секунды)
n	t	timg - картинка, иконка досрочного вызова волны
n	t	tside - сторона, откуда появится враг (left, right), - можно указывать целиком волне и также отдельным юнитам
n	t-->
n
n	t <group pause=""5"">
n	t	t<wave pause=""0"" lifeTime=""30"" side=""left"" img=""1"">
n	t	t	t<enemy name=""aerostat"" delay=""1""/>
n	t	t	t<enemy name=""aerostat"" delay=""7""/>
n    	t</wave>
n	t	t<wave pause=""0"" lifeTime=""30"" side=""right"" img=""1"">
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit1"" delay=""17""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t</wave>
n	t</group>
n	t <group pause=""5"">
n	t	t<wave pause=""0"" lifeTime=""30"" side=""left"" img=""1"">
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit1"" delay=""17""/>
n	t	t	t<enemy name=""unit1"" delay=""18""/>
n	t	t	t<enemy name=""unit1"" delay=""19""/>
n    	t</wave>
n	t	t<wave pause=""0"" lifeTime=""30"" side=""right"" img=""1"">
n	t	t	t<enemy name=""tanket"" delay=""1""/>
n	t	t	t<enemy name=""tanket"" delay=""5""/>
n	t	t	t<enemy name=""tanket"" delay=""10""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""30"" side=""left"" img=""1"">
n	t	t	t<enemy name=""parashut"" delay=""1""/>
n	t	t	t<enemy name=""parashut"" delay=""3""/>
n	t	t	t<enemy name=""parashut"" delay=""5""/>
n	t	t	t<enemy name=""parashut"" delay=""8""/>
n	t	t	t<enemy name=""parashut"" delay=""10""/>
n	t	t	t<enemy name=""parashut"" delay=""14""/>
n	t	t	t<enemy name=""parashut"" delay=""16""/>
n	t	t	t<enemy name=""parashut"" delay=""3""/>
n	t	t	t<enemy name=""parashut"" delay=""9""/>
n	t	t	t<enemy name=""parashut"" delay=""14""/>
n	t	t	t<enemy name=""parashut"" delay=""10""/>
n	t	t	t<enemy name=""parashut"" delay=""11""/>
n	t	t	t<enemy name=""parashut"" delay=""12""/>
n	t	t	t<enemy name=""parashut"" delay=""13""/>
n	t	t	t<enemy name=""parashut"" delay=""14""/>
n	t	t	t<enemy name=""parashut"" delay=""15""/>
n	t	t	t<enemy name=""parashut"" delay=""16""/>
n	t	t	t<enemy name=""parashut"" delay=""17""/>
n	t	t	t<enemy name=""parashut"" delay=""18""/>
n	t	t	t<enemy name=""parashut"" delay=""19""/>
n	t	t	t<enemy name=""parashut"" delay=""10""/>
n	t	t	t<enemy name=""parashut"" delay=""11""/>
n	t	t	t<enemy name=""parashut"" delay=""12""/>
n	t	t	t<enemy name=""parashut"" delay=""13""/>
n	t	t	t<enemy name=""parashut"" delay=""14""/>
n	t	t	t<enemy name=""parashut"" delay=""15""/>
n	t	t	t<enemy name=""parashut"" delay=""16""/>
n	t	t	t<enemy name=""parashut"" delay=""17""/>
n	t	t	t<enemy name=""parashut"" delay=""18""/>
n	t	t	t<enemy name=""parashut"" delay=""19""/>
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit1"" delay=""17""/>
n    	t</wave>
n	t	t<wave pause=""0"" lifeTime=""30"" side=""right"" img=""1"">
n	t	t<enemy name=""parashut"" delay=""1""/>
n	t	t	t<enemy name=""parashut"" delay=""1""/>
n	t	t	t<enemy name=""parashut"" delay=""3""/>
n	t	t	t<enemy name=""parashut"" delay=""5""/>
n	t	t	t<enemy name=""parashut"" delay=""8""/>
n	t	t	t<enemy name=""parashut"" delay=""10""/>
n	t	t	t<enemy name=""parashut"" delay=""14""/>
n	t	t	t<enemy name=""parashut"" delay=""16""/>
n	t	t	t<enemy name=""parashut"" delay=""3""/>
n	t	t	t<enemy name=""parashut"" delay=""9""/>
n	t	t	t<enemy name=""parashut"" delay=""14""/>
n	t	t	t<enemy name=""parashut"" delay=""10""/>
n	t	t	t<enemy name=""parashut"" delay=""11""/>
n	t	t	t<enemy name=""parashut"" delay=""12""/>
n	t	t	t<enemy name=""parashut"" delay=""13""/>
n	t	t	t<enemy name=""parashut"" delay=""14""/>
n	t	t	t<enemy name=""parashut"" delay=""15""/>
n	t	t	t<enemy name=""parashut"" delay=""16""/>
n	t	t	t<enemy name=""parashut"" delay=""17""/>
n	t	t	t<enemy name=""parashut"" delay=""18""/>
n	t	t	t<enemy name=""parashut"" delay=""19""/>
n	t	t	t<enemy name=""parashut"" delay=""10""/>
n	t	t	t<enemy name=""parashut"" delay=""11""/>
n	t	t	t<enemy name=""parashut"" delay=""12""/>
n	t	t	t<enemy name=""parashut"" delay=""13""/>
n	t	t	t<enemy name=""parashut"" delay=""14""/>
n	t	t	t<enemy name=""parashut"" delay=""15""/>
n	t	t	t<enemy name=""parashut"" delay=""16""/>
n	t	t	t<enemy name=""parashut"" delay=""17""/>
n	t	t	t<enemy name=""parashut"" delay=""18""/>
n	t	t	t<enemy name=""parashut"" delay=""19""/>
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit1"" delay=""17""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""5"">
n	t	t<wave pause=""0"" lifeTime=""30"" side=""left"" img=""1"">
n	t	t	t<enemy name=""car"" delay=""1""/>
n	t	t	t<enemy name=""car"" delay=""5""/>
n	t	t	t<enemy name=""car"" delay=""10""/>
n    	t</wave>
n	t	t<wave pause=""0"" lifeTime=""30"" side=""right"" img=""1"">
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit1"" delay=""17""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""4"">
n	t	t<wave pause=""0"" lifeTime=""50"" side=""left"" img=""1"">
n	t	t	t<enemy name=""tanket"" delay=""6""/>
n	t	t	t<enemy name=""tanket"" delay=""12""/>
n	t	t	t<enemy name=""tanket"" delay=""18""/>
n	t	t	t<enemy name=""tanket"" delay=""24""/>
n	t	t	t<enemy name=""unit2"" delay=""2""/>
n	t	t	t<enemy name=""unit2"" delay=""8""/>
n	t	t	t<enemy name=""unit2"" delay=""14""/>
n	t	t	t<enemy name=""unit2"" delay=""20""/>
n	t	t	t<enemy name=""unit2"" delay=""22""/>
n	t	t	t<enemy name=""aerostat"" delay=""1""/>
n	t	t	t<enemy name=""aerostat"" delay=""8""/>
n	t	t	t<enemy name=""aerostat"" delay=""15""/>
n    	t</wave>
n	t	t<wave pause=""0"" lifeTime=""50"" side=""right"" img=""1"">
n	t	t	t<enemy name=""tanket"" delay=""6""/>
n	t	t	t<enemy name=""tanket"" delay=""12""/>
n	t	t	t<enemy name=""tanket"" delay=""18""/>
n	t	t	t<enemy name=""tanket"" delay=""24""/>
n	t	t	t<enemy name=""unit2"" delay=""2""/>
n	t	t	t<enemy name=""unit2"" delay=""8""/>
n	t	t	t<enemy name=""unit2"" delay=""14""/>
n	t	t	t<enemy name=""unit2"" delay=""20""/>
n	t	t	t<enemy name=""unit2"" delay=""22""/>
n	t	t	t<enemy name=""aerostat"" delay=""1""/>
n	t	t	t<enemy name=""aerostat"" delay=""8""/>
n	t	t	t<enemy name=""aerostat"" delay=""15""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""5"">
n	t	t<wave pause=""0"" lifeTime=""30"" side=""left"" img=""1"">
n	t	t	t<enemy name=""tanket"" delay=""1""/>
n	t	t	t<enemy name=""tanket"" delay=""10""/>
n	t	t	t<enemy name=""tanket"" delay=""20""/>
n	t	t	t<enemy name=""tanket"" delay=""30""/>
n	t	t	t<enemy name=""car"" delay=""5""/>
n	t	t	t<enemy name=""car"" delay=""15""/>
n	t	t	t<enemy name=""car"" delay=""25""/>
n	t	t	t<enemy name=""car"" delay=""35""/>
n    	t</wave>
n	t	t<wave pause=""0"" lifeTime=""30"" side=""right"" img=""1"">
n	t	t	t<enemy name=""tanket"" delay=""1""/>
n	t	t	t<enemy name=""tanket"" delay=""10""/>
n	t	t	t<enemy name=""tanket"" delay=""20""/>
n	t	t	t<enemy name=""tanket"" delay=""30""/>
n	t	t	t<enemy name=""car"" delay=""5""/>
n	t	t	t<enemy name=""car"" delay=""15""/>
n	t	t	t<enemy name=""car"" delay=""25""/>
n	t	t	t<enemy name=""car"" delay=""35""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""5"">
n	t	t<wave pause=""0"" lifeTime=""50"" side=""left"" img=""1"">
n	t	t	t<enemy name=""tank2"" delay=""1""/>
n    	t</wave>
n	t</group>
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""50"" side=""left"" img=""1"">
n	t	t	t<enemy name=""tank2"" delay=""1""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""2""/>
n    	t</wave>
n	t	t<wave pause=""0"" lifeTime=""50"" side=""right"" img=""1"">
n	t	t	t<enemy name=""tank2"" delay=""1""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""2""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""5"">
n	t	t<wave pause=""0"" lifeTime=""50"" side=""left"" img=""1"">
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""6""/>
n	t	t	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""12""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit1"" delay=""17""/>
n	t	t	t<enemy name=""unit1"" delay=""18""/>
n	t	t	t<enemy name=""unit1"" delay=""19""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""50"" side=""right"" img=""1"">
n	t	t   <enemy name=""walker1"" delay=""1""/>
n	t	t</wave>
n	t</group>	t
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""50"" side=""left"" img=""1"">
n	t	t	t<enemy name=""tank2"" delay=""1""/>
n	t	t	t<enemy name=""tank2"" delay=""10""/>
n	t	t	t<enemy name=""aerostat"" delay=""1""/>
n	t	t	t<enemy name=""aerostat"" delay=""8""/>
n	t	t	t<enemy name=""aerostat"" delay=""15""/>
n    	t</wave>
n	t	t<wave pause=""0"" lifeTime=""50"" side=""right"" img=""1"">
n	t	t	t<enemy name=""tank2"" delay=""1""/>
n	t	t	t<enemy name=""tank2"" delay=""10""/>
n	t	t	t<enemy name=""aerostat"" delay=""1""/>
n	t	t	t<enemy name=""aerostat"" delay=""8""/>
n	t	t	t<enemy name=""aerostat"" delay=""15""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""20"" side=""left"" img=""1"">
n	t	t     <enemy name=""wheel"" delay=""5""/>
n	t	t	t <enemy name=""wheel"" delay=""7""/>
n	t	t     <enemy name=""wheel"" delay=""9""/>
n	t	t	t <enemy name=""wheel"" delay=""11""/>
n	t	t	t <enemy name=""wheel"" delay=""6""/>
n	t	t	t <enemy name=""wheel"" delay=""8""/>
n	t	t     <enemy name=""wheel"" delay=""10""/>
n	t	t	t <enemy name=""wheel"" delay=""12""/>
n	t	t	t <enemy name=""parashut"" delay=""3""/>
n	t	t	t <enemy name=""parashut"" delay=""7""/>
n	t	t	t <enemy name=""parashut"" delay=""9""/>
n	t	t	t <enemy name=""parashut"" delay=""11""/>
n	t	t	t <enemy name=""parashut"" delay=""14""/>
n	t	t	t <enemy name=""parashut"" delay=""16""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""20"" side=""right"" img=""1"">
n	t	t     <enemy name=""wheel"" delay=""5""/>
n	t	t	t <enemy name=""wheel"" delay=""7""/>
n	t	t     <enemy name=""wheel"" delay=""9""/>
n	t	t	t <enemy name=""wheel"" delay=""11""/>
n	t	t	t <enemy name=""wheel"" delay=""6""/>
n	t	t	t <enemy name=""wheel"" delay=""8""/>
n	t	t     <enemy name=""wheel"" delay=""10""/>
n	t	t	t <enemy name=""wheel"" delay=""12""/>
n	t	t	t <enemy name=""parashut"" delay=""3""/>
n	t	t	t <enemy name=""parashut"" delay=""7""/>
n	t	t	t <enemy name=""parashut"" delay=""9""/>
n	t	t	t <enemy name=""parashut"" delay=""11""/>
n	t	t	t <enemy name=""parashut"" delay=""14""/>
n	t	t	t <enemy name=""parashut"" delay=""16""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""5"">
n	t	t<wave pause=""0"" lifeTime=""30"" side=""left"" img=""1"">
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit1"" delay=""17""/>
n	t	t	t<enemy name=""unit2"" delay=""3""/>
n	t	t	t<enemy name=""unit2"" delay=""9""/>
n	t	t	t<enemy name=""unit2"" delay=""11""/>
n	t	t	t<enemy name=""unit2"" delay=""16""/>
n	t	t	t<enemy name=""car"" delay=""1""/>
n	t	t	t<enemy name=""car"" delay=""5""/>
n	t	t	t<enemy name=""tank1"" delay=""10""/>
n	t	t	t<enemy name=""tank2"" delay=""15""/>
n	t	t	t<enemy name=""car"" delay=""20""/>
n	t	t	t<enemy name=""parashut"" delay=""7""/>
n	t	t	t<enemy name=""parashut"" delay=""9""/>
n	t	t	t<enemy name=""parashut"" delay=""11""/>
n	t	t	t<enemy name=""parashut"" delay=""14""/>
n	t	t	t<enemy name=""parashut"" delay=""16""/>
n    	t</wave>
n	t	t<wave pause=""0"" lifeTime=""30"" side=""right"" img=""1"">
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit1"" delay=""17""/>
n	t	t	t<enemy name=""unit2"" delay=""3""/>
n	t	t	t<enemy name=""unit2"" delay=""9""/>
n	t	t	t<enemy name=""unit2"" delay=""11""/>
n	t	t	t<enemy name=""unit2"" delay=""16""/>
n	t	t	t<enemy name=""car"" delay=""1""/>
n	t	t	t<enemy name=""car"" delay=""5""/>
n	t	t	t<enemy name=""tank1"" delay=""10""/>
n	t	t	t<enemy name=""tank2"" delay=""15""/>
n	t	t	t<enemy name=""car"" delay=""20""/>
n	t	t	t<enemy name=""parashut"" delay=""7""/>
n	t	t	t<enemy name=""parashut"" delay=""9""/>
n	t	t	t<enemy name=""parashut"" delay=""11""/>
n	t	t	t<enemy name=""parashut"" delay=""14""/>
n	t	t	t<enemy name=""parashut"" delay=""16""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""40"" side=""left"" img=""1"">
n	t	t   <enemy name=""walker1"" delay=""5""/>
n	t	t   <enemy name=""aerostat"" delay=""1""/>
n	t	t   <enemy name=""aerostat"" delay=""5""/>
n	t	t   <enemy name=""aerostat"" delay=""9""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""40"" side=""right"" img=""1"">
n	t	t   <enemy name=""walker1"" delay=""5""/>
n	t	t   <enemy name=""aerostat"" delay=""1""/>
n	t	t   <enemy name=""aerostat"" delay=""5""/>
n	t	t   <enemy name=""aerostat"" delay=""9""/>
n	t	t</wave>
n	t</group>
n</level>")("<level eye="normal" money="39000" maxTower="5" maxUpgrade="2" bg="3" upgradeTwo="true" threeStarHealth="80" twoStarHealth="60" preStartMoney="2000">
	<!-- 
		pause - пауза перед появлением, (секунды)
		lifeTime - время жизни волны, (секунды)
		img - картинка, иконка досрочного вызова волны
		side - сторона, откуда появится враг (left, right), - можно указывать целиком волне и также отдельным юнитам
	-->

	 <group pause="5">
		<wave pause="0" lifeTime="30" side="left" img="1">
			<enemy name="aerostat" delay="1"/>
			<enemy name="aerostat" delay="7"/>
    	</wave>
		<wave pause="0" lifeTime="30" side="right" img="1">
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit1" delay="7"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit1" delay="17"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="7"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="16"/>
		</wave>
	</group>
	 <group pause="5">
		<wave pause="0" lifeTime="30" side="left" img="1">
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit1" delay="7"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit1" delay="17"/>
			<enemy name="unit1" delay="18"/>
			<enemy name="unit1" delay="19"/>
    	</wave>
		<wave pause="0" lifeTime="30" side="right" img="1">
			<enemy name="tanket" delay="1"/>
			<enemy name="tanket" delay="5"/>
			<enemy name="tanket" delay="10"/>
		</wave>
	</group>
	<group pause="0">
		<wave pause="0" lifeTime="30" side="left" img="1">
			<enemy name="parashut" delay="1"/>
			<enemy name="parashut" delay="3"/>
			<enemy name="parashut" delay="5"/>
			<enemy name="parashut" delay="8"/>
			<enemy name="parashut" delay="10"/>
			<enemy name="parashut" delay="14"/>
			<enemy name="parashut" delay="16"/>
			<enemy name="parashut" delay="3"/>
			<enemy name="parashut" delay="9"/>
			<enemy name="parashut" delay="14"/>
			<enemy name="parashut" delay="10"/>
			<enemy name="parashut" delay="11"/>
			<enemy name="parashut" delay="12"/>
			<enemy name="parashut" delay="13"/>
			<enemy name="parashut" delay="14"/>
			<enemy name="parashut" delay="15"/>
			<enemy name="parashut" delay="16"/>
			<enemy name="parashut" delay="17"/>
			<enemy name="parashut" delay="18"/>
			<enemy name="parashut" delay="19"/>
			<enemy name="parashut" delay="10"/>
			<enemy name="parashut" delay="11"/>
			<enemy name="parashut" delay="12"/>
			<enemy name="parashut" delay="13"/>
			<enemy name="parashut" delay="14"/>
			<enemy name="parashut" delay="15"/>
			<enemy name="parashut" delay="16"/>
			<enemy name="parashut" delay="17"/>
			<enemy name="parashut" delay="18"/>
			<enemy name="parashut" delay="19"/>
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit1" delay="7"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit1" delay="17"/>
    	</wave>
		<wave pause="0" lifeTime="30" side="right" img="1">
		<enemy name="parashut" delay="1"/>
			<enemy name="parashut" delay="1"/>
			<enemy name="parashut" delay="3"/>
			<enemy name="parashut" delay="5"/>
			<enemy name="parashut" delay="8"/>
			<enemy name="parashut" delay="10"/>
			<enemy name="parashut" delay="14"/>
			<enemy name="parashut" delay="16"/>
			<enemy name="parashut" delay="3"/>
			<enemy name="parashut" delay="9"/>
			<enemy name="parashut" delay="14"/>
			<enemy name="parashut" delay="10"/>
			<enemy name="parashut" delay="11"/>
			<enemy name="parashut" delay="12"/>
			<enemy name="parashut" delay="13"/>
			<enemy name="parashut" delay="14"/>
			<enemy name="parashut" delay="15"/>
			<enemy name="parashut" delay="16"/>
			<enemy name="parashut" delay="17"/>
			<enemy name="parashut" delay="18"/>
			<enemy name="parashut" delay="19"/>
			<enemy name="parashut" delay="10"/>
			<enemy name="parashut" delay="11"/>
			<enemy name="parashut" delay="12"/>
			<enemy name="parashut" delay="13"/>
			<enemy name="parashut" delay="14"/>
			<enemy name="parashut" delay="15"/>
			<enemy name="parashut" delay="16"/>
			<enemy name="parashut" delay="17"/>
			<enemy name="parashut" delay="18"/>
			<enemy name="parashut" delay="19"/>
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit1" delay="7"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit1" delay="17"/>
		</wave>
	</group>
	<group pause="5">
		<wave pause="0" lifeTime="30" side="left" img="1">
			<enemy name="car" delay="1"/>
			<enemy name="car" delay="5"/>
			<enemy name="car" delay="10"/>
    	</wave>
		<wave pause="0" lifeTime="30" side="right" img="1">
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit1" delay="7"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit1" delay="17"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="7"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="16"/>
		</wave>
	</group>
	<group pause="4">
		<wave pause="0" lifeTime="50" side="left" img="1">
			<enemy name="tanket" delay="6"/>
			<enemy name="tanket" delay="12"/>
			<enemy name="tanket" delay="18"/>
			<enemy name="tanket" delay="24"/>
			<enemy name="unit2" delay="2"/>
			<enemy name="unit2" delay="8"/>
			<enemy name="unit2" delay="14"/>
			<enemy name="unit2" delay="20"/>
			<enemy name="unit2" delay="22"/>
			<enemy name="aerostat" delay="1"/>
			<enemy name="aerostat" delay="8"/>
			<enemy name="aerostat" delay="15"/>
    	</wave>
		<wave pause="0" lifeTime="50" side="right" img="1">
			<enemy name="tanket" delay="6"/>
			<enemy name="tanket" delay="12"/>
			<enemy name="tanket" delay="18"/>
			<enemy name="tanket" delay="24"/>
			<enemy name="unit2" delay="2"/>
			<enemy name="unit2" delay="8"/>
			<enemy name="unit2" delay="14"/>
			<enemy name="unit2" delay="20"/>
			<enemy name="unit2" delay="22"/>
			<enemy name="aerostat" delay="1"/>
			<enemy name="aerostat" delay="8"/>
			<enemy name="aerostat" delay="15"/>
		</wave>
	</group>
	<group pause="5">
		<wave pause="0" lifeTime="30" side="left" img="1">
			<enemy name="tanket" delay="1"/>
			<enemy name="tanket" delay="10"/>
			<enemy name="tanket" delay="20"/>
			<enemy name="tanket" delay="30"/>
			<enemy name="car" delay="5"/>
			<enemy name="car" delay="15"/>
			<enemy name="car" delay="25"/>
			<enemy name="car" delay="35"/>
    	</wave>
		<wave pause="0" lifeTime="30" side="right" img="1">
			<enemy name="tanket" delay="1"/>
			<enemy name="tanket" delay="10"/>
			<enemy name="tanket" delay="20"/>
			<enemy name="tanket" delay="30"/>
			<enemy name="car" delay="5"/>
			<enemy name="car" delay="15"/>
			<enemy name="car" delay="25"/>
			<enemy name="car" delay="35"/>
		</wave>
	</group>
	<group pause="5">
		<wave pause="0" lifeTime="50" side="left" img="1">
			<enemy name="tank2" delay="1"/>
    	</wave>
	</group>
	<group pause="0">
		<wave pause="0" lifeTime="50" side="left" img="1">
			<enemy name="tank2" delay="1"/>
			<enemy name="unit1-line-4" delay="2"/>
    	</wave>
		<wave pause="0" lifeTime="50" side="right" img="1">
			<enemy name="tank2" delay="1"/>
			<enemy name="unit1-line-4" delay="2"/>
		</wave>
	</group>
	<group pause="5">
		<wave pause="0" lifeTime="50" side="left" img="1">
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit1" delay="6"/>
			<enemy name="unit1" delay="7"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="12"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit1" delay="17"/>
			<enemy name="unit1" delay="18"/>
			<enemy name="unit1" delay="19"/>
		</wave>
		<wave pause="0" lifeTime="50" side="right" img="1">
		   <enemy name="walker1" delay="1"/>
		</wave>
	</group>	
	<group pause="0">
		<wave pause="0" lifeTime="50" side="left" img="1">
			<enemy name="tank2" delay="1"/>
			<enemy name="tank2" delay="10"/>
			<enemy name="aerostat" delay="1"/>
			<enemy name="aerostat" delay="8"/>
			<enemy name="aerostat" delay="15"/>
    	</wave>
		<wave pause="0" lifeTime="50" side="right" img="1">
			<enemy name="tank2" delay="1"/>
			<enemy name="tank2" delay="10"/>
			<enemy name="aerostat" delay="1"/>
			<enemy name="aerostat" delay="8"/>
			<enemy name="aerostat" delay="15"/>
		</wave>
	</group>
	<group pause="0">
		<wave pause="0" lifeTime="20" side="left" img="1">
		     <enemy name="wheel" delay="5"/>
			 <enemy name="wheel" delay="7"/>
		     <enemy name="wheel" delay="9"/>
			 <enemy name="wheel" delay="11"/>
			 <enemy name="wheel" delay="6"/>
			 <enemy name="wheel" delay="8"/>
		     <enemy name="wheel" delay="10"/>
			 <enemy name="wheel" delay="12"/>
			 <enemy name="parashut" delay="3"/>
			 <enemy name="parashut" delay="7"/>
			 <enemy name="parashut" delay="9"/>
			 <enemy name="parashut" delay="11"/>
			 <enemy name="parashut" delay="14"/>
			 <enemy name="parashut" delay="16"/>
		</wave>
		<wave pause="0" lifeTime="20" side="right" img="1">
		     <enemy name="wheel" delay="5"/>
			 <enemy name="wheel" delay="7"/>
		     <enemy name="wheel" delay="9"/>
			 <enemy name="wheel" delay="11"/>
			 <enemy name="wheel" delay="6"/>
			 <enemy name="wheel" delay="8"/>
		     <enemy name="wheel" delay="10"/>
			 <enemy name="wheel" delay="12"/>
			 <enemy name="parashut" delay="3"/>
			 <enemy name="parashut" delay="7"/>
			 <enemy name="parashut" delay="9"/>
			 <enemy name="parashut" delay="11"/>
			 <enemy name="parashut" delay="14"/>
			 <enemy name="parashut" delay="16"/>
		</wave>
	</group>
	<group pause="5">
		<wave pause="0" lifeTime="30" side="left" img="1">
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit1" delay="7"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit1" delay="17"/>
			<enemy name="unit2" delay="3"/>
			<enemy name="unit2" delay="9"/>
			<enemy name="unit2" delay="11"/>
			<enemy name="unit2" delay="16"/>
			<enemy name="car" delay="1"/>
			<enemy name="car" delay="5"/>
			<enemy name="tank1" delay="10"/>
			<enemy name="tank2" delay="15"/>
			<enemy name="car" delay="20"/>
			<enemy name="parashut" delay="7"/>
			<enemy name="parashut" delay="9"/>
			<enemy name="parashut" delay="11"/>
			<enemy name="parashut" delay="14"/>
			<enemy name="parashut" delay="16"/>
    	</wave>
		<wave pause="0" lifeTime="30" side="right" img="1">
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit1" delay="7"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit1" delay="17"/>
			<enemy name="unit2" delay="3"/>
			<enemy name="unit2" delay="9"/>
			<enemy name="unit2" delay="11"/>
			<enemy name="unit2" delay="16"/>
			<enemy name="car" delay="1"/>
			<enemy name="car" delay="5"/>
			<enemy name="tank1" delay="10"/>
			<enemy name="tank2" delay="15"/>
			<enemy name="car" delay="20"/>
			<enemy name="parashut" delay="7"/>
			<enemy name="parashut" delay="9"/>
			<enemy name="parashut" delay="11"/>
			<enemy name="parashut" delay="14"/>
			<enemy name="parashut" delay="16"/>
		</wave>
	</group>
	<group pause="0">
		<wave pause="0" lifeTime="40" side="left" img="1">
		   <enemy name="walker1" delay="5"/>
		   <enemy name="aerostat" delay="1"/>
		   <enemy name="aerostat" delay="5"/>
		   <enemy name="aerostat" delay="9"/>
		</wave>
		<wave pause="0" lifeTime="40" side="right" img="1">
		   <enemy name="walker1" delay="5"/>
		   <enemy name="aerostat" delay="1"/>
		   <enemy name="aerostat" delay="5"/>
		   <enemy name="aerostat" delay="9"/>
		</wave>
	</group>
</level>;
            var _loc_10:* = <level eye=""normal"" money=""41000"" maxTower=""5"" maxUpgrade=""2"" bg=""3"" upgradeTwo=""true"" threeStarHealth=""80"" twoStarHealth=""60"" preStartMoney=""2500"">
n	t<!-- 
n	t	tpreStartMoney - денег за досрочный вызов волны, может указываться у level и wave
n	t	tpause - пауза перед появлением, (секунды)
n	t	tlifeTime - время жизни волны, (секунды)
n	t	timg - картинка, иконка досрочного вызова волны
n	t	tside - сторона, откуда появится враг (left, right), - можно указывать целиком волне(wave) и также отдельным юнитам(enemy)
n	t-->
n	t
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""20"" side=""left"" img=""1"">
n	t	t  	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1-line-5"" delay=""6""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""20"" side=""right"" img=""1"">
n	t	t  	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1-line-5"" delay=""6""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""5"">
n	t	t<wave pause=""0"" lifeTime=""50"" side=""left"" img=""1"">
n	t	t	t<enemy name=""balloon"" delay=""1""/>
n	t	t	t<enemy name=""balloon"" delay=""5""/>
n	t	t	t<enemy name=""balloon"" delay=""10""/>
n	t	t	t<enemy name=""balloon"" delay=""15""/>
n	t	t	t<enemy name=""balloon"" delay=""20""/>
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit1"" delay=""17""/>
n	t	t	t<enemy name=""unit1"" delay=""19""/>
n	t	t	t<enemy name=""unit1"" delay=""20""/>
n	t	t	t<enemy name=""unit1"" delay=""21""/>
n	t	t	t<enemy name=""unit1"" delay=""22""/>
n	t	t	t<enemy name=""unit1"" delay=""23""/>
n	t	t	t<enemy name=""parashut"" delay=""5""/>
n	t	t	t<enemy name=""parashut"" delay=""9""/>
n	t	t	t<enemy name=""parashut"" delay=""12""/>
n	t	t	t<enemy name=""parashut"" delay=""15""/>
n	t	t	t<enemy name=""parashut"" delay=""20""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""50"" side=""right"" img=""1"">
n	t	t	t<enemy name=""balloon"" delay=""1""/>
n	t	t	t<enemy name=""balloon"" delay=""5""/>
n	t	t	t<enemy name=""balloon"" delay=""10""/>
n	t	t	t<enemy name=""balloon"" delay=""15""/>
n	t	t	t<enemy name=""balloon"" delay=""20""/>
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit1"" delay=""17""/>
n	t	t	t<enemy name=""unit1"" delay=""19""/>
n	t	t	t<enemy name=""unit1"" delay=""20""/>
n	t	t	t<enemy name=""unit1"" delay=""21""/>
n	t	t	t<enemy name=""unit1"" delay=""22""/>
n	t	t	t<enemy name=""unit1"" delay=""23""/>
n	t	t	t<enemy name=""parashut"" delay=""5""/>
n	t	t	t<enemy name=""parashut"" delay=""9""/>
n	t	t	t<enemy name=""parashut"" delay=""12""/>
n	t	t	t<enemy name=""parashut"" delay=""15""/>
n	t	t	t<enemy name=""parashut"" delay=""20""/>
n	t	t</wave>
n	t</group>
n    <group pause=""5"">
n	t	t<wave pause=""0"" lifeTime=""50"" side=""left"" img=""1"">
n	t	t  	t<enemy name=""unit2-line-3"" delay=""1""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""3""/>
n	t	t	t<enemy name=""unit2-line-4"" delay=""5""/>
n	t	t	t<enemy name=""unit2-line-4"" delay=""7""/>
n	t	t	t<enemy name=""unit2-line-4"" delay=""8""/>
n	t	t	t<enemy name=""unit2-line-4"" delay=""13""/>
n	t	t	t<enemy name=""unit2-line-5"" delay=""15""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""50"" side=""right"" img=""1"">
n	t	t  	t<enemy name=""unit2-line-3"" delay=""1""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""3""/>
n	t	t	t<enemy name=""unit2-line-4"" delay=""5""/>
n	t	t	t<enemy name=""unit2-line-4"" delay=""7""/>
n	t	t	t<enemy name=""unit2-line-4"" delay=""8""/>
n	t	t	t<enemy name=""unit2-line-4"" delay=""13""/>
n	t	t	t<enemy name=""unit2-line-5"" delay=""15""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""2"">
n	t	t<wave pause=""0"" lifeTime=""30"" side=""left"" img=""1"">
n	t	t  	t<enemy name=""tanket"" delay=""1""/>
n	t	t	t<enemy name=""tanket"" delay=""4""/>
n	t	t	t<enemy name=""tanket-line-2"" delay=""8""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""30"" side=""right"" img=""1"">
n	t	t	t<enemy name=""tanket"" delay=""1""/>
n	t	t	t<enemy name=""tanket"" delay=""4""/>
n	t	t	t<enemy name=""tanket-line-2"" delay=""8""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""20"" side=""left"" img=""1"">
n	t	t     <enemy name=""wheel"" delay=""5""/>
n	t	t	t <enemy name=""wheel"" delay=""8""/>
n	t	t     <enemy name=""wheel"" delay=""11""/>
n	t	t	t <enemy name=""wheel"" delay=""14""/>
n	t	t	t <enemy name=""wheel"" delay=""17""/>
n	t	t	t <enemy name=""wheel"" delay=""20""/>
n	t	t     <enemy name=""wheel"" delay=""23""/>
n	t	t     <enemy name=""wheel"" delay=""24""/>
n	t	t     <enemy name=""wheel"" delay=""25""/>
n	t	t	t <enemy name=""wheel"" delay=""26""/>
n	t	t	t <enemy name=""tanket"" delay=""3""/>
n	t	t	t <enemy name=""tanket"" delay=""7""/>
n	t	t	t <enemy name=""tanket"" delay=""11""/>
n	t	t	t <enemy name=""tanket"" delay=""15""/>
n	t	t	t <enemy name=""tanket"" delay=""21""/>
n	t	t	t <enemy name=""tank1"" delay=""25""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""20"" side=""right"" img=""1"">
n	t	t     <enemy name=""wheel"" delay=""5""/>
n	t	t	t <enemy name=""wheel"" delay=""8""/>
n	t	t     <enemy name=""wheel"" delay=""11""/>
n	t	t	t <enemy name=""wheel"" delay=""14""/>
n	t	t	t <enemy name=""wheel"" delay=""17""/>
n	t	t	t <enemy name=""wheel"" delay=""20""/>
n	t	t     <enemy name=""wheel"" delay=""23""/>
n	t	t     <enemy name=""wheel"" delay=""24""/>
n	t	t     <enemy name=""wheel"" delay=""25""/>
n	t	t	t <enemy name=""wheel"" delay=""26""/>
n	t	t	t <enemy name=""tanket"" delay=""3""/>
n	t	t	t <enemy name=""tanket"" delay=""7""/>
n	t	t	t <enemy name=""tanket"" delay=""11""/>
n	t	t	t <enemy name=""tanket"" delay=""15""/>
n	t	t	t <enemy name=""tanket"" delay=""21""/>
n	t	t	t <enemy name=""tank1"" delay=""25""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""5"">
n	t	t<wave pause=""0"" lifeTime=""50"" side=""left"" img=""1"">
n	t	t     <enemy name=""unit2-line-3"" delay=""5""/>
n	t	t	t <enemy name=""unit2"" delay=""8""/>
n	t	t     <enemy name=""unit2"" delay=""11""/>
n	t	t	t <enemy name=""unit2"" delay=""14""/>
n	t	t	t <enemy name=""unit2"" delay=""17""/>
n	t	t	t <enemy name=""unit2"" delay=""20""/>
n	t	t     <enemy name=""unit2"" delay=""23""/>
n	t	t	t <enemy name=""unit2"" delay=""26""/>
n	t	t	t <enemy name=""car"" delay=""3""/>
n	t	t	t <enemy name=""car"" delay=""7""/>
n	t	t	t <enemy name=""car"" delay=""11""/>
n	t	t	t <enemy name=""car"" delay=""15""/>
n	t	t	t <enemy name=""car"" delay=""21""/>
n	t	t	t <enemy name=""tank2"" delay=""25""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""50"" side=""right"" img=""1"">
n	t	t     <enemy name=""unit2-line-3"" delay=""5""/>
n	t	t	t <enemy name=""unit2"" delay=""8""/>
n	t	t     <enemy name=""unit2"" delay=""11""/>
n	t	t	t <enemy name=""unit2"" delay=""14""/>
n	t	t	t <enemy name=""unit2"" delay=""17""/>
n	t	t	t <enemy name=""unit2"" delay=""20""/>
n	t	t     <enemy name=""unit2"" delay=""23""/>
n	t	t	t <enemy name=""unit2"" delay=""26""/>
n	t	t	t <enemy name=""car"" delay=""3""/>
n	t	t	t <enemy name=""car"" delay=""7""/>
n	t	t	t <enemy name=""car"" delay=""11""/>
n	t	t	t <enemy name=""car"" delay=""15""/>
n	t	t	t <enemy name=""car"" delay=""21""/>
n	t	t	t <enemy name=""tank2"" delay=""25""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""20"" side=""left"" img=""1"">
n	t	t    <enemy name=""car"" delay=""3""/>
n	t	t	t<enemy name=""airplane"" delay=""5""/>
n	t	t	t<enemy name=""airplane"" delay=""7""/>
n	t	t	t<enemy name=""airplane"" delay=""9""/>
n	t	t	t<enemy name=""airplane"" delay=""11""/>
n	t	t	t<enemy name=""airplane"" delay=""13""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""20"" side=""right"" img=""1"">
n	t	t    <enemy name=""car"" delay=""3""/>
n	t	t    <enemy name=""airplane"" delay=""5""/>
n	t	t	t<enemy name=""airplane"" delay=""7""/>
n	t	t	t<enemy name=""airplane"" delay=""9""/>
n	t	t	t<enemy name=""airplane"" delay=""11""/>
n	t	t	t<enemy name=""airplane"" delay=""13""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""30"" side=""left"" img=""1"">
n	t	t	t<enemy name=""airplane"" delay=""5""/>
n	t	t	t<enemy name=""airplane"" delay=""8""/>
n	t	t	t<enemy name=""airplane"" delay=""11""/>
n	t	t	t<enemy name=""balloon"" delay=""1""/>
n	t	t	t<enemy name=""balloon"" delay=""5""/>
n	t	t	t<enemy name=""balloon"" delay=""10""/>
n	t	t	t<enemy name=""unit2"" delay=""1""/>
n	t	t	t<enemy name=""unit2"" delay=""1""/>
n	t	t	t<enemy name=""unit2"" delay=""2""/>
n	t	t	t<enemy name=""unit2"" delay=""2""/>
n	t	t	t<enemy name=""unit2"" delay=""3""/>
n	t	t	t<enemy name=""unit2"" delay=""3""/>
n	t	t	t<enemy name=""unit2"" delay=""4""/>
n	t	t	t<enemy name=""unit2"" delay=""4""/>
n	t	t	t<enemy name=""unit2"" delay=""5""/>
n	t	t	t<enemy name=""unit2"" delay=""5""/>
n	t	t	t<enemy name=""unit2"" delay=""6""/>
n	t	t	t<enemy name=""unit2"" delay=""6""/>
n	t	t	t<enemy name=""unit2"" delay=""7""/>
n	t	t	t<enemy name=""unit2"" delay=""7""/>
n	t	t	t<enemy name=""unit2"" delay=""8""/>
n	t	t	t<enemy name=""unit2"" delay=""8""/>
n	t	t	t<enemy name=""unit2"" delay=""9""/>
n	t	t	t<enemy name=""unit2"" delay=""9""/>
n	t	t	t<enemy name=""unit2"" delay=""10""/>
n	t	t	t<enemy name=""unit2"" delay=""10""/>
n	t	t	t<enemy name=""unit2"" delay=""11""/>
n	t	t	t<enemy name=""unit2"" delay=""11""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""30"" side=""right"" img=""1"">
n	t	t    <enemy name=""airplane"" delay=""5""/>
n	t	t	t<enemy name=""airplane"" delay=""8""/>
n	t	t	t<enemy name=""airplane"" delay=""11""/>
n	t	t	t<enemy name=""balloon"" delay=""1""/>
n	t	t	t<enemy name=""balloon"" delay=""5""/>
n	t	t	t<enemy name=""balloon"" delay=""10""/>
n	t	t	t<enemy name=""unit2"" delay=""1""/>
n	t	t	t<enemy name=""unit2"" delay=""1""/>
n	t	t	t<enemy name=""unit2"" delay=""2""/>
n	t	t	t<enemy name=""unit2"" delay=""2""/>
n	t	t	t<enemy name=""unit2"" delay=""3""/>
n	t	t	t<enemy name=""unit2"" delay=""3""/>
n	t	t	t<enemy name=""unit2"" delay=""4""/>
n	t	t	t<enemy name=""unit2"" delay=""4""/>
n	t	t	t<enemy name=""unit2"" delay=""5""/>
n	t	t	t<enemy name=""unit2"" delay=""5""/>
n	t	t	t<enemy name=""unit2"" delay=""6""/>
n	t	t	t<enemy name=""unit2"" delay=""6""/>
n	t	t	t<enemy name=""unit2"" delay=""7""/>
n	t	t	t<enemy name=""unit2"" delay=""7""/>
n	t	t	t<enemy name=""unit2"" delay=""8""/>
n	t	t	t<enemy name=""unit2"" delay=""8""/>
n	t	t	t<enemy name=""unit2"" delay=""9""/>
n	t	t	t<enemy name=""unit2"" delay=""9""/>
n	t	t	t<enemy name=""unit2"" delay=""10""/>
n	t	t	t<enemy name=""unit2"" delay=""10""/>
n	t	t	t<enemy name=""unit2"" delay=""11""/>
n	t	t	t<enemy name=""unit2"" delay=""11""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""5"">
n	t	t<wave pause=""0"" lifeTime=""40"" side=""left"" img=""1"">
n	t	t   <enemy name=""walker1"" delay=""1""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""40"" side=""right"" img=""1"">
n	t	t   <enemy name=""walker1"" delay=""1""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""2"">
n	t	t<wave pause=""0"" lifeTime=""40"" side=""left"" img=""1"">
n	t	t   <enemy name=""tank1"" delay=""1""/>
n	t	t   <enemy name=""tank2"" delay=""6""/>
n	t	t   <enemy name=""tank1"" delay=""10""/>
n	t	t   <enemy name=""unit2"" delay=""12""/>
n	t	t   <enemy name=""unit2"" delay=""12""/>
n	t	t   <enemy name=""unit2"" delay=""12""/>
n	t	t   <enemy name=""unit2"" delay=""15""/>
n	t	t   <enemy name=""unit2"" delay=""15""/>
n	t	t   <enemy name=""unit2"" delay=""15""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""40"" side=""right"" img=""1"">
n	t	t   <enemy name=""tank1"" delay=""1""/>
n	t	t   <enemy name=""tank2"" delay=""6""/>
n	t	t   <enemy name=""tank1"" delay=""10""/>
n	t	t   <enemy name=""unit2"" delay=""12""/>
n	t	t   <enemy name=""unit2"" delay=""12""/>
n	t	t   <enemy name=""unit2"" delay=""12""/>
n	t	t   <enemy name=""unit2"" delay=""15""/>
n	t	t   <enemy name=""unit2"" delay=""15""/>
n	t	t   <enemy name=""unit2"" delay=""15""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""2"">
n	t	t<wave pause=""0"" lifeTime=""40"" side=""left"" img=""1"">
n	t	t   <enemy name=""walker1"" delay=""1""/>
n	t	t    <enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit1"" delay=""17""/>
n	t	t	t<enemy name=""unit1"" delay=""19""/>
n	t	t	t<enemy name=""unit1"" delay=""20""/>
n	t	t	t<enemy name=""unit1"" delay=""21""/>
n	t	t	t<enemy name=""unit1"" delay=""22""/>
n	t	t	t<enemy name=""unit1"" delay=""23""/>
n	t	t	t<enemy name=""airplane"" delay=""5""/>
n	t	t	t<enemy name=""airplane"" delay=""8""/>
n	t	t	t<enemy name=""airplane"" delay=""11""/>
n	t	t	t
n	t	t	t<enemy name=""wheel"" delay=""11""/>
n	t	t	t<enemy name=""wheel"" delay=""12""/>
n	t	t	t<enemy name=""wheel"" delay=""13""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""40"" side=""right"" img=""1"">
n	t	t    <enemy name=""walker1"" delay=""1""/>
n	t	t    <enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit1"" delay=""17""/>
n	t	t	t<enemy name=""unit1"" delay=""19""/>
n	t	t	t<enemy name=""unit1"" delay=""20""/>
n	t	t	t<enemy name=""unit1"" delay=""21""/>
n	t	t	t<enemy name=""unit1"" delay=""22""/>
n	t	t	t<enemy name=""unit1"" delay=""23""/>
n	t	t	t<enemy name=""airplane"" delay=""5""/>
n	t	t	t<enemy name=""airplane"" delay=""8""/>
n	t	t	t<enemy name=""airplane"" delay=""11""/>
n	t	t	t
n	t	t	t<enemy name=""wheel"" delay=""11""/>
n	t	t	t<enemy name=""wheel"" delay=""12""/>
n	t	t	t<enemy name=""wheel"" delay=""13""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""2"">
n	t	t<wave pause=""0"" lifeTime=""40"" side=""left"" img=""1"">
n	t	t    <enemy name=""walker1"" delay=""1""/>
n	t	t    <enemy name=""walker1"" delay=""10""/>
n	t	t    <enemy name=""walker1"" delay=""20""/>
n	t	t    <enemy name=""airplane"" delay=""11""/>
n	t	t	t<enemy name=""airplane"" delay=""20""/>
n	t	t    <enemy name=""unit1-line-5"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit1"" delay=""17""/>
n	t	t	t<enemy name=""unit1"" delay=""19""/>
n	t	t	t<enemy name=""unit1"" delay=""20""/>
n	t	t	t<enemy name=""unit1"" delay=""21""/>
n	t	t	t<enemy name=""unit1"" delay=""22""/>
n	t	t	t<enemy name=""unit2"" delay=""20""/>
n	t	t	t<enemy name=""unit2"" delay=""21""/>
n	t	t	t<enemy name=""unit2"" delay=""22""/>
n	t	t	t<enemy name=""unit2"" delay=""23""/>
n	t	t	t<enemy name=""parashut"" delay=""5""/>
n	t	t	t<enemy name=""parashut"" delay=""15""/>
n	t	t	t<enemy name=""parashut"" delay=""20""/>
n	t	t	t<enemy name=""parashut"" delay=""1""/>
n	t	t	t<enemy name=""parashut"" delay=""23""/>
n	t	t	t<enemy name=""parashut"" delay=""10""/>
n	t	t	t<enemy name=""parashut"" delay=""11""/>
n	t	t	t<enemy name=""parashut"" delay=""12""/>
n	t	t	t<enemy name=""parashut"" delay=""13""/>
n	t	t	t<enemy name=""parashut"" delay=""14""/>
n	t	t	t<enemy name=""parashut"" delay=""15""/>
n	t	t	t<enemy name=""parashut"" delay=""16""/>
n	t	t	t<enemy name=""parashut"" delay=""17""/>
n	t	t	t<enemy name=""parashut"" delay=""18""/>
n	t	t	t<enemy name=""parashut"" delay=""19""/>
n	t	t	t<enemy name=""balloon"" delay=""1""/>
n	t	t	t<enemy name=""balloon"" delay=""5""/>
n	t	t	t<enemy name=""balloon"" delay=""10""/>
n	t	t	t<enemy name=""balloon"" delay=""15""/>
n	t	t	t<enemy name=""balloon"" delay=""20""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""40"" side=""right"" img=""1"">
n	t	t    <enemy name=""walker1"" delay=""1""/>
n	t	t    <enemy name=""walker1"" delay=""10""/>
n	t	t    <enemy name=""walker1"" delay=""20""/>
n	t	t    <enemy name=""airplane"" delay=""11""/>
n	t	t	t<enemy name=""airplane"" delay=""20""/>
n	t	t    <enemy name=""unit1-line-5"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit1"" delay=""17""/>
n	t	t	t<enemy name=""unit1"" delay=""19""/>
n	t	t	t<enemy name=""unit1"" delay=""20""/>
n	t	t	t<enemy name=""unit1"" delay=""21""/>
n	t	t	t<enemy name=""unit1"" delay=""22""/>
n	t	t	t<enemy name=""unit2"" delay=""20""/>
n	t	t	t<enemy name=""unit2"" delay=""21""/>
n	t	t	t<enemy name=""unit2"" delay=""22""/>
n	t	t	t<enemy name=""unit2"" delay=""23""/>
n	t	t	t<enemy name=""parashut"" delay=""5""/>
n	t	t	t<enemy name=""parashut"" delay=""15""/>
n	t	t	t<enemy name=""parashut"" delay=""20""/>
n	t	t	t<enemy name=""parashut"" delay=""1""/>
n	t	t	t<enemy name=""parashut"" delay=""23""/>
n	t	t	t<enemy name=""parashut"" delay=""10""/>
n	t	t	t<enemy name=""parashut"" delay=""11""/>
n	t	t	t<enemy name=""parashut"" delay=""12""/>
n	t	t	t<enemy name=""parashut"" delay=""13""/>
n	t	t	t<enemy name=""parashut"" delay=""14""/>
n	t	t	t<enemy name=""parashut"" delay=""15""/>
n	t	t	t<enemy name=""parashut"" delay=""16""/>
n	t	t	t<enemy name=""parashut"" delay=""17""/>
n	t	t	t<enemy name=""parashut"" delay=""18""/>
n	t	t	t<enemy name=""parashut"" delay=""19""/>
n	t	t	t<enemy name=""balloon"" delay=""1""/>
n	t	t	t<enemy name=""balloon"" delay=""5""/>
n	t	t	t<enemy name=""balloon"" delay=""10""/>
n	t	t	t<enemy name=""balloon"" delay=""15""/>
n	t	t	t<enemy name=""balloon"" delay=""20""/>
n	t	t</wave>
n	t</group>
n	t
n</level>")("<level eye="normal" money="41000" maxTower="5" maxUpgrade="2" bg="3" upgradeTwo="true" threeStarHealth="80" twoStarHealth="60" preStartMoney="2500">
	<!-- 
		preStartMoney - денег за досрочный вызов волны, может указываться у level и wave
		pause - пауза перед появлением, (секунды)
		lifeTime - время жизни волны, (секунды)
		img - картинка, иконка досрочного вызова волны
		side - сторона, откуда появится враг (left, right), - можно указывать целиком волне(wave) и также отдельным юнитам(enemy)
	-->
	
	<group pause="0">
		<wave pause="0" lifeTime="20" side="left" img="1">
		  	<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit1-line-5" delay="6"/>
		</wave>
	</group>
	<group pause="0">
		<wave pause="0" lifeTime="20" side="right" img="1">
		  	<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit1-line-5" delay="6"/>
		</wave>
	</group>
	<group pause="5">
		<wave pause="0" lifeTime="50" side="left" img="1">
			<enemy name="balloon" delay="1"/>
			<enemy name="balloon" delay="5"/>
			<enemy name="balloon" delay="10"/>
			<enemy name="balloon" delay="15"/>
			<enemy name="balloon" delay="20"/>
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit1" delay="7"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit1" delay="17"/>
			<enemy name="unit1" delay="19"/>
			<enemy name="unit1" delay="20"/>
			<enemy name="unit1" delay="21"/>
			<enemy name="unit1" delay="22"/>
			<enemy name="unit1" delay="23"/>
			<enemy name="parashut" delay="5"/>
			<enemy name="parashut" delay="9"/>
			<enemy name="parashut" delay="12"/>
			<enemy name="parashut" delay="15"/>
			<enemy name="parashut" delay="20"/>
		</wave>
		<wave pause="0" lifeTime="50" side="right" img="1">
			<enemy name="balloon" delay="1"/>
			<enemy name="balloon" delay="5"/>
			<enemy name="balloon" delay="10"/>
			<enemy name="balloon" delay="15"/>
			<enemy name="balloon" delay="20"/>
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit1" delay="7"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit1" delay="17"/>
			<enemy name="unit1" delay="19"/>
			<enemy name="unit1" delay="20"/>
			<enemy name="unit1" delay="21"/>
			<enemy name="unit1" delay="22"/>
			<enemy name="unit1" delay="23"/>
			<enemy name="parashut" delay="5"/>
			<enemy name="parashut" delay="9"/>
			<enemy name="parashut" delay="12"/>
			<enemy name="parashut" delay="15"/>
			<enemy name="parashut" delay="20"/>
		</wave>
	</group>
    <group pause="5">
		<wave pause="0" lifeTime="50" side="left" img="1">
		  	<enemy name="unit2-line-3" delay="1"/>
			<enemy name="unit2-line-3" delay="3"/>
			<enemy name="unit2-line-4" delay="5"/>
			<enemy name="unit2-line-4" delay="7"/>
			<enemy name="unit2-line-4" delay="8"/>
			<enemy name="unit2-line-4" delay="13"/>
			<enemy name="unit2-line-5" delay="15"/>
		</wave>
		<wave pause="0" lifeTime="50" side="right" img="1">
		  	<enemy name="unit2-line-3" delay="1"/>
			<enemy name="unit2-line-3" delay="3"/>
			<enemy name="unit2-line-4" delay="5"/>
			<enemy name="unit2-line-4" delay="7"/>
			<enemy name="unit2-line-4" delay="8"/>
			<enemy name="unit2-line-4" delay="13"/>
			<enemy name="unit2-line-5" delay="15"/>
		</wave>
	</group>
	<group pause="2">
		<wave pause="0" lifeTime="30" side="left" img="1">
		  	<enemy name="tanket" delay="1"/>
			<enemy name="tanket" delay="4"/>
			<enemy name="tanket-line-2" delay="8"/>
		</wave>
		<wave pause="0" lifeTime="30" side="right" img="1">
			<enemy name="tanket" delay="1"/>
			<enemy name="tanket" delay="4"/>
			<enemy name="tanket-line-2" delay="8"/>
		</wave>
	</group>
	<group pause="0">
		<wave pause="0" lifeTime="20" side="left" img="1">
		     <enemy name="wheel" delay="5"/>
			 <enemy name="wheel" delay="8"/>
		     <enemy name="wheel" delay="11"/>
			 <enemy name="wheel" delay="14"/>
			 <enemy name="wheel" delay="17"/>
			 <enemy name="wheel" delay="20"/>
		     <enemy name="wheel" delay="23"/>
		     <enemy name="wheel" delay="24"/>
		     <enemy name="wheel" delay="25"/>
			 <enemy name="wheel" delay="26"/>
			 <enemy name="tanket" delay="3"/>
			 <enemy name="tanket" delay="7"/>
			 <enemy name="tanket" delay="11"/>
			 <enemy name="tanket" delay="15"/>
			 <enemy name="tanket" delay="21"/>
			 <enemy name="tank1" delay="25"/>
		</wave>
		<wave pause="0" lifeTime="20" side="right" img="1">
		     <enemy name="wheel" delay="5"/>
			 <enemy name="wheel" delay="8"/>
		     <enemy name="wheel" delay="11"/>
			 <enemy name="wheel" delay="14"/>
			 <enemy name="wheel" delay="17"/>
			 <enemy name="wheel" delay="20"/>
		     <enemy name="wheel" delay="23"/>
		     <enemy name="wheel" delay="24"/>
		     <enemy name="wheel" delay="25"/>
			 <enemy name="wheel" delay="26"/>
			 <enemy name="tanket" delay="3"/>
			 <enemy name="tanket" delay="7"/>
			 <enemy name="tanket" delay="11"/>
			 <enemy name="tanket" delay="15"/>
			 <enemy name="tanket" delay="21"/>
			 <enemy name="tank1" delay="25"/>
		</wave>
	</group>
	<group pause="5">
		<wave pause="0" lifeTime="50" side="left" img="1">
		     <enemy name="unit2-line-3" delay="5"/>
			 <enemy name="unit2" delay="8"/>
		     <enemy name="unit2" delay="11"/>
			 <enemy name="unit2" delay="14"/>
			 <enemy name="unit2" delay="17"/>
			 <enemy name="unit2" delay="20"/>
		     <enemy name="unit2" delay="23"/>
			 <enemy name="unit2" delay="26"/>
			 <enemy name="car" delay="3"/>
			 <enemy name="car" delay="7"/>
			 <enemy name="car" delay="11"/>
			 <enemy name="car" delay="15"/>
			 <enemy name="car" delay="21"/>
			 <enemy name="tank2" delay="25"/>
		</wave>
		<wave pause="0" lifeTime="50" side="right" img="1">
		     <enemy name="unit2-line-3" delay="5"/>
			 <enemy name="unit2" delay="8"/>
		     <enemy name="unit2" delay="11"/>
			 <enemy name="unit2" delay="14"/>
			 <enemy name="unit2" delay="17"/>
			 <enemy name="unit2" delay="20"/>
		     <enemy name="unit2" delay="23"/>
			 <enemy name="unit2" delay="26"/>
			 <enemy name="car" delay="3"/>
			 <enemy name="car" delay="7"/>
			 <enemy name="car" delay="11"/>
			 <enemy name="car" delay="15"/>
			 <enemy name="car" delay="21"/>
			 <enemy name="tank2" delay="25"/>
		</wave>
	</group>
	<group pause="0">
		<wave pause="0" lifeTime="20" side="left" img="1">
		    <enemy name="car" delay="3"/>
			<enemy name="airplane" delay="5"/>
			<enemy name="airplane" delay="7"/>
			<enemy name="airplane" delay="9"/>
			<enemy name="airplane" delay="11"/>
			<enemy name="airplane" delay="13"/>
		</wave>
		<wave pause="0" lifeTime="20" side="right" img="1">
		    <enemy name="car" delay="3"/>
		    <enemy name="airplane" delay="5"/>
			<enemy name="airplane" delay="7"/>
			<enemy name="airplane" delay="9"/>
			<enemy name="airplane" delay="11"/>
			<enemy name="airplane" delay="13"/>
		</wave>
	</group>
	<group pause="0">
		<wave pause="0" lifeTime="30" side="left" img="1">
			<enemy name="airplane" delay="5"/>
			<enemy name="airplane" delay="8"/>
			<enemy name="airplane" delay="11"/>
			<enemy name="balloon" delay="1"/>
			<enemy name="balloon" delay="5"/>
			<enemy name="balloon" delay="10"/>
			<enemy name="unit2" delay="1"/>
			<enemy name="unit2" delay="1"/>
			<enemy name="unit2" delay="2"/>
			<enemy name="unit2" delay="2"/>
			<enemy name="unit2" delay="3"/>
			<enemy name="unit2" delay="3"/>
			<enemy name="unit2" delay="4"/>
			<enemy name="unit2" delay="4"/>
			<enemy name="unit2" delay="5"/>
			<enemy name="unit2" delay="5"/>
			<enemy name="unit2" delay="6"/>
			<enemy name="unit2" delay="6"/>
			<enemy name="unit2" delay="7"/>
			<enemy name="unit2" delay="7"/>
			<enemy name="unit2" delay="8"/>
			<enemy name="unit2" delay="8"/>
			<enemy name="unit2" delay="9"/>
			<enemy name="unit2" delay="9"/>
			<enemy name="unit2" delay="10"/>
			<enemy name="unit2" delay="10"/>
			<enemy name="unit2" delay="11"/>
			<enemy name="unit2" delay="11"/>
		</wave>
		<wave pause="0" lifeTime="30" side="right" img="1">
		    <enemy name="airplane" delay="5"/>
			<enemy name="airplane" delay="8"/>
			<enemy name="airplane" delay="11"/>
			<enemy name="balloon" delay="1"/>
			<enemy name="balloon" delay="5"/>
			<enemy name="balloon" delay="10"/>
			<enemy name="unit2" delay="1"/>
			<enemy name="unit2" delay="1"/>
			<enemy name="unit2" delay="2"/>
			<enemy name="unit2" delay="2"/>
			<enemy name="unit2" delay="3"/>
			<enemy name="unit2" delay="3"/>
			<enemy name="unit2" delay="4"/>
			<enemy name="unit2" delay="4"/>
			<enemy name="unit2" delay="5"/>
			<enemy name="unit2" delay="5"/>
			<enemy name="unit2" delay="6"/>
			<enemy name="unit2" delay="6"/>
			<enemy name="unit2" delay="7"/>
			<enemy name="unit2" delay="7"/>
			<enemy name="unit2" delay="8"/>
			<enemy name="unit2" delay="8"/>
			<enemy name="unit2" delay="9"/>
			<enemy name="unit2" delay="9"/>
			<enemy name="unit2" delay="10"/>
			<enemy name="unit2" delay="10"/>
			<enemy name="unit2" delay="11"/>
			<enemy name="unit2" delay="11"/>
		</wave>
	</group>
	<group pause="5">
		<wave pause="0" lifeTime="40" side="left" img="1">
		   <enemy name="walker1" delay="1"/>
		</wave>
		<wave pause="0" lifeTime="40" side="right" img="1">
		   <enemy name="walker1" delay="1"/>
		</wave>
	</group>
	<group pause="2">
		<wave pause="0" lifeTime="40" side="left" img="1">
		   <enemy name="tank1" delay="1"/>
		   <enemy name="tank2" delay="6"/>
		   <enemy name="tank1" delay="10"/>
		   <enemy name="unit2" delay="12"/>
		   <enemy name="unit2" delay="12"/>
		   <enemy name="unit2" delay="12"/>
		   <enemy name="unit2" delay="15"/>
		   <enemy name="unit2" delay="15"/>
		   <enemy name="unit2" delay="15"/>
		</wave>
		<wave pause="0" lifeTime="40" side="right" img="1">
		   <enemy name="tank1" delay="1"/>
		   <enemy name="tank2" delay="6"/>
		   <enemy name="tank1" delay="10"/>
		   <enemy name="unit2" delay="12"/>
		   <enemy name="unit2" delay="12"/>
		   <enemy name="unit2" delay="12"/>
		   <enemy name="unit2" delay="15"/>
		   <enemy name="unit2" delay="15"/>
		   <enemy name="unit2" delay="15"/>
		</wave>
	</group>
	<group pause="2">
		<wave pause="0" lifeTime="40" side="left" img="1">
		   <enemy name="walker1" delay="1"/>
		    <enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit1" delay="17"/>
			<enemy name="unit1" delay="19"/>
			<enemy name="unit1" delay="20"/>
			<enemy name="unit1" delay="21"/>
			<enemy name="unit1" delay="22"/>
			<enemy name="unit1" delay="23"/>
			<enemy name="airplane" delay="5"/>
			<enemy name="airplane" delay="8"/>
			<enemy name="airplane" delay="11"/>
			
			<enemy name="wheel" delay="11"/>
			<enemy name="wheel" delay="12"/>
			<enemy name="wheel" delay="13"/>
		</wave>
		<wave pause="0" lifeTime="40" side="right" img="1">
		    <enemy name="walker1" delay="1"/>
		    <enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit1" delay="17"/>
			<enemy name="unit1" delay="19"/>
			<enemy name="unit1" delay="20"/>
			<enemy name="unit1" delay="21"/>
			<enemy name="unit1" delay="22"/>
			<enemy name="unit1" delay="23"/>
			<enemy name="airplane" delay="5"/>
			<enemy name="airplane" delay="8"/>
			<enemy name="airplane" delay="11"/>
			
			<enemy name="wheel" delay="11"/>
			<enemy name="wheel" delay="12"/>
			<enemy name="wheel" delay="13"/>
		</wave>
	</group>
	<group pause="2">
		<wave pause="0" lifeTime="40" side="left" img="1">
		    <enemy name="walker1" delay="1"/>
		    <enemy name="walker1" delay="10"/>
		    <enemy name="walker1" delay="20"/>
		    <enemy name="airplane" delay="11"/>
			<enemy name="airplane" delay="20"/>
		    <enemy name="unit1-line-5" delay="5"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit1" delay="17"/>
			<enemy name="unit1" delay="19"/>
			<enemy name="unit1" delay="20"/>
			<enemy name="unit1" delay="21"/>
			<enemy name="unit1" delay="22"/>
			<enemy name="unit2" delay="20"/>
			<enemy name="unit2" delay="21"/>
			<enemy name="unit2" delay="22"/>
			<enemy name="unit2" delay="23"/>
			<enemy name="parashut" delay="5"/>
			<enemy name="parashut" delay="15"/>
			<enemy name="parashut" delay="20"/>
			<enemy name="parashut" delay="1"/>
			<enemy name="parashut" delay="23"/>
			<enemy name="parashut" delay="10"/>
			<enemy name="parashut" delay="11"/>
			<enemy name="parashut" delay="12"/>
			<enemy name="parashut" delay="13"/>
			<enemy name="parashut" delay="14"/>
			<enemy name="parashut" delay="15"/>
			<enemy name="parashut" delay="16"/>
			<enemy name="parashut" delay="17"/>
			<enemy name="parashut" delay="18"/>
			<enemy name="parashut" delay="19"/>
			<enemy name="balloon" delay="1"/>
			<enemy name="balloon" delay="5"/>
			<enemy name="balloon" delay="10"/>
			<enemy name="balloon" delay="15"/>
			<enemy name="balloon" delay="20"/>
		</wave>
		<wave pause="0" lifeTime="40" side="right" img="1">
		    <enemy name="walker1" delay="1"/>
		    <enemy name="walker1" delay="10"/>
		    <enemy name="walker1" delay="20"/>
		    <enemy name="airplane" delay="11"/>
			<enemy name="airplane" delay="20"/>
		    <enemy name="unit1-line-5" delay="5"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit1" delay="17"/>
			<enemy name="unit1" delay="19"/>
			<enemy name="unit1" delay="20"/>
			<enemy name="unit1" delay="21"/>
			<enemy name="unit1" delay="22"/>
			<enemy name="unit2" delay="20"/>
			<enemy name="unit2" delay="21"/>
			<enemy name="unit2" delay="22"/>
			<enemy name="unit2" delay="23"/>
			<enemy name="parashut" delay="5"/>
			<enemy name="parashut" delay="15"/>
			<enemy name="parashut" delay="20"/>
			<enemy name="parashut" delay="1"/>
			<enemy name="parashut" delay="23"/>
			<enemy name="parashut" delay="10"/>
			<enemy name="parashut" delay="11"/>
			<enemy name="parashut" delay="12"/>
			<enemy name="parashut" delay="13"/>
			<enemy name="parashut" delay="14"/>
			<enemy name="parashut" delay="15"/>
			<enemy name="parashut" delay="16"/>
			<enemy name="parashut" delay="17"/>
			<enemy name="parashut" delay="18"/>
			<enemy name="parashut" delay="19"/>
			<enemy name="balloon" delay="1"/>
			<enemy name="balloon" delay="5"/>
			<enemy name="balloon" delay="10"/>
			<enemy name="balloon" delay="15"/>
			<enemy name="balloon" delay="20"/>
		</wave>
	</group>
	
</level>;
            var _loc_11:* = <level eye=""normal"" money=""44000"" maxTower=""5"" maxUpgrade=""5"" bg=""4"" upgradeTwo=""false"" threeStarHealth=""80"" twoStarHealth=""60"" preStartMoney=""3000"">
n	t<!-- 
n	t	tpreStartMoney - денег за досрочный вызов волны, может указываться у level и wave
n	t	tpause - пауза перед появлением, (секунды)
n	t	tlifeTime - время жизни волны, (секунды)
n	t	timg - картинка, иконка досрочного вызова волны
n	t	tside - сторона, откуда появится враг (left, right), - можно указывать целиком волне(wave) и также отдельным юнитам(enemy)
n	t-->
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""30"" side=""left"" img=""1"">
n	t	t  	t<enemy name=""unit2"" delay=""0""/>
n	t	t	t<enemy name=""unit2"" delay=""4""/>
n	t	t	t<enemy name=""unit2"" delay=""8""/>
n	t	t	t<enemy name=""unit2"" delay=""16""/>
n	t	t	t<enemy name=""unit2"" delay=""20""/>
n	t	t	t<enemy name=""unit2"" delay=""24""/>
n	t	t	t<enemy name=""unit2"" delay=""28""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""30"" side=""right"" img=""1"">
n	t	t  	t<enemy name=""unit2"" delay=""0""/>
n	t	t	t<enemy name=""unit2"" delay=""4""/>
n	t	t	t<enemy name=""unit2"" delay=""8""/>
n	t	t	t<enemy name=""unit2"" delay=""16""/>
n	t	t	t<enemy name=""unit2"" delay=""20""/>
n	t	t	t<enemy name=""unit2"" delay=""24""/>
n	t	t	t<enemy name=""unit2"" delay=""28""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""40"" side=""left"" img=""1"">
n	t	t  	t<enemy name=""aerostat"" delay=""0""/>
n	t	t	t<enemy name=""aerostat"" delay=""4""/>
n	t	t	t<enemy name=""aerostat"" delay=""8""/>
n	t	t	t<enemy name=""aerostat"" delay=""16""/>
n	t	t	t<enemy name=""aerostat"" delay=""20""/>
n	t	t	t<enemy name=""aerostat"" delay=""24""/>
n	t	t	t<enemy name=""aerostat"" delay=""28""/>
n	t	t	t<enemy name=""unit2"" delay=""0""/>
n	t	t	t<enemy name=""unit2"" delay=""4""/>
n	t	t	t<enemy name=""unit2"" delay=""8""/>
n	t	t	t<enemy name=""unit2"" delay=""16""/>
n	t	t	t<enemy name=""unit2"" delay=""20""/>
n	t	t	t<enemy name=""unit2"" delay=""24""/>
n	t	t	t<enemy name=""unit2"" delay=""28""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""40"" side=""right"" img=""1"">
n	t	t  	t<enemy name=""aerostat"" delay=""0""/>
n	t	t	t<enemy name=""aerostat"" delay=""4""/>
n	t	t	t<enemy name=""aerostat"" delay=""8""/>
n	t	t	t<enemy name=""aerostat"" delay=""16""/>
n	t	t	t<enemy name=""aerostat"" delay=""20""/>
n	t	t	t<enemy name=""aerostat"" delay=""24""/>
n	t	t	t<enemy name=""aerostat"" delay=""28""/>
n	t	t	t<enemy name=""unit2"" delay=""0""/>
n	t	t	t<enemy name=""unit2"" delay=""4""/>
n	t	t	t<enemy name=""unit2"" delay=""8""/>
n	t	t	t<enemy name=""unit2"" delay=""16""/>
n	t	t	t<enemy name=""unit2"" delay=""20""/>
n	t	t	t<enemy name=""unit2"" delay=""24""/>
n	t	t	t<enemy name=""unit2"" delay=""28""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""2"">
n	t	t<wave pause=""0"" lifeTime=""30"" side=""left"" img=""1"">
n	t	t	t<enemy name=""airplane"" delay=""5""/>
n	t	t	t<enemy name=""airplane"" delay=""11""/>
n	t	t  	t<enemy name=""tanket"" delay=""1""/>
n	t	t	t<enemy name=""tanket"" delay=""4""/>
n	t	t	t<enemy name=""tanket"" delay=""8""/>
n	t	t	t<enemy name=""tanket"" delay=""12""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""30"" side=""right"" img=""1"">
n	t	t    <enemy name=""airplane"" delay=""5""/>
n	t	t	t<enemy name=""airplane"" delay=""11""/>
n	t	t	t<enemy name=""tanket"" delay=""1""/>
n	t	t	t<enemy name=""tanket"" delay=""4""/>
n	t	t	t<enemy name=""tanket"" delay=""8""/>
n	t	t	t<enemy name=""tanket"" delay=""12""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""2"">
n	t	t<wave pause=""0"" lifeTime=""30"" side=""left"" img=""1"">
n	t	t	t<enemy name=""parashut"" delay=""3""/>
n	t	t	t<enemy name=""parashut"" delay=""7""/>
n	t	t	t<enemy name=""parashut"" delay=""11""/>
n	t	t  	t<enemy name=""car"" delay=""1""/>
n	t	t	t<enemy name=""car"" delay=""5""/>
n	t	t	t<enemy name=""car"" delay=""10""/>
n	t	t	t<enemy name=""car"" delay=""15""/>
n	t	t	t<enemy name=""car"" delay=""20""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""30"" side=""right"" img=""1"">
n	t	t    <enemy name=""parashut"" delay=""3""/>
n	t	t	t<enemy name=""parashut"" delay=""7""/>
n	t	t	t<enemy name=""parashut"" delay=""11""/>
n	t	t  	t<enemy name=""car"" delay=""1""/>
n	t	t	t<enemy name=""car"" delay=""5""/>
n	t	t	t<enemy name=""car"" delay=""10""/>
n	t	t	t<enemy name=""car"" delay=""15""/>
n	t	t	t<enemy name=""car"" delay=""20""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""3"">
n	t    <wave pause=""0"" lifeTime=""50"" side=""left"" img=""1"">
n	t	t	t<enemy name=""tank2"" delay=""1""/>
n    	t</wave>
n	t	t<wave pause=""0"" lifeTime=""50"" side=""right"" img=""1"">
n	t	t	t<enemy name=""tank2"" delay=""1""/>
n    	t</wave>
n	t</group>
n	t<group pause=""5"">
n	t	t<wave pause=""0"" lifeTime=""30"" side=""left"" img=""1"">
n            <enemy name=""heli"" delay=""1""/>
n	t	t	t<enemy name=""heli"" delay=""6""/>
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""12""/>
n	t	t	t<enemy name=""unit2"" delay=""3""/>
n	t	t	t<enemy name=""unit2"" delay=""6""/>
n	t	t	t<enemy name=""unit2"" delay=""9""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""30"" side=""right"" img=""1"">
n            <enemy name=""heli"" delay=""1""/>
n	t	t	t<enemy name=""heli"" delay=""6""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""12""/>
n	t	t	t<enemy name=""unit2"" delay=""3""/>
n	t	t	t<enemy name=""unit2"" delay=""6""/>
n	t	t	t<enemy name=""unit2"" delay=""9""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""3"">
n	t    <wave pause=""0"" lifeTime=""50"" side=""left"" img=""1"">
n	t	t	t<enemy name=""tank2"" delay=""1""/>
n	t	t	t<enemy name=""tank2"" delay=""6""/>
n	t	t	t<enemy name=""tank2"" delay=""15""/>
n    	t</wave>
n	t	t<wave pause=""0"" lifeTime=""50"" side=""right"" img=""1"">
n	t	t	t<enemy name=""tank2"" delay=""1""/>
n	t	t	t<enemy name=""tank2"" delay=""6""/>
n	t	t	t<enemy name=""tank2"" delay=""15""/>
n    	t</wave>
n	t</group>
n	t<group pause=""3"">
n	t    <wave pause=""0"" lifeTime=""50"" side=""left"" img=""1"">
n	t	t	t<enemy name=""heli"" delay=""1""/>
n	t	t	t<enemy name=""heli"" delay=""4""/>
n	t	t	t<enemy name=""heli"" delay=""8""/>
n	t	t	t<enemy name=""heli"" delay=""12""/>
n    	t</wave>
n	t	t<wave pause=""0"" lifeTime=""50"" side=""right"" img=""1"">
n	t	t	t<enemy name=""heli"" delay=""1""/>
n	t	t	t<enemy name=""heli"" delay=""4""/>
n	t	t	t<enemy name=""heli"" delay=""8""/>
n	t	t	t<enemy name=""heli"" delay=""12""/>
n    	t</wave>
n	t</group>
n	t
n	t<group pause=""5"">
n	t	t<wave pause=""0"" lifeTime=""50"" side=""left"" img=""1"">
n	t	t	t<enemy name=""tank1"" delay=""1""/>
n	t	t	t<enemy name=""heli"" delay=""10""/>
n	t	t	t<enemy name=""heli"" delay=""15""/>
n	t	t	t<enemy name=""heli"" delay=""20""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""18""/>
n	t	t	t<enemy name=""unit1"" delay=""19""/>
n	t	t	t<enemy name=""unit1"" delay=""20""/>
n	t	t	t<enemy name=""unit1"" delay=""20""/>
n	t	t	t<enemy name=""unit1"" delay=""22""/>
n	t	t	t<enemy name=""unit1"" delay=""24""/>
n	t	t	t<enemy name=""unit1"" delay=""26""/>
n	t	t	t<enemy name=""unit1"" delay=""27""/>
n	t	t	t<enemy name=""unit1"" delay=""28""/>
n	t	t	t<enemy name=""unit1"" delay=""28""/>
n	t	t	t<enemy name=""unit1"" delay=""30""/>
n	t	t	t<enemy name=""unit1"" delay=""31""/>
n	t	t	t<enemy name=""unit1"" delay=""34""/>
n	t	t	t<enemy name=""unit1"" delay=""35""/>
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""17""/>
n	t	t	t<enemy name=""unit1"" delay=""18""/>
n	t	t	t<enemy name=""unit1"" delay=""19""/>
n	t	t	t<enemy name=""unit1"" delay=""20""/>
n	t	t	t<enemy name=""unit1"" delay=""22""/>
n	t	t	t<enemy name=""unit1"" delay=""23""/>
n	t	t	t<enemy name=""unit1"" delay=""24""/>
n	t	t	t<enemy name=""unit1"" delay=""26""/>
n	t	t	t<enemy name=""unit1"" delay=""27""/>
n	t	t	t<enemy name=""unit1"" delay=""28""/>
n	t	t	t<enemy name=""unit1"" delay=""30""/>
n	t	t	t<enemy name=""unit1"" delay=""31""/>
n	t	t	t<enemy name=""unit1"" delay=""32""/>
n	t	t	t<enemy name=""unit1"" delay=""34""/>
n	t	t	t<enemy name=""unit1"" delay=""35""/>
n	t	t	t<enemy name=""unit1"" delay=""36""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""50"" side=""right"" img=""1"">
n	t	t	t<enemy name=""tank1"" delay=""1""/>
n	t	t	t<enemy name=""heli"" delay=""10""/>
n	t	t	t<enemy name=""heli"" delay=""15""/>
n	t	t	t<enemy name=""heli"" delay=""20""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""18""/>
n	t	t	t<enemy name=""unit1"" delay=""19""/>
n	t	t	t<enemy name=""unit1"" delay=""20""/>
n	t	t	t<enemy name=""unit1"" delay=""20""/>
n	t	t	t<enemy name=""unit1"" delay=""22""/>
n	t	t	t<enemy name=""unit1"" delay=""24""/>
n	t	t	t<enemy name=""unit1"" delay=""26""/>
n	t	t	t<enemy name=""unit1"" delay=""27""/>
n	t	t	t<enemy name=""unit1"" delay=""28""/>
n	t	t	t<enemy name=""unit1"" delay=""28""/>
n	t	t	t<enemy name=""unit1"" delay=""30""/>
n	t	t	t<enemy name=""unit1"" delay=""31""/>
n	t	t	t<enemy name=""unit1"" delay=""34""/>
n	t	t	t<enemy name=""unit1"" delay=""35""/>
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""17""/>
n	t	t	t<enemy name=""unit1"" delay=""18""/>
n	t	t	t<enemy name=""unit1"" delay=""19""/>
n	t	t	t<enemy name=""unit1"" delay=""20""/>
n	t	t	t<enemy name=""unit1"" delay=""22""/>
n	t	t	t<enemy name=""unit1"" delay=""23""/>
n	t	t	t<enemy name=""unit1"" delay=""24""/>
n	t	t	t<enemy name=""unit1"" delay=""26""/>
n	t	t	t<enemy name=""unit1"" delay=""27""/>
n	t	t	t<enemy name=""unit1"" delay=""28""/>
n	t	t	t<enemy name=""unit1"" delay=""30""/>
n	t	t	t<enemy name=""unit1"" delay=""31""/>
n	t	t	t<enemy name=""unit1"" delay=""32""/>
n	t	t	t<enemy name=""unit1"" delay=""34""/>
n	t	t	t<enemy name=""unit1"" delay=""35""/>
n	t	t	t<enemy name=""unit1"" delay=""36""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""3"">
n	t    <wave pause=""0"" lifeTime=""50"" side=""left"" img=""1"">
n	t	t	t<enemy name=""tank3"" delay=""1""/>
n    	t</wave>
n	t	t<wave pause=""0"" lifeTime=""50"" side=""right"" img=""1"">
n	t	t	t<enemy name=""tank3"" delay=""1""/>
n    	t</wave>
n	t</group>
n	t<group pause=""3"">
n	t    <wave pause=""0"" lifeTime=""50"" side=""left"" img=""1"">
n	t	t	t<enemy name=""tank1"" delay=""1""/>
n	t	t	t<enemy name=""tank1"" delay=""6""/>
n	t	t	t<enemy name=""tank1"" delay=""14""/>
n	t	t	t<enemy name=""unit2"" delay=""0""/>
n	t	t	t<enemy name=""unit2"" delay=""4""/>
n	t	t	t<enemy name=""unit2"" delay=""8""/>
n	t	t	t<enemy name=""unit2"" delay=""16""/>
n	t	t	t<enemy name=""unit2"" delay=""20""/>
n	t	t	t<enemy name=""unit2"" delay=""24""/>
n	t	t	t<enemy name=""unit2"" delay=""28""/>
n	t	t	t<enemy name=""parashut"" delay=""3""/>
n	t	t	t<enemy name=""parashut"" delay=""7""/>
n	t	t	t<enemy name=""parashut"" delay=""11""/>
n    	t</wave>
n	t	t<wave pause=""0"" lifeTime=""50"" side=""right"" img=""1"">
n	t	t	t<enemy name=""tank1"" delay=""1""/>
n	t	t	t<enemy name=""tank1"" delay=""6""/>
n	t	t	t<enemy name=""tank1"" delay=""14""/>
n	t	t	t<enemy name=""unit2"" delay=""0""/>
n	t	t	t<enemy name=""unit2"" delay=""4""/>
n	t	t	t<enemy name=""unit2"" delay=""8""/>
n	t	t	t<enemy name=""unit2"" delay=""16""/>
n	t	t	t<enemy name=""unit2"" delay=""20""/>
n	t	t	t<enemy name=""unit2"" delay=""24""/>
n	t	t	t<enemy name=""unit2"" delay=""28""/>
n	t	t	t<enemy name=""parashut"" delay=""3""/>
n	t	t	t<enemy name=""parashut"" delay=""7""/>
n	t	t	t<enemy name=""parashut"" delay=""11""/>
n    	t</wave>
n	t</group>	t	t
n	t<group pause=""3"">
n	t    <wave pause=""0"" lifeTime=""50"" side=""left"" img=""1"">
n	t	t	t<enemy name=""tank3"" delay=""1""/>
n	t	t	t<enemy name=""tank3"" delay=""10""/>
n    	t</wave>
n	t	t<wave pause=""0"" lifeTime=""50"" side=""right"" img=""1"">
n	t	t	t<enemy name=""tank3"" delay=""1""/>
n	t	t	t<enemy name=""tank3"" delay=""10""/>
n    	t</wave>
n	t</group>
n	t<group pause=""3"">
n	t    <wave pause=""0"" lifeTime=""50"" side=""left"" img=""1"">
n	t	t	t<enemy name=""tank1"" delay=""1""/>
n	t	t	t<enemy name=""tank1"" delay=""5""/>
n	t	t	t<enemy name=""tank2"" delay=""10""/>
n	t	t	t<enemy name=""tank2"" delay=""15""/>
n	t	t	t<enemy name=""tank2"" delay=""20""/>
n	t	t	t<enemy name=""parashut"" delay=""1""/>
n	t	t	t<enemy name=""parashut"" delay=""3""/>
n	t	t	t<enemy name=""parashut"" delay=""5""/>
n	t	t	t<enemy name=""parashut"" delay=""8""/>
n	t	t	t<enemy name=""parashut"" delay=""10""/>
n	t	t	t<enemy name=""parashut"" delay=""14""/>
n	t	t	t<enemy name=""parashut"" delay=""16""/>
n	t	t	t<enemy name=""parashut"" delay=""3""/>
n	t	t	t<enemy name=""parashut"" delay=""9""/>
n	t	t	t<enemy name=""parashut"" delay=""14""/>
n    	t</wave>
n	t	t<wave pause=""0"" lifeTime=""50"" side=""right"" img=""1"">
n	t	t	t<enemy name=""tank1"" delay=""1""/>
n	t	t	t<enemy name=""tank1"" delay=""5""/>
n	t	t	t<enemy name=""tank2"" delay=""10""/>
n	t	t	t<enemy name=""tank2"" delay=""15""/>
n	t	t	t<enemy name=""tank2"" delay=""20""/>
n	t	t	t<enemy name=""parashut"" delay=""1""/>
n	t	t	t<enemy name=""parashut"" delay=""3""/>
n	t	t	t<enemy name=""parashut"" delay=""5""/>
n	t	t	t<enemy name=""parashut"" delay=""8""/>
n	t	t	t<enemy name=""parashut"" delay=""10""/>
n	t	t	t<enemy name=""parashut"" delay=""14""/>
n	t	t	t<enemy name=""parashut"" delay=""16""/>
n	t	t	t<enemy name=""parashut"" delay=""3""/>
n	t	t	t<enemy name=""parashut"" delay=""9""/>
n	t	t	t<enemy name=""parashut"" delay=""14""/>
n    	t</wave>
n	t</group>
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""40"" side=""left"" img=""1"">
n	t	t  	t<enemy name=""aerostat"" delay=""0""/>
n	t	t	t<enemy name=""aerostat"" delay=""4""/>
n	t	t	t<enemy name=""aerostat"" delay=""8""/>
n	t	t	t<enemy name=""aerostat"" delay=""16""/>
n	t	t	t<enemy name=""aerostat"" delay=""20""/>
n	t	t	t<enemy name=""aerostat"" delay=""24""/>
n	t	t	t<enemy name=""aerostat"" delay=""28""/>
n	t	t	t<enemy name=""heli"" delay=""1""/>
n	t	t	t<enemy name=""heli"" delay=""4""/>
n	t	t	t<enemy name=""heli"" delay=""8""/>
n	t	t	t<enemy name=""heli"" delay=""12""/>
n	t	t	t<enemy name=""tank3"" delay=""1""/>
n	t	t	t<enemy name=""tank3"" delay=""10""/>
n	t	t	t<enemy name=""tank3"" delay=""20""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""40"" side=""right"" img=""1"">
n	t	t  	t<enemy name=""aerostat"" delay=""0""/>
n	t	t	t<enemy name=""aerostat"" delay=""4""/>
n	t	t	t<enemy name=""aerostat"" delay=""8""/>
n	t	t	t<enemy name=""aerostat"" delay=""16""/>
n	t	t	t<enemy name=""aerostat"" delay=""20""/>
n	t	t	t<enemy name=""aerostat"" delay=""24""/>
n	t	t	t<enemy name=""aerostat"" delay=""28""/>
n	t	t	t<enemy name=""heli"" delay=""1""/>
n	t	t	t<enemy name=""heli"" delay=""4""/>
n	t	t	t<enemy name=""heli"" delay=""8""/>
n	t	t	t<enemy name=""heli"" delay=""12""/>
n	t	t	t<enemy name=""tank3"" delay=""1""/>
n	t	t	t<enemy name=""tank3"" delay=""10""/>
n	t	t	t<enemy name=""tank3"" delay=""20""/>
n	t	t</wave>
n	t</group>
n</level>")("<level eye="normal" money="44000" maxTower="5" maxUpgrade="5" bg="4" upgradeTwo="false" threeStarHealth="80" twoStarHealth="60" preStartMoney="3000">
	<!-- 
		preStartMoney - денег за досрочный вызов волны, может указываться у level и wave
		pause - пауза перед появлением, (секунды)
		lifeTime - время жизни волны, (секунды)
		img - картинка, иконка досрочного вызова волны
		side - сторона, откуда появится враг (left, right), - можно указывать целиком волне(wave) и также отдельным юнитам(enemy)
	-->
	<group pause="0">
		<wave pause="0" lifeTime="30" side="left" img="1">
		  	<enemy name="unit2" delay="0"/>
			<enemy name="unit2" delay="4"/>
			<enemy name="unit2" delay="8"/>
			<enemy name="unit2" delay="16"/>
			<enemy name="unit2" delay="20"/>
			<enemy name="unit2" delay="24"/>
			<enemy name="unit2" delay="28"/>
		</wave>
		<wave pause="0" lifeTime="30" side="right" img="1">
		  	<enemy name="unit2" delay="0"/>
			<enemy name="unit2" delay="4"/>
			<enemy name="unit2" delay="8"/>
			<enemy name="unit2" delay="16"/>
			<enemy name="unit2" delay="20"/>
			<enemy name="unit2" delay="24"/>
			<enemy name="unit2" delay="28"/>
		</wave>
	</group>
	<group pause="0">
		<wave pause="0" lifeTime="40" side="left" img="1">
		  	<enemy name="aerostat" delay="0"/>
			<enemy name="aerostat" delay="4"/>
			<enemy name="aerostat" delay="8"/>
			<enemy name="aerostat" delay="16"/>
			<enemy name="aerostat" delay="20"/>
			<enemy name="aerostat" delay="24"/>
			<enemy name="aerostat" delay="28"/>
			<enemy name="unit2" delay="0"/>
			<enemy name="unit2" delay="4"/>
			<enemy name="unit2" delay="8"/>
			<enemy name="unit2" delay="16"/>
			<enemy name="unit2" delay="20"/>
			<enemy name="unit2" delay="24"/>
			<enemy name="unit2" delay="28"/>
		</wave>
		<wave pause="0" lifeTime="40" side="right" img="1">
		  	<enemy name="aerostat" delay="0"/>
			<enemy name="aerostat" delay="4"/>
			<enemy name="aerostat" delay="8"/>
			<enemy name="aerostat" delay="16"/>
			<enemy name="aerostat" delay="20"/>
			<enemy name="aerostat" delay="24"/>
			<enemy name="aerostat" delay="28"/>
			<enemy name="unit2" delay="0"/>
			<enemy name="unit2" delay="4"/>
			<enemy name="unit2" delay="8"/>
			<enemy name="unit2" delay="16"/>
			<enemy name="unit2" delay="20"/>
			<enemy name="unit2" delay="24"/>
			<enemy name="unit2" delay="28"/>
		</wave>
	</group>
	<group pause="2">
		<wave pause="0" lifeTime="30" side="left" img="1">
			<enemy name="airplane" delay="5"/>
			<enemy name="airplane" delay="11"/>
		  	<enemy name="tanket" delay="1"/>
			<enemy name="tanket" delay="4"/>
			<enemy name="tanket" delay="8"/>
			<enemy name="tanket" delay="12"/>
		</wave>
		<wave pause="0" lifeTime="30" side="right" img="1">
		    <enemy name="airplane" delay="5"/>
			<enemy name="airplane" delay="11"/>
			<enemy name="tanket" delay="1"/>
			<enemy name="tanket" delay="4"/>
			<enemy name="tanket" delay="8"/>
			<enemy name="tanket" delay="12"/>
		</wave>
	</group>
	<group pause="2">
		<wave pause="0" lifeTime="30" side="left" img="1">
			<enemy name="parashut" delay="3"/>
			<enemy name="parashut" delay="7"/>
			<enemy name="parashut" delay="11"/>
		  	<enemy name="car" delay="1"/>
			<enemy name="car" delay="5"/>
			<enemy name="car" delay="10"/>
			<enemy name="car" delay="15"/>
			<enemy name="car" delay="20"/>
		</wave>
		<wave pause="0" lifeTime="30" side="right" img="1">
		    <enemy name="parashut" delay="3"/>
			<enemy name="parashut" delay="7"/>
			<enemy name="parashut" delay="11"/>
		  	<enemy name="car" delay="1"/>
			<enemy name="car" delay="5"/>
			<enemy name="car" delay="10"/>
			<enemy name="car" delay="15"/>
			<enemy name="car" delay="20"/>
		</wave>
	</group>
	<group pause="3">
	    <wave pause="0" lifeTime="50" side="left" img="1">
			<enemy name="tank2" delay="1"/>
    	</wave>
		<wave pause="0" lifeTime="50" side="right" img="1">
			<enemy name="tank2" delay="1"/>
    	</wave>
	</group>
	<group pause="5">
		<wave pause="0" lifeTime="30" side="left" img="1">
            <enemy name="heli" delay="1"/>
			<enemy name="heli" delay="6"/>
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit1" delay="7"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="12"/>
			<enemy name="unit2" delay="3"/>
			<enemy name="unit2" delay="6"/>
			<enemy name="unit2" delay="9"/>
		</wave>
		<wave pause="0" lifeTime="30" side="right" img="1">
            <enemy name="heli" delay="1"/>
			<enemy name="heli" delay="6"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit1" delay="7"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="12"/>
			<enemy name="unit2" delay="3"/>
			<enemy name="unit2" delay="6"/>
			<enemy name="unit2" delay="9"/>
		</wave>
	</group>
	<group pause="3">
	    <wave pause="0" lifeTime="50" side="left" img="1">
			<enemy name="tank2" delay="1"/>
			<enemy name="tank2" delay="6"/>
			<enemy name="tank2" delay="15"/>
    	</wave>
		<wave pause="0" lifeTime="50" side="right" img="1">
			<enemy name="tank2" delay="1"/>
			<enemy name="tank2" delay="6"/>
			<enemy name="tank2" delay="15"/>
    	</wave>
	</group>
	<group pause="3">
	    <wave pause="0" lifeTime="50" side="left" img="1">
			<enemy name="heli" delay="1"/>
			<enemy name="heli" delay="4"/>
			<enemy name="heli" delay="8"/>
			<enemy name="heli" delay="12"/>
    	</wave>
		<wave pause="0" lifeTime="50" side="right" img="1">
			<enemy name="heli" delay="1"/>
			<enemy name="heli" delay="4"/>
			<enemy name="heli" delay="8"/>
			<enemy name="heli" delay="12"/>
    	</wave>
	</group>
	
	<group pause="5">
		<wave pause="0" lifeTime="50" side="left" img="1">
			<enemy name="tank1" delay="1"/>
			<enemy name="heli" delay="10"/>
			<enemy name="heli" delay="15"/>
			<enemy name="heli" delay="20"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="18"/>
			<enemy name="unit1" delay="19"/>
			<enemy name="unit1" delay="20"/>
			<enemy name="unit1" delay="20"/>
			<enemy name="unit1" delay="22"/>
			<enemy name="unit1" delay="24"/>
			<enemy name="unit1" delay="26"/>
			<enemy name="unit1" delay="27"/>
			<enemy name="unit1" delay="28"/>
			<enemy name="unit1" delay="28"/>
			<enemy name="unit1" delay="30"/>
			<enemy name="unit1" delay="31"/>
			<enemy name="unit1" delay="34"/>
			<enemy name="unit1" delay="35"/>
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit1" delay="7"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="17"/>
			<enemy name="unit1" delay="18"/>
			<enemy name="unit1" delay="19"/>
			<enemy name="unit1" delay="20"/>
			<enemy name="unit1" delay="22"/>
			<enemy name="unit1" delay="23"/>
			<enemy name="unit1" delay="24"/>
			<enemy name="unit1" delay="26"/>
			<enemy name="unit1" delay="27"/>
			<enemy name="unit1" delay="28"/>
			<enemy name="unit1" delay="30"/>
			<enemy name="unit1" delay="31"/>
			<enemy name="unit1" delay="32"/>
			<enemy name="unit1" delay="34"/>
			<enemy name="unit1" delay="35"/>
			<enemy name="unit1" delay="36"/>
		</wave>
		<wave pause="0" lifeTime="50" side="right" img="1">
			<enemy name="tank1" delay="1"/>
			<enemy name="heli" delay="10"/>
			<enemy name="heli" delay="15"/>
			<enemy name="heli" delay="20"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="18"/>
			<enemy name="unit1" delay="19"/>
			<enemy name="unit1" delay="20"/>
			<enemy name="unit1" delay="20"/>
			<enemy name="unit1" delay="22"/>
			<enemy name="unit1" delay="24"/>
			<enemy name="unit1" delay="26"/>
			<enemy name="unit1" delay="27"/>
			<enemy name="unit1" delay="28"/>
			<enemy name="unit1" delay="28"/>
			<enemy name="unit1" delay="30"/>
			<enemy name="unit1" delay="31"/>
			<enemy name="unit1" delay="34"/>
			<enemy name="unit1" delay="35"/>
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit1" delay="7"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="17"/>
			<enemy name="unit1" delay="18"/>
			<enemy name="unit1" delay="19"/>
			<enemy name="unit1" delay="20"/>
			<enemy name="unit1" delay="22"/>
			<enemy name="unit1" delay="23"/>
			<enemy name="unit1" delay="24"/>
			<enemy name="unit1" delay="26"/>
			<enemy name="unit1" delay="27"/>
			<enemy name="unit1" delay="28"/>
			<enemy name="unit1" delay="30"/>
			<enemy name="unit1" delay="31"/>
			<enemy name="unit1" delay="32"/>
			<enemy name="unit1" delay="34"/>
			<enemy name="unit1" delay="35"/>
			<enemy name="unit1" delay="36"/>
		</wave>
	</group>
	<group pause="3">
	    <wave pause="0" lifeTime="50" side="left" img="1">
			<enemy name="tank3" delay="1"/>
    	</wave>
		<wave pause="0" lifeTime="50" side="right" img="1">
			<enemy name="tank3" delay="1"/>
    	</wave>
	</group>
	<group pause="3">
	    <wave pause="0" lifeTime="50" side="left" img="1">
			<enemy name="tank1" delay="1"/>
			<enemy name="tank1" delay="6"/>
			<enemy name="tank1" delay="14"/>
			<enemy name="unit2" delay="0"/>
			<enemy name="unit2" delay="4"/>
			<enemy name="unit2" delay="8"/>
			<enemy name="unit2" delay="16"/>
			<enemy name="unit2" delay="20"/>
			<enemy name="unit2" delay="24"/>
			<enemy name="unit2" delay="28"/>
			<enemy name="parashut" delay="3"/>
			<enemy name="parashut" delay="7"/>
			<enemy name="parashut" delay="11"/>
    	</wave>
		<wave pause="0" lifeTime="50" side="right" img="1">
			<enemy name="tank1" delay="1"/>
			<enemy name="tank1" delay="6"/>
			<enemy name="tank1" delay="14"/>
			<enemy name="unit2" delay="0"/>
			<enemy name="unit2" delay="4"/>
			<enemy name="unit2" delay="8"/>
			<enemy name="unit2" delay="16"/>
			<enemy name="unit2" delay="20"/>
			<enemy name="unit2" delay="24"/>
			<enemy name="unit2" delay="28"/>
			<enemy name="parashut" delay="3"/>
			<enemy name="parashut" delay="7"/>
			<enemy name="parashut" delay="11"/>
    	</wave>
	</group>		
	<group pause="3">
	    <wave pause="0" lifeTime="50" side="left" img="1">
			<enemy name="tank3" delay="1"/>
			<enemy name="tank3" delay="10"/>
    	</wave>
		<wave pause="0" lifeTime="50" side="right" img="1">
			<enemy name="tank3" delay="1"/>
			<enemy name="tank3" delay="10"/>
    	</wave>
	</group>
	<group pause="3">
	    <wave pause="0" lifeTime="50" side="left" img="1">
			<enemy name="tank1" delay="1"/>
			<enemy name="tank1" delay="5"/>
			<enemy name="tank2" delay="10"/>
			<enemy name="tank2" delay="15"/>
			<enemy name="tank2" delay="20"/>
			<enemy name="parashut" delay="1"/>
			<enemy name="parashut" delay="3"/>
			<enemy name="parashut" delay="5"/>
			<enemy name="parashut" delay="8"/>
			<enemy name="parashut" delay="10"/>
			<enemy name="parashut" delay="14"/>
			<enemy name="parashut" delay="16"/>
			<enemy name="parashut" delay="3"/>
			<enemy name="parashut" delay="9"/>
			<enemy name="parashut" delay="14"/>
    	</wave>
		<wave pause="0" lifeTime="50" side="right" img="1">
			<enemy name="tank1" delay="1"/>
			<enemy name="tank1" delay="5"/>
			<enemy name="tank2" delay="10"/>
			<enemy name="tank2" delay="15"/>
			<enemy name="tank2" delay="20"/>
			<enemy name="parashut" delay="1"/>
			<enemy name="parashut" delay="3"/>
			<enemy name="parashut" delay="5"/>
			<enemy name="parashut" delay="8"/>
			<enemy name="parashut" delay="10"/>
			<enemy name="parashut" delay="14"/>
			<enemy name="parashut" delay="16"/>
			<enemy name="parashut" delay="3"/>
			<enemy name="parashut" delay="9"/>
			<enemy name="parashut" delay="14"/>
    	</wave>
	</group>
	<group pause="0">
		<wave pause="0" lifeTime="40" side="left" img="1">
		  	<enemy name="aerostat" delay="0"/>
			<enemy name="aerostat" delay="4"/>
			<enemy name="aerostat" delay="8"/>
			<enemy name="aerostat" delay="16"/>
			<enemy name="aerostat" delay="20"/>
			<enemy name="aerostat" delay="24"/>
			<enemy name="aerostat" delay="28"/>
			<enemy name="heli" delay="1"/>
			<enemy name="heli" delay="4"/>
			<enemy name="heli" delay="8"/>
			<enemy name="heli" delay="12"/>
			<enemy name="tank3" delay="1"/>
			<enemy name="tank3" delay="10"/>
			<enemy name="tank3" delay="20"/>
		</wave>
		<wave pause="0" lifeTime="40" side="right" img="1">
		  	<enemy name="aerostat" delay="0"/>
			<enemy name="aerostat" delay="4"/>
			<enemy name="aerostat" delay="8"/>
			<enemy name="aerostat" delay="16"/>
			<enemy name="aerostat" delay="20"/>
			<enemy name="aerostat" delay="24"/>
			<enemy name="aerostat" delay="28"/>
			<enemy name="heli" delay="1"/>
			<enemy name="heli" delay="4"/>
			<enemy name="heli" delay="8"/>
			<enemy name="heli" delay="12"/>
			<enemy name="tank3" delay="1"/>
			<enemy name="tank3" delay="10"/>
			<enemy name="tank3" delay="20"/>
		</wave>
	</group>
</level>;
            var _loc_12:* = <level eye=""normal"" money=""46000"" maxTower=""5"" maxUpgrade=""5"" bg=""4"" upgradeTwo=""true"" threeStarHealth=""80"" twoStarHealth=""60"" preStartMoney=""3000"">
n	t<!-- 
n	t	tpreStartMoney - денег за досрочный вызов волны, может указываться у level и wave
n	t	tpause - пауза перед появлением, (секунды)
n	t	tlifeTime - время жизни волны, (секунды)
n	t	timg - картинка, иконка досрочного вызова волны
n	t	tside - сторона, откуда появится враг (left, right), - можно указывать целиком волне(wave) и также отдельным юнитам(enemy)
n	t-->
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""50"" side=""left"" img=""1"">
n	t	t	t<enemy name=""balloon"" delay=""1""/>
n	t	t	t<enemy name=""balloon"" delay=""5""/>
n	t	t	t<enemy name=""balloon"" delay=""10""/>
n	t	t	t<enemy name=""balloon"" delay=""15""/>
n	t	t	t<enemy name=""balloon"" delay=""20""/>
n	t	t	t<enemy name=""parashut"" delay=""5""/>
n	t	t	t<enemy name=""parashut"" delay=""9""/>
n	t	t	t<enemy name=""parashut"" delay=""12""/>
n	t	t	t<enemy name=""parashut"" delay=""15""/>
n	t	t	t<enemy name=""parashut"" delay=""20""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""50"" side=""right"" img=""1"">
n	t	t	t<enemy name=""balloon"" delay=""1""/>
n	t	t	t<enemy name=""balloon"" delay=""5""/>
n	t	t	t<enemy name=""balloon"" delay=""10""/>
n	t	t	t<enemy name=""balloon"" delay=""15""/>
n	t	t	t<enemy name=""balloon"" delay=""20""/>
n	t	t	t<enemy name=""parashut"" delay=""5""/>
n	t	t	t<enemy name=""parashut"" delay=""9""/>
n	t	t	t<enemy name=""parashut"" delay=""12""/>
n	t	t	t<enemy name=""parashut"" delay=""15""/>
n	t	t	t<enemy name=""parashut"" delay=""20""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""30"" side=""left"" img=""1"">
n	t	t  	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit2"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit2"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit2"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""aerostat"" delay=""0""/>
n	t	t	t<enemy name=""aerostat"" delay=""4""/>
n	t	t	t<enemy name=""aerostat"" delay=""8""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""30"" side=""right"" img=""1"">
n	t	t  	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit2"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit2"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit2"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""aerostat"" delay=""0""/>
n	t	t	t<enemy name=""aerostat"" delay=""4""/>
n	t	t	t<enemy name=""aerostat"" delay=""8""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""50"" side=""left"" img=""1"">
n	t	t	t<enemy name=""balloon"" delay=""1""/>
n	t	t	t<enemy name=""balloon"" delay=""5""/>
n	t	t	t<enemy name=""balloon"" delay=""10""/>
n	t	t	t<enemy name=""balloon"" delay=""15""/>
n	t	t	t<enemy name=""balloon"" delay=""20""/>
n	t	t	t<enemy name=""aerostat"" delay=""0""/>
n	t	t	t<enemy name=""aerostat"" delay=""4""/>
n	t	t	t<enemy name=""aerostat"" delay=""8""/>
n	t	t	t<enemy name=""aerostat"" delay=""16""/>
n	t	t	t<enemy name=""aerostat"" delay=""20""/>
n	t	t	t<enemy name=""aerostat"" delay=""24""/>
n	t	t	t<enemy name=""aerostat"" delay=""28""/>
n	t	t	t<enemy name=""car"" delay=""1""/>
n	t	t	t<enemy name=""car"" delay=""6""/>
n	t	t	t<enemy name=""car"" delay=""12""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""50"" side=""right"" img=""1"">
n	t	t	t<enemy name=""balloon"" delay=""1""/>
n	t	t	t<enemy name=""balloon"" delay=""5""/>
n	t	t	t<enemy name=""balloon"" delay=""10""/>
n	t	t	t<enemy name=""balloon"" delay=""15""/>
n	t	t	t<enemy name=""balloon"" delay=""20""/>
n	t	t	t<enemy name=""aerostat"" delay=""0""/>
n	t	t	t<enemy name=""aerostat"" delay=""4""/>
n	t	t	t<enemy name=""aerostat"" delay=""8""/>
n	t	t	t<enemy name=""aerostat"" delay=""16""/>
n	t	t	t<enemy name=""aerostat"" delay=""20""/>
n	t	t	t<enemy name=""aerostat"" delay=""24""/>
n	t	t	t<enemy name=""aerostat"" delay=""28""/>
n	t	t	t<enemy name=""car"" delay=""1""/>
n	t	t	t<enemy name=""car"" delay=""6""/>
n	t	t	t<enemy name=""car"" delay=""12""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""5"">
n	t    <wave pause=""0"" lifeTime=""75"" side=""left"" img=""1"">
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""6""/>
n	t	t	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""12""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit1"" delay=""17""/>
n	t	t	t<enemy name=""unit1"" delay=""19""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""12""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit1"" delay=""17""/>
n	t	t	t<enemy name=""unit1"" delay=""19""/>
n	t	t	t<enemy name=""unit1"" delay=""20""/>
n	t	t	t<enemy name=""unit1"" delay=""21""/>
n	t	t	t<enemy name=""unit1"" delay=""22""/>
n	t	t	t<enemy name=""unit1"" delay=""23""/>
n	t	t	t<enemy name=""unit1"" delay=""24""/>
n	t	t	t<enemy name=""unit1"" delay=""25""/>
n	t	t	t<enemy name=""unit1"" delay=""26""/>
n	t	t	t<enemy name=""unit1"" delay=""27""/>
n	t	t	t<enemy name=""unit1"" delay=""28""/>
n	t	t	t<enemy name=""unit1"" delay=""29""/>
n	t	t	t<enemy name=""unit1"" delay=""30""/>
n	t	t	t<enemy name=""unit1"" delay=""40""/>
n	t	t	t<enemy name=""unit1"" delay=""41""/>
n	t	t	t<enemy name=""unit1"" delay=""42""/>
n	t	t	t<enemy name=""unit1"" delay=""43""/>
n	t	t	t<enemy name=""unit1"" delay=""44""/>
n	t	t	t<enemy name=""unit1"" delay=""45""/>
n	t	t	t<enemy name=""unit1"" delay=""46""/>
n	t	t	t<enemy name=""unit1"" delay=""47""/>
n	t	t	t<enemy name=""unit1"" delay=""48""/>
n	t	t	t<enemy name=""unit1"" delay=""49""/>
n	t	t	t<enemy name=""unit1"" delay=""50""/>
n	t	t	t
n	t	t	t<enemy name=""unit2"" delay=""20""/>
n	t	t	t<enemy name=""unit2"" delay=""22""/>
n	t	t	t<enemy name=""unit2"" delay=""24""/>
n	t	t	t<enemy name=""unit2"" delay=""26""/>
n	t	t	t<enemy name=""unit2"" delay=""28""/>
n	t	t	t<enemy name=""unit2"" delay=""30""/>
n	t	t	t<enemy name=""unit2"" delay=""32""/>
n	t	t	t<enemy name=""unit2"" delay=""34""/>
n	t	t	t<enemy name=""unit2"" delay=""36""/>
n	t	t	t<enemy name=""unit2"" delay=""38""/>
n	t	t	t<enemy name=""unit2"" delay=""40""/>
n	t	t	t
n	t	t	t<enemy name=""tanket"" delay=""30""/>
n	t	t	t<enemy name=""tanket"" delay=""34""/>
n	t	t	t<enemy name=""tanket"" delay=""38""/>
n	t	t	t<enemy name=""tanket"" delay=""42""/>
n	t	t	t<enemy name=""tanket"" delay=""46""/>
n	t	t	t<enemy name=""tanket"" delay=""50""/>
n	t	t	t<enemy name=""tanket"" delay=""54""/>
n	t	t	t
n	t	t	t<enemy name=""car"" delay=""50""/>
n	t	t	t<enemy name=""car"" delay=""60""/>
n	t	t	t<enemy name=""car"" delay=""65""/>
n	t	t	t<enemy name=""car"" delay=""70""/>
n	t	t	t
n	t	t	t<enemy name=""parashut"" delay=""1""/>
n	t	t	t<enemy name=""parashut"" delay=""10""/>
n	t	t	t<enemy name=""parashut"" delay=""20""/>
n	t	t	t<enemy name=""parashut"" delay=""30""/>
n	t	t	t<enemy name=""parashut"" delay=""40""/>
n	t	t	t<enemy name=""parashut"" delay=""50""/>
n	t	t	t<enemy name=""parashut"" delay=""60""/>
n	t	t	t<enemy name=""parashut"" delay=""70""/>
n    	t</wave>
n	t	t<wave pause=""0"" lifeTime=""75"" side=""right"" img=""1"">
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""6""/>
n	t	t	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""12""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit1"" delay=""17""/>
n	t	t	t<enemy name=""unit1"" delay=""19""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""12""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit1"" delay=""17""/>
n	t	t	t<enemy name=""unit1"" delay=""19""/>
n	t	t	t<enemy name=""unit1"" delay=""20""/>
n	t	t	t<enemy name=""unit1"" delay=""21""/>
n	t	t	t<enemy name=""unit1"" delay=""22""/>
n	t	t	t<enemy name=""unit1"" delay=""23""/>
n	t	t	t<enemy name=""unit1"" delay=""24""/>
n	t	t	t<enemy name=""unit1"" delay=""25""/>
n	t	t	t<enemy name=""unit1"" delay=""26""/>
n	t	t	t<enemy name=""unit1"" delay=""27""/>
n	t	t	t<enemy name=""unit1"" delay=""28""/>
n	t	t	t<enemy name=""unit1"" delay=""29""/>
n	t	t	t<enemy name=""unit1"" delay=""30""/>
n	t	t	t<enemy name=""unit1"" delay=""40""/>
n	t	t	t<enemy name=""unit1"" delay=""41""/>
n	t	t	t<enemy name=""unit1"" delay=""42""/>
n	t	t	t<enemy name=""unit1"" delay=""43""/>
n	t	t	t<enemy name=""unit1"" delay=""44""/>
n	t	t	t<enemy name=""unit1"" delay=""45""/>
n	t	t	t<enemy name=""unit1"" delay=""46""/>
n	t	t	t<enemy name=""unit1"" delay=""47""/>
n	t	t	t<enemy name=""unit1"" delay=""48""/>
n	t	t	t<enemy name=""unit1"" delay=""49""/>
n	t	t	t<enemy name=""unit1"" delay=""50""/>
n	t	t	t
n	t	t	t<enemy name=""unit2"" delay=""20""/>
n	t	t	t<enemy name=""unit2"" delay=""22""/>
n	t	t	t<enemy name=""unit2"" delay=""24""/>
n	t	t	t<enemy name=""unit2"" delay=""26""/>
n	t	t	t<enemy name=""unit2"" delay=""28""/>
n	t	t	t<enemy name=""unit2"" delay=""30""/>
n	t	t	t<enemy name=""unit2"" delay=""32""/>
n	t	t	t<enemy name=""unit2"" delay=""34""/>
n	t	t	t<enemy name=""unit2"" delay=""36""/>
n	t	t	t<enemy name=""unit2"" delay=""38""/>
n	t	t	t<enemy name=""unit2"" delay=""40""/>
n	t	t	t
n	t	t	t<enemy name=""tanket"" delay=""30""/>
n	t	t	t<enemy name=""tanket"" delay=""34""/>
n	t	t	t<enemy name=""tanket"" delay=""38""/>
n	t	t	t<enemy name=""tanket"" delay=""42""/>
n	t	t	t<enemy name=""tanket"" delay=""46""/>
n	t	t	t<enemy name=""tanket"" delay=""50""/>
n	t	t	t<enemy name=""tanket"" delay=""54""/>
n	t	t	t
n	t	t	t<enemy name=""car"" delay=""50""/>
n	t	t	t<enemy name=""car"" delay=""60""/>
n	t	t	t<enemy name=""car"" delay=""65""/>
n	t	t	t<enemy name=""car"" delay=""70""/>
n	t	t	t
n	t	t	t<enemy name=""parashut"" delay=""1""/>
n	t	t	t<enemy name=""parashut"" delay=""10""/>
n	t	t	t<enemy name=""parashut"" delay=""20""/>
n	t	t	t<enemy name=""parashut"" delay=""30""/>
n	t	t	t<enemy name=""parashut"" delay=""40""/>
n	t	t	t<enemy name=""parashut"" delay=""50""/>
n	t	t	t<enemy name=""parashut"" delay=""60""/>
n	t	t	t<enemy name=""parashut"" delay=""70""/>
n    	t</wave>
n	t</group>
n	t<group pause=""0"">
n	t    <wave pause=""0"" lifeTime=""20"" side=""left"" img=""1"">
n	t	t	t<enemy name=""tank2"" delay=""1""/>
n	t	t	t<enemy name=""unit2"" delay=""5""/>
n	t	t	t<enemy name=""unit2"" delay=""6""/>
n	t	t	t<enemy name=""unit2"" delay=""7""/>
n	t	t	t<enemy name=""unit2"" delay=""8""/>
n	t	t	t<enemy name=""unit2"" delay=""9""/>
n	t	t	t<enemy name=""unit2"" delay=""10""/>
n	t	t	t<enemy name=""tank1"" delay=""10""/>
n    	t</wave>
n	t	t<wave pause=""0"" lifeTime=""20"" side=""right"" img=""1"">
n	t	t	t<enemy name=""tank2"" delay=""1""/>
n	t	t	t<enemy name=""unit2"" delay=""5""/>
n	t	t	t<enemy name=""unit2"" delay=""6""/>
n	t	t	t<enemy name=""unit2"" delay=""7""/>
n	t	t	t<enemy name=""unit2"" delay=""8""/>
n	t	t	t<enemy name=""unit2"" delay=""9""/>
n	t	t	t<enemy name=""unit2"" delay=""10""/>
n	t	t	t<enemy name=""tank1"" delay=""10""/>
n    	t</wave>
n	t</group>
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""20"" side=""left"" img=""1"">
n	t	t    <enemy name=""airplane"" delay=""5""/>
n	t	t	t<enemy name=""unit2"" delay=""5""/>
n	t	t	t<enemy name=""unit2"" delay=""7""/>
n	t	t	t<enemy name=""unit2"" delay=""9""/>
n	t	t	t<enemy name=""unit2"" delay=""11""/>
n	t	t	t<enemy name=""unit2"" delay=""13""/>
n	t	t	t<enemy name=""unit2"" delay=""15""/>
n	t	t	t<enemy name=""unit2"" delay=""17""/>
n	t	t	t<enemy name=""unit2"" delay=""19""/>
n	t	t	t<enemy name=""unit2"" delay=""21""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""20"" side=""right"" img=""1"">
n	t	t    <enemy name=""airplane"" delay=""5""/>
n	t	t    <enemy name=""unit2"" delay=""5""/>
n	t	t	t<enemy name=""unit2"" delay=""7""/>
n	t	t	t<enemy name=""unit2"" delay=""9""/>
n	t	t	t<enemy name=""unit2"" delay=""11""/>
n	t	t	t<enemy name=""unit2"" delay=""13""/>
n	t	t	t<enemy name=""unit2"" delay=""15""/>
n	t	t	t<enemy name=""unit2"" delay=""17""/>
n	t	t	t<enemy name=""unit2"" delay=""19""/>
n	t	t	t<enemy name=""unit2"" delay=""21""/>
n	t	t</wave>
n	t</group>	t
n	t<group pause=""5"">
n	t	t<wave pause=""0"" lifeTime=""40"" side=""left"" img=""1"">
n	t	t   <enemy name=""walker1"" delay=""1""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""40"" side=""right"" img=""1"">
n	t	t   <enemy name=""walker1"" delay=""1""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""3"">
n	t    <wave pause=""0"" lifeTime=""50"" side=""left"" img=""1"">
n	t	t	t<enemy name=""heli"" delay=""1""/>
n	t	t	t<enemy name=""heli"" delay=""4""/>
n	t	t	t<enemy name=""heli"" delay=""8""/>
n	t	t	t<enemy name=""heli"" delay=""12""/>
n	t	t	t<enemy name=""heli"" delay=""16""/>
n	t	t	t<enemy name=""heli"" delay=""20""/>
n    	t</wave>
n	t	t<wave pause=""0"" lifeTime=""50"" side=""right"" img=""1"">
n	t	t	t<enemy name=""heli"" delay=""1""/>
n	t	t	t<enemy name=""heli"" delay=""4""/>
n	t	t	t<enemy name=""heli"" delay=""8""/>
n	t	t	t<enemy name=""heli"" delay=""12""/>
n	t	t	t<enemy name=""heli"" delay=""16""/>
n	t	t	t<enemy name=""heli"" delay=""20""/>
n    	t</wave>
n	t</group>
n	t<group pause=""5"">
n	t	t<wave pause=""0"" lifeTime=""50"" side=""left"" img=""1"">
n	t	t   <enemy name=""walker1"" delay=""1""/>
n	t	t   <enemy name=""walker1"" delay=""20""/>
n	t	t   <enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""6""/>
n	t	t	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""12""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit1"" delay=""17""/>
n	t	t	t<enemy name=""unit1"" delay=""19""/>
n	t	t	t
n	t	t	t<enemy name=""unit2"" delay=""20""/>
n	t	t	t<enemy name=""unit2"" delay=""22""/>
n	t	t	t<enemy name=""unit2"" delay=""24""/>
n	t	t	t<enemy name=""unit2"" delay=""26""/>
n	t	t	t<enemy name=""unit2"" delay=""28""/>
n	t	t	t<enemy name=""unit2"" delay=""30""/>
n	t	t	t<enemy name=""unit2"" delay=""32""/>
n	t	t	t<enemy name=""unit2"" delay=""34""/>
n	t	t	t<enemy name=""unit2"" delay=""36""/>
n	t	t	t<enemy name=""unit2"" delay=""38""/>
n	t	t	t<enemy name=""unit2"" delay=""40""/>
n	t	t	t
n	t	t	t<enemy name=""balloon"" delay=""1""/>
n	t	t	t<enemy name=""balloon"" delay=""10""/>
n	t	t	t<enemy name=""balloon"" delay=""20""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""50"" side=""right"" img=""1"">
n	t	t   <enemy name=""walker1"" delay=""1""/>
n	t	t   <enemy name=""walker1"" delay=""20""/>
n	t	t   <enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""6""/>
n	t	t	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""12""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit1"" delay=""17""/>
n	t	t	t<enemy name=""unit1"" delay=""19""/>
n	t	t	t
n	t	t	t<enemy name=""unit2"" delay=""20""/>
n	t	t	t<enemy name=""unit2"" delay=""22""/>
n	t	t	t<enemy name=""unit2"" delay=""24""/>
n	t	t	t<enemy name=""unit2"" delay=""26""/>
n	t	t	t<enemy name=""unit2"" delay=""28""/>
n	t	t	t<enemy name=""unit2"" delay=""30""/>
n	t	t	t<enemy name=""unit2"" delay=""32""/>
n	t	t	t<enemy name=""unit2"" delay=""34""/>
n	t	t	t<enemy name=""unit2"" delay=""36""/>
n	t	t	t<enemy name=""unit2"" delay=""38""/>
n	t	t	t<enemy name=""unit2"" delay=""40""/>
n	t	t	t
n	t	t	t<enemy name=""balloon"" delay=""1""/>
n	t	t	t<enemy name=""balloon"" delay=""10""/>
n	t	t	t<enemy name=""balloon"" delay=""20""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""5"">
n	t	t<wave pause=""0"" lifeTime=""40"" side=""right"" img=""1"">
n	t	t   <enemy name=""walker1"" delay=""1""/>
n	t	t   <enemy name=""walker1"" delay=""5""/>
n	t	t   <enemy name=""walker1"" delay=""10""/>
n	t	t   <enemy name=""walker1"" delay=""15""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""5"">
n	t    <wave pause=""0"" lifeTime=""40"" side=""left"" img=""1"">
n	t	t   <enemy name=""walker1"" delay=""1""/>
n	t	t   <enemy name=""tank1"" delay=""3""/>
n	t	t   <enemy name=""tank1"" delay=""8""/>
n	t	t   <enemy name=""walker1"" delay=""10""/>
n	t	t   <enemy name=""tank2"" delay=""13""/>
n	t	t   <enemy name=""tank2"" delay=""18""/>
n	t	t   <enemy name=""walker1"" delay=""20""/>
n	t	t   <enemy name=""aerostat"" delay=""1""/>
n	t	t   <enemy name=""aerostat"" delay=""4""/>
n	t	t   <enemy name=""aerostat"" delay=""10""/>
n	t	t   <enemy name=""aerostat"" delay=""15""/>
n	t	t   <enemy name=""aerostat"" delay=""20""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""40"" side=""right"" img=""1"">
n	t	t   <enemy name=""walker1"" delay=""1""/>
n	t	t   <enemy name=""tank1"" delay=""3""/>
n	t	t   <enemy name=""tank1"" delay=""8""/>
n	t	t   <enemy name=""walker1"" delay=""10""/>
n	t	t   <enemy name=""tank2"" delay=""13""/>
n	t	t   <enemy name=""tank2"" delay=""18""/>
n	t	t   <enemy name=""walker1"" delay=""20""/>
n	t	t   <enemy name=""aerostat"" delay=""1""/>
n	t	t   <enemy name=""aerostat"" delay=""4""/>
n	t	t   <enemy name=""aerostat"" delay=""10""/>
n	t	t   <enemy name=""aerostat"" delay=""15""/>
n	t	t   <enemy name=""aerostat"" delay=""20""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""5"">
n	t	t<wave pause=""0"" lifeTime=""50"" side=""left"" img=""1"">
n	t	t   <enemy name=""tank3"" delay=""1""/>
n	t	t   <enemy name=""walker1"" delay=""10""/>
n	t	t   <enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""6""/>
n	t	t	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""12""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit1"" delay=""17""/>
n	t	t	t<enemy name=""unit1"" delay=""19""/>
n	t	t	t<enemy name=""car"" delay=""10""/>
n	t	t	t<enemy name=""car"" delay=""15""/>
n	t	t	t<enemy name=""car"" delay=""20""/>
n	t	t	t<enemy name=""airplane"" delay=""5""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""50"" side=""right"" img=""1"">
n	t	t   <enemy name=""tank3"" delay=""1""/>
n	t	t   <enemy name=""walker1"" delay=""10""/>
n	t	t   <enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""6""/>
n	t	t	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""12""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit1"" delay=""17""/>
n	t	t	t<enemy name=""unit1"" delay=""19""/>
n	t	t	t<enemy name=""car"" delay=""10""/>
n	t	t	t<enemy name=""car"" delay=""15""/>
n	t	t	t<enemy name=""car"" delay=""20""/>
n	t	t	t<enemy name=""airplane"" delay=""5""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""3"">
n	t    <wave pause=""0"" lifeTime=""50"" side=""left"" img=""1"">
n	t	t	t<enemy name=""walker2"" delay=""1""/>
n    	t</wave>
n	t	t<wave pause=""0"" lifeTime=""50"" side=""right"" img=""1"">
n	t	t	t<enemy name=""walker2"" delay=""1""/>
n    	t</wave>
n	t</group>
n</level>")("<level eye="normal" money="46000" maxTower="5" maxUpgrade="5" bg="4" upgradeTwo="true" threeStarHealth="80" twoStarHealth="60" preStartMoney="3000">
	<!-- 
		preStartMoney - денег за досрочный вызов волны, может указываться у level и wave
		pause - пауза перед появлением, (секунды)
		lifeTime - время жизни волны, (секунды)
		img - картинка, иконка досрочного вызова волны
		side - сторона, откуда появится враг (left, right), - можно указывать целиком волне(wave) и также отдельным юнитам(enemy)
	-->
	<group pause="0">
		<wave pause="0" lifeTime="50" side="left" img="1">
			<enemy name="balloon" delay="1"/>
			<enemy name="balloon" delay="5"/>
			<enemy name="balloon" delay="10"/>
			<enemy name="balloon" delay="15"/>
			<enemy name="balloon" delay="20"/>
			<enemy name="parashut" delay="5"/>
			<enemy name="parashut" delay="9"/>
			<enemy name="parashut" delay="12"/>
			<enemy name="parashut" delay="15"/>
			<enemy name="parashut" delay="20"/>
		</wave>
		<wave pause="0" lifeTime="50" side="right" img="1">
			<enemy name="balloon" delay="1"/>
			<enemy name="balloon" delay="5"/>
			<enemy name="balloon" delay="10"/>
			<enemy name="balloon" delay="15"/>
			<enemy name="balloon" delay="20"/>
			<enemy name="parashut" delay="5"/>
			<enemy name="parashut" delay="9"/>
			<enemy name="parashut" delay="12"/>
			<enemy name="parashut" delay="15"/>
			<enemy name="parashut" delay="20"/>
		</wave>
	</group>
	<group pause="0">
		<wave pause="0" lifeTime="30" side="left" img="1">
		  	<enemy name="unit1" delay="1"/>
			<enemy name="unit2" delay="3"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit2" delay="7"/>
			<enemy name="unit1" delay="7"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit2" delay="11"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="aerostat" delay="0"/>
			<enemy name="aerostat" delay="4"/>
			<enemy name="aerostat" delay="8"/>
		</wave>
		<wave pause="0" lifeTime="30" side="right" img="1">
		  	<enemy name="unit1" delay="1"/>
			<enemy name="unit2" delay="3"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit2" delay="7"/>
			<enemy name="unit1" delay="7"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit2" delay="11"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="aerostat" delay="0"/>
			<enemy name="aerostat" delay="4"/>
			<enemy name="aerostat" delay="8"/>
		</wave>
	</group>
	<group pause="0">
		<wave pause="0" lifeTime="50" side="left" img="1">
			<enemy name="balloon" delay="1"/>
			<enemy name="balloon" delay="5"/>
			<enemy name="balloon" delay="10"/>
			<enemy name="balloon" delay="15"/>
			<enemy name="balloon" delay="20"/>
			<enemy name="aerostat" delay="0"/>
			<enemy name="aerostat" delay="4"/>
			<enemy name="aerostat" delay="8"/>
			<enemy name="aerostat" delay="16"/>
			<enemy name="aerostat" delay="20"/>
			<enemy name="aerostat" delay="24"/>
			<enemy name="aerostat" delay="28"/>
			<enemy name="car" delay="1"/>
			<enemy name="car" delay="6"/>
			<enemy name="car" delay="12"/>
		</wave>
		<wave pause="0" lifeTime="50" side="right" img="1">
			<enemy name="balloon" delay="1"/>
			<enemy name="balloon" delay="5"/>
			<enemy name="balloon" delay="10"/>
			<enemy name="balloon" delay="15"/>
			<enemy name="balloon" delay="20"/>
			<enemy name="aerostat" delay="0"/>
			<enemy name="aerostat" delay="4"/>
			<enemy name="aerostat" delay="8"/>
			<enemy name="aerostat" delay="16"/>
			<enemy name="aerostat" delay="20"/>
			<enemy name="aerostat" delay="24"/>
			<enemy name="aerostat" delay="28"/>
			<enemy name="car" delay="1"/>
			<enemy name="car" delay="6"/>
			<enemy name="car" delay="12"/>
		</wave>
	</group>
	<group pause="5">
	    <wave pause="0" lifeTime="75" side="left" img="1">
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit1" delay="6"/>
			<enemy name="unit1" delay="7"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="12"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit1" delay="17"/>
			<enemy name="unit1" delay="19"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="12"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit1" delay="17"/>
			<enemy name="unit1" delay="19"/>
			<enemy name="unit1" delay="20"/>
			<enemy name="unit1" delay="21"/>
			<enemy name="unit1" delay="22"/>
			<enemy name="unit1" delay="23"/>
			<enemy name="unit1" delay="24"/>
			<enemy name="unit1" delay="25"/>
			<enemy name="unit1" delay="26"/>
			<enemy name="unit1" delay="27"/>
			<enemy name="unit1" delay="28"/>
			<enemy name="unit1" delay="29"/>
			<enemy name="unit1" delay="30"/>
			<enemy name="unit1" delay="40"/>
			<enemy name="unit1" delay="41"/>
			<enemy name="unit1" delay="42"/>
			<enemy name="unit1" delay="43"/>
			<enemy name="unit1" delay="44"/>
			<enemy name="unit1" delay="45"/>
			<enemy name="unit1" delay="46"/>
			<enemy name="unit1" delay="47"/>
			<enemy name="unit1" delay="48"/>
			<enemy name="unit1" delay="49"/>
			<enemy name="unit1" delay="50"/>
			
			<enemy name="unit2" delay="20"/>
			<enemy name="unit2" delay="22"/>
			<enemy name="unit2" delay="24"/>
			<enemy name="unit2" delay="26"/>
			<enemy name="unit2" delay="28"/>
			<enemy name="unit2" delay="30"/>
			<enemy name="unit2" delay="32"/>
			<enemy name="unit2" delay="34"/>
			<enemy name="unit2" delay="36"/>
			<enemy name="unit2" delay="38"/>
			<enemy name="unit2" delay="40"/>
			
			<enemy name="tanket" delay="30"/>
			<enemy name="tanket" delay="34"/>
			<enemy name="tanket" delay="38"/>
			<enemy name="tanket" delay="42"/>
			<enemy name="tanket" delay="46"/>
			<enemy name="tanket" delay="50"/>
			<enemy name="tanket" delay="54"/>
			
			<enemy name="car" delay="50"/>
			<enemy name="car" delay="60"/>
			<enemy name="car" delay="65"/>
			<enemy name="car" delay="70"/>
			
			<enemy name="parashut" delay="1"/>
			<enemy name="parashut" delay="10"/>
			<enemy name="parashut" delay="20"/>
			<enemy name="parashut" delay="30"/>
			<enemy name="parashut" delay="40"/>
			<enemy name="parashut" delay="50"/>
			<enemy name="parashut" delay="60"/>
			<enemy name="parashut" delay="70"/>
    	</wave>
		<wave pause="0" lifeTime="75" side="right" img="1">
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit1" delay="6"/>
			<enemy name="unit1" delay="7"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="12"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit1" delay="17"/>
			<enemy name="unit1" delay="19"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="12"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit1" delay="17"/>
			<enemy name="unit1" delay="19"/>
			<enemy name="unit1" delay="20"/>
			<enemy name="unit1" delay="21"/>
			<enemy name="unit1" delay="22"/>
			<enemy name="unit1" delay="23"/>
			<enemy name="unit1" delay="24"/>
			<enemy name="unit1" delay="25"/>
			<enemy name="unit1" delay="26"/>
			<enemy name="unit1" delay="27"/>
			<enemy name="unit1" delay="28"/>
			<enemy name="unit1" delay="29"/>
			<enemy name="unit1" delay="30"/>
			<enemy name="unit1" delay="40"/>
			<enemy name="unit1" delay="41"/>
			<enemy name="unit1" delay="42"/>
			<enemy name="unit1" delay="43"/>
			<enemy name="unit1" delay="44"/>
			<enemy name="unit1" delay="45"/>
			<enemy name="unit1" delay="46"/>
			<enemy name="unit1" delay="47"/>
			<enemy name="unit1" delay="48"/>
			<enemy name="unit1" delay="49"/>
			<enemy name="unit1" delay="50"/>
			
			<enemy name="unit2" delay="20"/>
			<enemy name="unit2" delay="22"/>
			<enemy name="unit2" delay="24"/>
			<enemy name="unit2" delay="26"/>
			<enemy name="unit2" delay="28"/>
			<enemy name="unit2" delay="30"/>
			<enemy name="unit2" delay="32"/>
			<enemy name="unit2" delay="34"/>
			<enemy name="unit2" delay="36"/>
			<enemy name="unit2" delay="38"/>
			<enemy name="unit2" delay="40"/>
			
			<enemy name="tanket" delay="30"/>
			<enemy name="tanket" delay="34"/>
			<enemy name="tanket" delay="38"/>
			<enemy name="tanket" delay="42"/>
			<enemy name="tanket" delay="46"/>
			<enemy name="tanket" delay="50"/>
			<enemy name="tanket" delay="54"/>
			
			<enemy name="car" delay="50"/>
			<enemy name="car" delay="60"/>
			<enemy name="car" delay="65"/>
			<enemy name="car" delay="70"/>
			
			<enemy name="parashut" delay="1"/>
			<enemy name="parashut" delay="10"/>
			<enemy name="parashut" delay="20"/>
			<enemy name="parashut" delay="30"/>
			<enemy name="parashut" delay="40"/>
			<enemy name="parashut" delay="50"/>
			<enemy name="parashut" delay="60"/>
			<enemy name="parashut" delay="70"/>
    	</wave>
	</group>
	<group pause="0">
	    <wave pause="0" lifeTime="20" side="left" img="1">
			<enemy name="tank2" delay="1"/>
			<enemy name="unit2" delay="5"/>
			<enemy name="unit2" delay="6"/>
			<enemy name="unit2" delay="7"/>
			<enemy name="unit2" delay="8"/>
			<enemy name="unit2" delay="9"/>
			<enemy name="unit2" delay="10"/>
			<enemy name="tank1" delay="10"/>
    	</wave>
		<wave pause="0" lifeTime="20" side="right" img="1">
			<enemy name="tank2" delay="1"/>
			<enemy name="unit2" delay="5"/>
			<enemy name="unit2" delay="6"/>
			<enemy name="unit2" delay="7"/>
			<enemy name="unit2" delay="8"/>
			<enemy name="unit2" delay="9"/>
			<enemy name="unit2" delay="10"/>
			<enemy name="tank1" delay="10"/>
    	</wave>
	</group>
	<group pause="0">
		<wave pause="0" lifeTime="20" side="left" img="1">
		    <enemy name="airplane" delay="5"/>
			<enemy name="unit2" delay="5"/>
			<enemy name="unit2" delay="7"/>
			<enemy name="unit2" delay="9"/>
			<enemy name="unit2" delay="11"/>
			<enemy name="unit2" delay="13"/>
			<enemy name="unit2" delay="15"/>
			<enemy name="unit2" delay="17"/>
			<enemy name="unit2" delay="19"/>
			<enemy name="unit2" delay="21"/>
		</wave>
		<wave pause="0" lifeTime="20" side="right" img="1">
		    <enemy name="airplane" delay="5"/>
		    <enemy name="unit2" delay="5"/>
			<enemy name="unit2" delay="7"/>
			<enemy name="unit2" delay="9"/>
			<enemy name="unit2" delay="11"/>
			<enemy name="unit2" delay="13"/>
			<enemy name="unit2" delay="15"/>
			<enemy name="unit2" delay="17"/>
			<enemy name="unit2" delay="19"/>
			<enemy name="unit2" delay="21"/>
		</wave>
	</group>	
	<group pause="5">
		<wave pause="0" lifeTime="40" side="left" img="1">
		   <enemy name="walker1" delay="1"/>
		</wave>
		<wave pause="0" lifeTime="40" side="right" img="1">
		   <enemy name="walker1" delay="1"/>
		</wave>
	</group>
	<group pause="3">
	    <wave pause="0" lifeTime="50" side="left" img="1">
			<enemy name="heli" delay="1"/>
			<enemy name="heli" delay="4"/>
			<enemy name="heli" delay="8"/>
			<enemy name="heli" delay="12"/>
			<enemy name="heli" delay="16"/>
			<enemy name="heli" delay="20"/>
    	</wave>
		<wave pause="0" lifeTime="50" side="right" img="1">
			<enemy name="heli" delay="1"/>
			<enemy name="heli" delay="4"/>
			<enemy name="heli" delay="8"/>
			<enemy name="heli" delay="12"/>
			<enemy name="heli" delay="16"/>
			<enemy name="heli" delay="20"/>
    	</wave>
	</group>
	<group pause="5">
		<wave pause="0" lifeTime="50" side="left" img="1">
		   <enemy name="walker1" delay="1"/>
		   <enemy name="walker1" delay="20"/>
		   <enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit1" delay="6"/>
			<enemy name="unit1" delay="7"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="12"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit1" delay="17"/>
			<enemy name="unit1" delay="19"/>
			
			<enemy name="unit2" delay="20"/>
			<enemy name="unit2" delay="22"/>
			<enemy name="unit2" delay="24"/>
			<enemy name="unit2" delay="26"/>
			<enemy name="unit2" delay="28"/>
			<enemy name="unit2" delay="30"/>
			<enemy name="unit2" delay="32"/>
			<enemy name="unit2" delay="34"/>
			<enemy name="unit2" delay="36"/>
			<enemy name="unit2" delay="38"/>
			<enemy name="unit2" delay="40"/>
			
			<enemy name="balloon" delay="1"/>
			<enemy name="balloon" delay="10"/>
			<enemy name="balloon" delay="20"/>
		</wave>
		<wave pause="0" lifeTime="50" side="right" img="1">
		   <enemy name="walker1" delay="1"/>
		   <enemy name="walker1" delay="20"/>
		   <enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit1" delay="6"/>
			<enemy name="unit1" delay="7"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="12"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit1" delay="17"/>
			<enemy name="unit1" delay="19"/>
			
			<enemy name="unit2" delay="20"/>
			<enemy name="unit2" delay="22"/>
			<enemy name="unit2" delay="24"/>
			<enemy name="unit2" delay="26"/>
			<enemy name="unit2" delay="28"/>
			<enemy name="unit2" delay="30"/>
			<enemy name="unit2" delay="32"/>
			<enemy name="unit2" delay="34"/>
			<enemy name="unit2" delay="36"/>
			<enemy name="unit2" delay="38"/>
			<enemy name="unit2" delay="40"/>
			
			<enemy name="balloon" delay="1"/>
			<enemy name="balloon" delay="10"/>
			<enemy name="balloon" delay="20"/>
		</wave>
	</group>
	<group pause="5">
		<wave pause="0" lifeTime="40" side="right" img="1">
		   <enemy name="walker1" delay="1"/>
		   <enemy name="walker1" delay="5"/>
		   <enemy name="walker1" delay="10"/>
		   <enemy name="walker1" delay="15"/>
		</wave>
	</group>
	<group pause="5">
	    <wave pause="0" lifeTime="40" side="left" img="1">
		   <enemy name="walker1" delay="1"/>
		   <enemy name="tank1" delay="3"/>
		   <enemy name="tank1" delay="8"/>
		   <enemy name="walker1" delay="10"/>
		   <enemy name="tank2" delay="13"/>
		   <enemy name="tank2" delay="18"/>
		   <enemy name="walker1" delay="20"/>
		   <enemy name="aerostat" delay="1"/>
		   <enemy name="aerostat" delay="4"/>
		   <enemy name="aerostat" delay="10"/>
		   <enemy name="aerostat" delay="15"/>
		   <enemy name="aerostat" delay="20"/>
		</wave>
		<wave pause="0" lifeTime="40" side="right" img="1">
		   <enemy name="walker1" delay="1"/>
		   <enemy name="tank1" delay="3"/>
		   <enemy name="tank1" delay="8"/>
		   <enemy name="walker1" delay="10"/>
		   <enemy name="tank2" delay="13"/>
		   <enemy name="tank2" delay="18"/>
		   <enemy name="walker1" delay="20"/>
		   <enemy name="aerostat" delay="1"/>
		   <enemy name="aerostat" delay="4"/>
		   <enemy name="aerostat" delay="10"/>
		   <enemy name="aerostat" delay="15"/>
		   <enemy name="aerostat" delay="20"/>
		</wave>
	</group>
	<group pause="5">
		<wave pause="0" lifeTime="50" side="left" img="1">
		   <enemy name="tank3" delay="1"/>
		   <enemy name="walker1" delay="10"/>
		   <enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit1" delay="6"/>
			<enemy name="unit1" delay="7"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="12"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit1" delay="17"/>
			<enemy name="unit1" delay="19"/>
			<enemy name="car" delay="10"/>
			<enemy name="car" delay="15"/>
			<enemy name="car" delay="20"/>
			<enemy name="airplane" delay="5"/>
		</wave>
		<wave pause="0" lifeTime="50" side="right" img="1">
		   <enemy name="tank3" delay="1"/>
		   <enemy name="walker1" delay="10"/>
		   <enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit1" delay="6"/>
			<enemy name="unit1" delay="7"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="12"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit1" delay="17"/>
			<enemy name="unit1" delay="19"/>
			<enemy name="car" delay="10"/>
			<enemy name="car" delay="15"/>
			<enemy name="car" delay="20"/>
			<enemy name="airplane" delay="5"/>
		</wave>
	</group>
	<group pause="3">
	    <wave pause="0" lifeTime="50" side="left" img="1">
			<enemy name="walker2" delay="1"/>
    	</wave>
		<wave pause="0" lifeTime="50" side="right" img="1">
			<enemy name="walker2" delay="1"/>
    	</wave>
	</group>
</level>;
            var _loc_13:* = <level eye=""normal"" money=""48000"" maxTower=""5"" maxUpgrade=""5"" bg=""4"" upgradeTwo=""true"" threeStarHealth=""80"" twoStarHealth=""60"" preStartMoney=""3000"">
n	t<!-- 
n	t	tpreStartMoney - денег за досрочный вызов волны, может указываться у level и wave
n	t	tpause - пауза перед появлением, (секунды)
n	t	tlifeTime - время жизни волны, (секунды)
n	t	timg - картинка, иконка досрочного вызова волны
n	t	tside - сторона, откуда появится враг (left, right), - можно указывать целиком волне(wave) и также отдельным юнитам(enemy)
n	t-->
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""10"" side=""left"" img=""1"">
n	t	t	t<enemy name=""wheel"" delay=""1""/>
n	t	t	t<enemy name=""wheel"" delay=""3""/>
n	t	t	t<enemy name=""wheel"" delay=""5""/>
n	t	t	t<enemy name=""wheel"" delay=""7""/>
n	t	t	t<enemy name=""wheel"" delay=""9""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""12""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""10"" side=""right"" img=""1"">
n	t	t	t<enemy name=""wheel"" delay=""1""/>
n	t	t	t<enemy name=""wheel"" delay=""3""/>
n	t	t	t<enemy name=""wheel"" delay=""5""/>
n	t	t	t<enemy name=""wheel"" delay=""7""/>
n	t	t	t<enemy name=""wheel"" delay=""9""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""12""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""10"" side=""left"" img=""1"">
n	t	t	t<enemy name=""wheel"" delay=""1""/>
n	t	t	t<enemy name=""wheel"" delay=""2""/>
n	t	t	t<enemy name=""wheel"" delay=""3""/>
n	t	t	t<enemy name=""wheel"" delay=""4""/>
n	t	t	t<enemy name=""wheel"" delay=""5""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""10"" side=""right"" img=""1"">
n	t	t	t<enemy name=""wheel"" delay=""1""/>
n	t	t	t<enemy name=""wheel"" delay=""2""/>
n	t	t	t<enemy name=""wheel"" delay=""3""/>
n	t	t	t<enemy name=""wheel"" delay=""4""/>
n	t	t	t<enemy name=""wheel"" delay=""5""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""5"">
n	t	t<wave pause=""0"" lifeTime=""30"" side=""left"" img=""1"">
n	t	t    <enemy name=""aerostat"" delay=""0""/>
n	t	t	t<enemy name=""aerostat"" delay=""4""/>
n	t	t	t<enemy name=""aerostat"" delay=""8""/>
n	t	t	t<enemy name=""aerostat"" delay=""12""/>
n	t	t	t<enemy name=""balloon"" delay=""2""/>
n	t	t	t<enemy name=""balloon"" delay=""6""/>
n	t	t	t<enemy name=""balloon"" delay=""10""/>
n	t	t	t<enemy name=""wheel"" delay=""11""/>
n	t	t	t<enemy name=""wheel"" delay=""12""/>
n	t	t	t<enemy name=""wheel"" delay=""13""/>
n	t	t	t<enemy name=""wheel"" delay=""14""/>
n	t	t	t<enemy name=""wheel"" delay=""15""/>
n	t	t	t<enemy name=""wheel"" delay=""16""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""30"" side=""right"" img=""1"">
n	t	t    <enemy name=""aerostat"" delay=""0""/>
n	t	t	t<enemy name=""aerostat"" delay=""4""/>
n	t	t	t<enemy name=""aerostat"" delay=""8""/>
n	t	t	t<enemy name=""aerostat"" delay=""12""/>
n	t	t	t<enemy name=""balloon"" delay=""2""/>
n	t	t	t<enemy name=""balloon"" delay=""6""/>
n	t	t	t<enemy name=""balloon"" delay=""10""/>
n	t	t	t<enemy name=""wheel"" delay=""11""/>
n	t	t	t<enemy name=""wheel"" delay=""12""/>
n	t	t	t<enemy name=""wheel"" delay=""13""/>
n	t	t	t<enemy name=""wheel"" delay=""14""/>
n	t	t	t<enemy name=""wheel"" delay=""15""/>
n	t	t	t<enemy name=""wheel"" delay=""16""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""5"">
n	t	t<wave pause=""0"" lifeTime=""10"" side=""left"" img=""1"">
n	t	t    <enemy name=""tanket-line-2"" delay=""0""/>
n	t	t	t<enemy name=""tanket-line-2"" delay=""3""/>
n	t	t	t<enemy name=""tanket-line-2"" delay=""6""/>
n	t	t	t<enemy name=""tanket-line-2"" delay=""9""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""10"" side=""right"" img=""1"">
n	t	t    <enemy name=""tanket-line-2"" delay=""0""/>
n	t	t	t<enemy name=""tanket-line-2"" delay=""3""/>
n	t	t	t<enemy name=""tanket-line-2"" delay=""6""/>
n	t	t	t<enemy name=""tanket-line-2"" delay=""9""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""30"" side=""left"" img=""1"">
n	t	t    <enemy name=""parashut"" delay=""1""/>
n	t	t	t<enemy name=""parashut"" delay=""3""/>
n	t	t	t<enemy name=""parashut"" delay=""5""/>
n	t	t	t<enemy name=""parashut"" delay=""8""/>
n	t	t	t<enemy name=""parashut"" delay=""10""/>
n	t	t	t<enemy name=""parashut"" delay=""14""/>
n	t	t	t<enemy name=""parashut"" delay=""16""/>
n	t	t	t<enemy name=""parashut"" delay=""3""/>
n	t	t	t<enemy name=""parashut"" delay=""9""/>
n	t	t	t<enemy name=""parashut"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit1"" delay=""17""/>
n	t	t	t<enemy name=""wheel"" delay=""7""/>
n	t	t	t<enemy name=""wheel"" delay=""8""/>
n	t	t	t<enemy name=""wheel"" delay=""9""/>
n	t	t	t<enemy name=""wheel"" delay=""10""/>
n	t	t	t<enemy name=""wheel"" delay=""11""/>
n	t	t	t<enemy name=""wheel"" delay=""12""/>
n	t	t	t<enemy name=""wheel"" delay=""13""/>
n	t	t	t<enemy name=""wheel"" delay=""14""/>
n	t	t	t<enemy name=""wheel"" delay=""15""/>
n	t	t	t<enemy name=""wheel"" delay=""16""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""30"" side=""right"" img=""1"">
n	t	t    <enemy name=""parashut"" delay=""1""/>
n	t	t	t<enemy name=""parashut"" delay=""3""/>
n	t	t	t<enemy name=""parashut"" delay=""5""/>
n	t	t	t<enemy name=""parashut"" delay=""8""/>
n	t	t	t<enemy name=""parashut"" delay=""10""/>
n	t	t	t<enemy name=""parashut"" delay=""14""/>
n	t	t	t<enemy name=""parashut"" delay=""16""/>
n	t	t	t<enemy name=""parashut"" delay=""3""/>
n	t	t	t<enemy name=""parashut"" delay=""9""/>
n	t	t	t<enemy name=""parashut"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit1"" delay=""17""/>
n	t	t	t<enemy name=""wheel"" delay=""7""/>
n	t	t	t<enemy name=""wheel"" delay=""8""/>
n	t	t	t<enemy name=""wheel"" delay=""9""/>
n	t	t	t<enemy name=""wheel"" delay=""10""/>
n	t	t	t<enemy name=""wheel"" delay=""11""/>
n	t	t	t<enemy name=""wheel"" delay=""12""/>
n	t	t	t<enemy name=""wheel"" delay=""13""/>
n	t	t	t<enemy name=""wheel"" delay=""14""/>
n	t	t	t<enemy name=""wheel"" delay=""15""/>
n	t	t	t<enemy name=""wheel"" delay=""16""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""5"">
n	t	t<wave pause=""0"" lifeTime=""30"" side=""left"" img=""1"">
n	t	t    <enemy name=""tank1"" delay=""0""/>
n	t	t	t<enemy name=""tank1"" delay=""5""/>
n	t	t	t<enemy name=""tank1"" delay=""10""/>
n	t	t	t<enemy name=""wheel"" delay=""12""/>
n	t	t	t<enemy name=""wheel"" delay=""14""/>
n	t	t	t<enemy name=""wheel"" delay=""16""/>
n	t	t	t<enemy name=""wheel"" delay=""18""/>
n	t	t	t<enemy name=""wheel"" delay=""20""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""10"" side=""right"" img=""1"">
n	t	t    <enemy name=""tank1"" delay=""0""/>
n	t	t	t<enemy name=""tank1"" delay=""5""/>
n	t	t	t<enemy name=""tank1"" delay=""10""/>
n	t	t	t<enemy name=""wheel"" delay=""12""/>
n	t	t	t<enemy name=""wheel"" delay=""14""/>
n	t	t	t<enemy name=""wheel"" delay=""16""/>
n	t	t	t<enemy name=""wheel"" delay=""18""/>
n	t	t	t<enemy name=""wheel"" delay=""20""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""3"">
n	t	t<wave pause=""0"" lifeTime=""30"" side=""left"" img=""1"">
n	t	t	t<enemy name=""car"" delay=""0""/>
n	t	t	t<enemy name=""car"" delay=""3""/>
n	t	t	t<enemy name=""car"" delay=""6""/>
n	t	t	t<enemy name=""car"" delay=""9""/>
n	t	t	t<enemy name=""car"" delay=""12""/>
n	t	t	t<enemy name=""car"" delay=""15""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""30"" side=""right"" img=""1"">
n	t	t	t<enemy name=""aerostat"" delay=""0""/>
n	t	t	t<enemy name=""balloon"" delay=""3""/>
n	t	t	t<enemy name=""balloon"" delay=""6""/>
n	t	t	t<enemy name=""balloon"" delay=""9""/>
n	t	t	t<enemy name=""balloon"" delay=""12""/>
n	t	t	t<enemy name=""balloon"" delay=""15""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""3"">
n	t	t<wave pause=""0"" lifeTime=""30"" side=""left"" img=""1"">
n	t	t	t<enemy name=""tank1"" delay=""0""/>
n	t	t	t<enemy name=""tank1"" delay=""3""/>
n	t	t	t<enemy name=""tank2"" delay=""7""/>
n	t	t	t<enemy name=""tank1"" delay=""10""/>
n	t	t	t<enemy name=""tank1"" delay=""13""/>
n	t	t	t<enemy name=""tank2"" delay=""17""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""30"" side=""left"" img=""1"">
n	t	t    <enemy name=""aerostat"" delay=""1""/>
n	t	t	t<enemy name=""aerostat"" delay=""3""/>
n	t	t	t<enemy name=""aerostat"" delay=""5""/>
n	t	t	t<enemy name=""aerostat"" delay=""8""/>
n	t	t	t<enemy name=""aerostat"" delay=""10""/>
n	t	t	t<enemy name=""aerostat"" delay=""14""/>
n	t	t	t<enemy name=""aerostat"" delay=""16""/>
n	t	t	t<enemy name=""aerostat"" delay=""3""/>
n	t	t	t<enemy name=""aerostat"" delay=""9""/>
n	t	t	t<enemy name=""aerostat"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit1"" delay=""17""/>
n	t	t	t<enemy name=""unit1"" delay=""18""/>
n	t	t	t<enemy name=""unit1"" delay=""19""/>
n	t	t	t<enemy name=""unit1"" delay=""20""/>
n	t	t	t<enemy name=""unit1"" delay=""21""/>
n	t	t	t<enemy name=""unit1"" delay=""22""/>
n	t	t	t<enemy name=""unit1"" delay=""23""/>
n	t	t	t<enemy name=""unit1"" delay=""24""/>
n	t	t	t<enemy name=""unit1"" delay=""25""/>
n	t	t	t<enemy name=""wheel"" delay=""7""/>
n	t	t	t<enemy name=""wheel"" delay=""8""/>
n	t	t	t<enemy name=""wheel"" delay=""9""/>
n	t	t	t<enemy name=""wheel"" delay=""10""/>
n	t	t	t<enemy name=""wheel"" delay=""11""/>
n	t	t	t<enemy name=""wheel"" delay=""12""/>
n	t	t	t<enemy name=""wheel"" delay=""14""/>
n	t	t	t<enemy name=""wheel"" delay=""15""/>
n	t	t	t<enemy name=""wheel"" delay=""16""/>
n	t	t	t<enemy name=""wheel"" delay=""18""/>
n	t	t	t<enemy name=""wheel"" delay=""19""/>
n	t	t	t<enemy name=""wheel"" delay=""20""/>
n	t	t	t<enemy name=""wheel"" delay=""22""/>
n	t	t	t<enemy name=""wheel"" delay=""23""/>
n	t	t	t<enemy name=""wheel"" delay=""25""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""30"" side=""right"" img=""1"">
n	t	t    <enemy name=""aerostat"" delay=""1""/>
n	t	t	t<enemy name=""aerostat"" delay=""3""/>
n	t	t	t<enemy name=""aerostat"" delay=""5""/>
n	t	t	t<enemy name=""aerostat"" delay=""8""/>
n	t	t	t<enemy name=""aerostat"" delay=""10""/>
n	t	t	t<enemy name=""aerostat"" delay=""14""/>
n	t	t	t<enemy name=""aerostat"" delay=""16""/>
n	t	t	t<enemy name=""aerostat"" delay=""3""/>
n	t	t	t<enemy name=""aerostat"" delay=""9""/>
n	t	t	t<enemy name=""aerostat"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit1"" delay=""17""/>
n	t	t	t<enemy name=""unit1"" delay=""18""/>
n	t	t	t<enemy name=""unit1"" delay=""19""/>
n	t	t	t<enemy name=""unit1"" delay=""20""/>
n	t	t	t<enemy name=""unit1"" delay=""21""/>
n	t	t	t<enemy name=""unit1"" delay=""22""/>
n	t	t	t<enemy name=""unit1"" delay=""23""/>
n	t	t	t<enemy name=""unit1"" delay=""24""/>
n	t	t	t<enemy name=""unit1"" delay=""25""/>
n	t	t	t<enemy name=""wheel"" delay=""7""/>
n	t	t	t<enemy name=""wheel"" delay=""8""/>
n	t	t	t<enemy name=""wheel"" delay=""9""/>
n	t	t	t<enemy name=""wheel"" delay=""10""/>
n	t	t	t<enemy name=""wheel"" delay=""11""/>
n	t	t	t<enemy name=""wheel"" delay=""12""/>
n	t	t	t<enemy name=""wheel"" delay=""14""/>
n	t	t	t<enemy name=""wheel"" delay=""15""/>
n	t	t	t<enemy name=""wheel"" delay=""16""/>
n	t	t	t<enemy name=""wheel"" delay=""18""/>
n	t	t	t<enemy name=""wheel"" delay=""19""/>
n	t	t	t<enemy name=""wheel"" delay=""20""/>
n	t	t	t<enemy name=""wheel"" delay=""22""/>
n	t	t	t<enemy name=""wheel"" delay=""23""/>
n	t	t	t<enemy name=""wheel"" delay=""25""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""3"">
n	t	t<wave pause=""0"" lifeTime=""50"" side=""left"" img=""1"">
n	t	t	t<enemy name=""tank1"" delay=""0""/>
n	t	t	t<enemy name=""tank1"" delay=""3""/>
n	t	t	t<enemy name=""tank2"" delay=""7""/>
n	t	t	t<enemy name=""tank1"" delay=""10""/>
n	t	t	t<enemy name=""tank1"" delay=""13""/>
n	t	t	t<enemy name=""tank2"" delay=""17""/>
n	t	t	t<enemy name=""wheel"" delay=""18""/>
n	t	t	t<enemy name=""wheel"" delay=""19""/>
n	t	t	t<enemy name=""wheel"" delay=""20""/>
n	t	t	t<enemy name=""wheel"" delay=""22""/>
n	t	t	t<enemy name=""wheel"" delay=""23""/>
n	t	t	t<enemy name=""wheel"" delay=""25""/>
n	t	t	t<enemy name=""parashut"" delay=""1""/>
n	t	t	t<enemy name=""parashut"" delay=""3""/>
n	t	t	t<enemy name=""parashut"" delay=""5""/>
n	t	t	t<enemy name=""parashut"" delay=""8""/>
n	t	t	t<enemy name=""parashut"" delay=""10""/>
n	t	t	t<enemy name=""parashut"" delay=""14""/>
n	t	t	t<enemy name=""parashut"" delay=""16""/>
n	t	t	t<enemy name=""parashut"" delay=""3""/>
n	t	t	t<enemy name=""parashut"" delay=""9""/>
n	t	t	t<enemy name=""parashut"" delay=""14""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""30"" side=""right"" img=""1"">
n	t	t	t<enemy name=""tank1"" delay=""0""/>
n	t	t	t<enemy name=""tank1"" delay=""3""/>
n	t	t	t<enemy name=""tank2"" delay=""7""/>
n	t	t	t<enemy name=""tank1"" delay=""10""/>
n	t	t	t<enemy name=""tank1"" delay=""13""/>
n	t	t	t<enemy name=""tank2"" delay=""17""/>
n	t	t	t<enemy name=""wheel"" delay=""18""/>
n	t	t	t<enemy name=""wheel"" delay=""19""/>
n	t	t	t<enemy name=""wheel"" delay=""20""/>
n	t	t	t<enemy name=""wheel"" delay=""22""/>
n	t	t	t<enemy name=""wheel"" delay=""23""/>
n	t	t	t<enemy name=""wheel"" delay=""25""/>
n	t	t	t<enemy name=""parashut"" delay=""1""/>
n	t	t	t<enemy name=""parashut"" delay=""3""/>
n	t	t	t<enemy name=""parashut"" delay=""5""/>
n	t	t	t<enemy name=""parashut"" delay=""8""/>
n	t	t	t<enemy name=""parashut"" delay=""10""/>
n	t	t	t<enemy name=""parashut"" delay=""14""/>
n	t	t	t<enemy name=""parashut"" delay=""16""/>
n	t	t	t<enemy name=""parashut"" delay=""3""/>
n	t	t	t<enemy name=""parashut"" delay=""9""/>
n	t	t	t<enemy name=""parashut"" delay=""14""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""3"">
n	t	t<wave pause=""0"" lifeTime=""30"" side=""left"" img=""1"">
n	t	t	t<enemy name=""walker1"" delay=""0""/>
n	t	t	t<enemy name=""walker1"" delay=""5""/>
n	t	t	t<enemy name=""walker1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit1"" delay=""17""/>
n	t	t	t<enemy name=""unit1"" delay=""18""/>
n	t	t	t<enemy name=""unit1"" delay=""19""/>
n	t	t	t<enemy name=""unit1"" delay=""20""/>
n	t	t	t<enemy name=""unit1"" delay=""21""/>
n	t	t	t<enemy name=""unit1"" delay=""22""/>
n	t	t	t<enemy name=""unit1"" delay=""23""/>
n	t	t	t<enemy name=""unit1"" delay=""24""/>
n	t	t	t<enemy name=""unit1"" delay=""25""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""30"" side=""right"" img=""1"">
n	t	t	t<enemy name=""walker1"" delay=""0""/>
n	t	t	t<enemy name=""walker1"" delay=""5""/>
n	t	t	t<enemy name=""walker1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit1"" delay=""17""/>
n	t	t	t<enemy name=""unit1"" delay=""18""/>
n	t	t	t<enemy name=""unit1"" delay=""19""/>
n	t	t	t<enemy name=""unit1"" delay=""20""/>
n	t	t	t<enemy name=""unit1"" delay=""21""/>
n	t	t	t<enemy name=""unit1"" delay=""22""/>
n	t	t	t<enemy name=""unit1"" delay=""23""/>
n	t	t	t<enemy name=""unit1"" delay=""24""/>
n	t	t	t<enemy name=""unit1"" delay=""25""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""8"">
n	t	t<wave pause=""0"" lifeTime=""70"" side=""left"" img=""1"">
n	t	t	t<enemy name=""wheel"" delay=""0""/>
n	t	t	t<enemy name=""wheel"" delay=""3""/>
n	t	t	t<enemy name=""wheel"" delay=""6""/>
n	t	t	t<enemy name=""wheel"" delay=""10""/>
n	t	t	t<enemy name=""wheel"" delay=""20""/>
n	t	t	t<enemy name=""wheel"" delay=""30""/>
n	t	t	t<enemy name=""wheel"" delay=""40""/>
n	t	t	t<enemy name=""wheel"" delay=""50""/>
n	t	t	t<enemy name=""wheel"" delay=""60""/>
n	t	t	t<enemy name=""wheel"" delay=""70""/>
n	t	t	t
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""6""/>
n	t	t	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""12""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit1"" delay=""17""/>
n	t	t	t<enemy name=""unit1"" delay=""19""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""12""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit1"" delay=""17""/>
n	t	t	t<enemy name=""unit1"" delay=""19""/>
n	t	t	t<enemy name=""unit1"" delay=""20""/>
n	t	t	t<enemy name=""unit1"" delay=""21""/>
n	t	t	t<enemy name=""unit1"" delay=""22""/>
n	t	t	t<enemy name=""unit1"" delay=""23""/>
n	t	t	t<enemy name=""unit1"" delay=""24""/>
n	t	t	t<enemy name=""unit1"" delay=""25""/>
n	t	t	t<enemy name=""unit1"" delay=""26""/>
n	t	t	t<enemy name=""unit1"" delay=""27""/>
n	t	t	t<enemy name=""unit1"" delay=""28""/>
n	t	t	t<enemy name=""unit1"" delay=""29""/>
n	t	t	t<enemy name=""unit1"" delay=""30""/>
n	t	t	t<enemy name=""unit1"" delay=""40""/>
n	t	t	t<enemy name=""unit1"" delay=""41""/>
n	t	t	t<enemy name=""unit1"" delay=""42""/>
n	t	t	t<enemy name=""unit1"" delay=""43""/>
n	t	t	t<enemy name=""unit1"" delay=""44""/>
n	t	t	t<enemy name=""unit1"" delay=""45""/>
n	t	t	t<enemy name=""unit1"" delay=""46""/>
n	t	t	t<enemy name=""unit1"" delay=""47""/>
n	t	t	t<enemy name=""unit1"" delay=""48""/>
n	t	t	t<enemy name=""unit1"" delay=""49""/>
n	t	t	t<enemy name=""unit1"" delay=""50""/>
n	t	t	t
n	t	t	t<enemy name=""unit2"" delay=""20""/>
n	t	t	t<enemy name=""unit2"" delay=""22""/>
n	t	t	t<enemy name=""unit2"" delay=""24""/>
n	t	t	t<enemy name=""unit2"" delay=""26""/>
n	t	t	t<enemy name=""unit2"" delay=""28""/>
n	t	t	t<enemy name=""unit2"" delay=""30""/>
n	t	t	t<enemy name=""unit2"" delay=""32""/>
n	t	t	t<enemy name=""unit2"" delay=""34""/>
n	t	t	t<enemy name=""unit2"" delay=""36""/>
n	t	t	t<enemy name=""unit2"" delay=""38""/>
n	t	t	t<enemy name=""unit2"" delay=""40""/>
n	t	t	t<enemy name=""unit2"" delay=""42""/>
n	t	t	t<enemy name=""unit2"" delay=""44""/>
n	t	t	t<enemy name=""unit2"" delay=""46""/>
n	t	t	t<enemy name=""unit2"" delay=""48""/>
n	t	t	t<enemy name=""unit2"" delay=""50""/>
n	t	t	t<enemy name=""unit2"" delay=""52""/>
n	t	t	t<enemy name=""unit2"" delay=""54""/>
n	t	t	t<enemy name=""unit2"" delay=""56""/>
n	t	t	t<enemy name=""unit2"" delay=""58""/>
n	t	t	t<enemy name=""unit2"" delay=""60""/>
n	t	t	t<enemy name=""unit2"" delay=""62""/>
n	t	t	t<enemy name=""unit2"" delay=""64""/>
n	t	t	t<enemy name=""unit2"" delay=""66""/>
n	t	t	t<enemy name=""unit2"" delay=""68""/>
n	t	t	t
n	t	t	t<enemy name=""balloon"" delay=""40""/>
n	t	t	t<enemy name=""balloon"" delay=""44""/>
n	t	t	t<enemy name=""balloon"" delay=""48""/>
n	t	t	t<enemy name=""balloon"" delay=""52""/>
n	t	t	t<enemy name=""aerostat"" delay=""54""/>
n	t	t	t<enemy name=""aerostat"" delay=""56""/>
n	t	t	t<enemy name=""aerostat"" delay=""58""/>
n	t	t	t<enemy name=""aerostat"" delay=""60""/>
n	t	t	t
n	t	t	t<enemy name=""parashut"" delay=""61""/>
n	t	t	t<enemy name=""parashut"" delay=""62""/>
n	t	t	t<enemy name=""parashut"" delay=""63""/>
n	t	t	t<enemy name=""parashut"" delay=""64""/>
n	t	t	t<enemy name=""parashut"" delay=""65""/>
n	t	t	t<enemy name=""parashut"" delay=""66""/>
n	t	t	t<enemy name=""parashut"" delay=""67""/>
n	t	t	t<enemy name=""parashut"" delay=""68""/>
n	t	t	t<enemy name=""parashut"" delay=""69""/>
n	t	t	t<enemy name=""parashut"" delay=""70""/>
n	t	t	t<enemy name=""parashut"" delay=""71""/>
n	t	t	t<enemy name=""parashut"" delay=""72""/>
n	t	t	t<enemy name=""parashut"" delay=""73""/>
n	t	t	t<enemy name=""parashut"" delay=""74""/>
n	t	t	t<enemy name=""parashut"" delay=""75""/>
n	t	t	t<enemy name=""parashut"" delay=""76""/>
n	t	t	t<enemy name=""parashut"" delay=""77""/>
n	t	t	t<enemy name=""parashut"" delay=""78""/>
n	t	t	t<enemy name=""parashut"" delay=""79""/>
n	t	t	t<enemy name=""parashut"" delay=""80""/>
n	t	t	t
n	t	t	t<enemy name=""walker1"" delay=""30""/>
n	t	t	t<enemy name=""walker1"" delay=""50""/>
n	t	t	t
n	t	t	t<enemy name=""tank2"" delay=""20""/>
n	t	t	t<enemy name=""tank2"" delay=""40""/>
n	t	t	t<enemy name=""tank2"" delay=""60""/>
n	t	t	t<enemy name=""tank2"" delay=""65""/>
n	t	t	t
n	t	t	t<enemy name=""walker2"" delay=""70""/>
n	t	t	t
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""70"" side=""right"" img=""1"">
n	t	t	t<enemy name=""wheel"" delay=""0""/>
n	t	t	t<enemy name=""wheel"" delay=""3""/>
n	t	t	t<enemy name=""wheel"" delay=""6""/>
n	t	t	t<enemy name=""wheel"" delay=""10""/>
n	t	t	t<enemy name=""wheel"" delay=""20""/>
n	t	t	t<enemy name=""wheel"" delay=""30""/>
n	t	t	t<enemy name=""wheel"" delay=""40""/>
n	t	t	t<enemy name=""wheel"" delay=""50""/>
n	t	t	t<enemy name=""wheel"" delay=""60""/>
n	t	t	t<enemy name=""wheel"" delay=""70""/>
n	t	t	t
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""6""/>
n	t	t	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""12""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit1"" delay=""17""/>
n	t	t	t<enemy name=""unit1"" delay=""19""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""12""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit1"" delay=""17""/>
n	t	t	t<enemy name=""unit1"" delay=""19""/>
n	t	t	t<enemy name=""unit1"" delay=""20""/>
n	t	t	t<enemy name=""unit1"" delay=""21""/>
n	t	t	t<enemy name=""unit1"" delay=""22""/>
n	t	t	t<enemy name=""unit1"" delay=""23""/>
n	t	t	t<enemy name=""unit1"" delay=""24""/>
n	t	t	t<enemy name=""unit1"" delay=""25""/>
n	t	t	t<enemy name=""unit1"" delay=""26""/>
n	t	t	t<enemy name=""unit1"" delay=""27""/>
n	t	t	t<enemy name=""unit1"" delay=""28""/>
n	t	t	t<enemy name=""unit1"" delay=""29""/>
n	t	t	t<enemy name=""unit1"" delay=""30""/>
n	t	t	t<enemy name=""unit1"" delay=""40""/>
n	t	t	t<enemy name=""unit1"" delay=""41""/>
n	t	t	t<enemy name=""unit1"" delay=""42""/>
n	t	t	t<enemy name=""unit1"" delay=""43""/>
n	t	t	t<enemy name=""unit1"" delay=""44""/>
n	t	t	t<enemy name=""unit1"" delay=""45""/>
n	t	t	t<enemy name=""unit1"" delay=""46""/>
n	t	t	t<enemy name=""unit1"" delay=""47""/>
n	t	t	t<enemy name=""unit1"" delay=""48""/>
n	t	t	t<enemy name=""unit1"" delay=""49""/>
n	t	t	t<enemy name=""unit1"" delay=""50""/>
n	t	t	t
n	t	t	t<enemy name=""unit2"" delay=""20""/>
n	t	t	t<enemy name=""unit2"" delay=""22""/>
n	t	t	t<enemy name=""unit2"" delay=""24""/>
n	t	t	t<enemy name=""unit2"" delay=""26""/>
n	t	t	t<enemy name=""unit2"" delay=""28""/>
n	t	t	t<enemy name=""unit2"" delay=""30""/>
n	t	t	t<enemy name=""unit2"" delay=""32""/>
n	t	t	t<enemy name=""unit2"" delay=""34""/>
n	t	t	t<enemy name=""unit2"" delay=""36""/>
n	t	t	t<enemy name=""unit2"" delay=""38""/>
n	t	t	t<enemy name=""unit2"" delay=""40""/>
n	t	t	t<enemy name=""unit2"" delay=""42""/>
n	t	t	t<enemy name=""unit2"" delay=""44""/>
n	t	t	t<enemy name=""unit2"" delay=""46""/>
n	t	t	t<enemy name=""unit2"" delay=""48""/>
n	t	t	t<enemy name=""unit2"" delay=""50""/>
n	t	t	t<enemy name=""unit2"" delay=""52""/>
n	t	t	t<enemy name=""unit2"" delay=""54""/>
n	t	t	t<enemy name=""unit2"" delay=""56""/>
n	t	t	t<enemy name=""unit2"" delay=""58""/>
n	t	t	t<enemy name=""unit2"" delay=""60""/>
n	t	t	t<enemy name=""unit2"" delay=""62""/>
n	t	t	t<enemy name=""unit2"" delay=""64""/>
n	t	t	t<enemy name=""unit2"" delay=""66""/>
n	t	t	t<enemy name=""unit2"" delay=""68""/>
n	t	t	t
n	t	t	t<enemy name=""balloon"" delay=""40""/>
n	t	t	t<enemy name=""balloon"" delay=""44""/>
n	t	t	t<enemy name=""balloon"" delay=""48""/>
n	t	t	t<enemy name=""balloon"" delay=""52""/>
n	t	t	t<enemy name=""aerostat"" delay=""54""/>
n	t	t	t<enemy name=""aerostat"" delay=""56""/>
n	t	t	t<enemy name=""aerostat"" delay=""58""/>
n	t	t	t<enemy name=""aerostat"" delay=""60""/>
n	t	t	t
n	t	t	t<enemy name=""parashut"" delay=""61""/>
n	t	t	t<enemy name=""parashut"" delay=""62""/>
n	t	t	t<enemy name=""parashut"" delay=""63""/>
n	t	t	t<enemy name=""parashut"" delay=""64""/>
n	t	t	t<enemy name=""parashut"" delay=""65""/>
n	t	t	t<enemy name=""parashut"" delay=""66""/>
n	t	t	t<enemy name=""parashut"" delay=""67""/>
n	t	t	t<enemy name=""parashut"" delay=""68""/>
n	t	t	t<enemy name=""parashut"" delay=""69""/>
n	t	t	t<enemy name=""parashut"" delay=""70""/>
n	t	t	t<enemy name=""parashut"" delay=""71""/>
n	t	t	t<enemy name=""parashut"" delay=""72""/>
n	t	t	t<enemy name=""parashut"" delay=""73""/>
n	t	t	t<enemy name=""parashut"" delay=""74""/>
n	t	t	t<enemy name=""parashut"" delay=""75""/>
n	t	t	t<enemy name=""parashut"" delay=""76""/>
n	t	t	t<enemy name=""parashut"" delay=""77""/>
n	t	t	t<enemy name=""parashut"" delay=""78""/>
n	t	t	t<enemy name=""parashut"" delay=""79""/>
n	t	t	t<enemy name=""parashut"" delay=""80""/>
n	t	t	t
n	t	t	t<enemy name=""walker1"" delay=""30""/>
n	t	t	t<enemy name=""walker1"" delay=""50""/>
n	t	t	t
n	t	t	t<enemy name=""tank2"" delay=""20""/>
n	t	t	t<enemy name=""tank2"" delay=""40""/>
n	t	t	t<enemy name=""tank2"" delay=""60""/>
n	t	t	t<enemy name=""tank2"" delay=""65""/>
n	t	t	t
n	t	t	t<enemy name=""walker2"" delay=""70""/>
n	t	t</wave>
n	t</group>
n</level>")("<level eye="normal" money="48000" maxTower="5" maxUpgrade="5" bg="4" upgradeTwo="true" threeStarHealth="80" twoStarHealth="60" preStartMoney="3000">
	<!-- 
		preStartMoney - денег за досрочный вызов волны, может указываться у level и wave
		pause - пауза перед появлением, (секунды)
		lifeTime - время жизни волны, (секунды)
		img - картинка, иконка досрочного вызова волны
		side - сторона, откуда появится враг (left, right), - можно указывать целиком волне(wave) и также отдельным юнитам(enemy)
	-->
	<group pause="0">
		<wave pause="0" lifeTime="10" side="left" img="1">
			<enemy name="wheel" delay="1"/>
			<enemy name="wheel" delay="3"/>
			<enemy name="wheel" delay="5"/>
			<enemy name="wheel" delay="7"/>
			<enemy name="wheel" delay="9"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="12"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="16"/>
		</wave>
		<wave pause="0" lifeTime="10" side="right" img="1">
			<enemy name="wheel" delay="1"/>
			<enemy name="wheel" delay="3"/>
			<enemy name="wheel" delay="5"/>
			<enemy name="wheel" delay="7"/>
			<enemy name="wheel" delay="9"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="12"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="16"/>
		</wave>
	</group>
	<group pause="0">
		<wave pause="0" lifeTime="10" side="left" img="1">
			<enemy name="wheel" delay="1"/>
			<enemy name="wheel" delay="2"/>
			<enemy name="wheel" delay="3"/>
			<enemy name="wheel" delay="4"/>
			<enemy name="wheel" delay="5"/>
		</wave>
		<wave pause="0" lifeTime="10" side="right" img="1">
			<enemy name="wheel" delay="1"/>
			<enemy name="wheel" delay="2"/>
			<enemy name="wheel" delay="3"/>
			<enemy name="wheel" delay="4"/>
			<enemy name="wheel" delay="5"/>
		</wave>
	</group>
	<group pause="5">
		<wave pause="0" lifeTime="30" side="left" img="1">
		    <enemy name="aerostat" delay="0"/>
			<enemy name="aerostat" delay="4"/>
			<enemy name="aerostat" delay="8"/>
			<enemy name="aerostat" delay="12"/>
			<enemy name="balloon" delay="2"/>
			<enemy name="balloon" delay="6"/>
			<enemy name="balloon" delay="10"/>
			<enemy name="wheel" delay="11"/>
			<enemy name="wheel" delay="12"/>
			<enemy name="wheel" delay="13"/>
			<enemy name="wheel" delay="14"/>
			<enemy name="wheel" delay="15"/>
			<enemy name="wheel" delay="16"/>
		</wave>
		<wave pause="0" lifeTime="30" side="right" img="1">
		    <enemy name="aerostat" delay="0"/>
			<enemy name="aerostat" delay="4"/>
			<enemy name="aerostat" delay="8"/>
			<enemy name="aerostat" delay="12"/>
			<enemy name="balloon" delay="2"/>
			<enemy name="balloon" delay="6"/>
			<enemy name="balloon" delay="10"/>
			<enemy name="wheel" delay="11"/>
			<enemy name="wheel" delay="12"/>
			<enemy name="wheel" delay="13"/>
			<enemy name="wheel" delay="14"/>
			<enemy name="wheel" delay="15"/>
			<enemy name="wheel" delay="16"/>
		</wave>
	</group>
	<group pause="5">
		<wave pause="0" lifeTime="10" side="left" img="1">
		    <enemy name="tanket-line-2" delay="0"/>
			<enemy name="tanket-line-2" delay="3"/>
			<enemy name="tanket-line-2" delay="6"/>
			<enemy name="tanket-line-2" delay="9"/>
		</wave>
		<wave pause="0" lifeTime="10" side="right" img="1">
		    <enemy name="tanket-line-2" delay="0"/>
			<enemy name="tanket-line-2" delay="3"/>
			<enemy name="tanket-line-2" delay="6"/>
			<enemy name="tanket-line-2" delay="9"/>
		</wave>
	</group>
	<group pause="0">
		<wave pause="0" lifeTime="30" side="left" img="1">
		    <enemy name="parashut" delay="1"/>
			<enemy name="parashut" delay="3"/>
			<enemy name="parashut" delay="5"/>
			<enemy name="parashut" delay="8"/>
			<enemy name="parashut" delay="10"/>
			<enemy name="parashut" delay="14"/>
			<enemy name="parashut" delay="16"/>
			<enemy name="parashut" delay="3"/>
			<enemy name="parashut" delay="9"/>
			<enemy name="parashut" delay="14"/>
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit1" delay="7"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit1" delay="17"/>
			<enemy name="wheel" delay="7"/>
			<enemy name="wheel" delay="8"/>
			<enemy name="wheel" delay="9"/>
			<enemy name="wheel" delay="10"/>
			<enemy name="wheel" delay="11"/>
			<enemy name="wheel" delay="12"/>
			<enemy name="wheel" delay="13"/>
			<enemy name="wheel" delay="14"/>
			<enemy name="wheel" delay="15"/>
			<enemy name="wheel" delay="16"/>
		</wave>
		<wave pause="0" lifeTime="30" side="right" img="1">
		    <enemy name="parashut" delay="1"/>
			<enemy name="parashut" delay="3"/>
			<enemy name="parashut" delay="5"/>
			<enemy name="parashut" delay="8"/>
			<enemy name="parashut" delay="10"/>
			<enemy name="parashut" delay="14"/>
			<enemy name="parashut" delay="16"/>
			<enemy name="parashut" delay="3"/>
			<enemy name="parashut" delay="9"/>
			<enemy name="parashut" delay="14"/>
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit1" delay="7"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit1" delay="17"/>
			<enemy name="wheel" delay="7"/>
			<enemy name="wheel" delay="8"/>
			<enemy name="wheel" delay="9"/>
			<enemy name="wheel" delay="10"/>
			<enemy name="wheel" delay="11"/>
			<enemy name="wheel" delay="12"/>
			<enemy name="wheel" delay="13"/>
			<enemy name="wheel" delay="14"/>
			<enemy name="wheel" delay="15"/>
			<enemy name="wheel" delay="16"/>
		</wave>
	</group>
	<group pause="5">
		<wave pause="0" lifeTime="30" side="left" img="1">
		    <enemy name="tank1" delay="0"/>
			<enemy name="tank1" delay="5"/>
			<enemy name="tank1" delay="10"/>
			<enemy name="wheel" delay="12"/>
			<enemy name="wheel" delay="14"/>
			<enemy name="wheel" delay="16"/>
			<enemy name="wheel" delay="18"/>
			<enemy name="wheel" delay="20"/>
		</wave>
		<wave pause="0" lifeTime="10" side="right" img="1">
		    <enemy name="tank1" delay="0"/>
			<enemy name="tank1" delay="5"/>
			<enemy name="tank1" delay="10"/>
			<enemy name="wheel" delay="12"/>
			<enemy name="wheel" delay="14"/>
			<enemy name="wheel" delay="16"/>
			<enemy name="wheel" delay="18"/>
			<enemy name="wheel" delay="20"/>
		</wave>
	</group>
	<group pause="3">
		<wave pause="0" lifeTime="30" side="left" img="1">
			<enemy name="car" delay="0"/>
			<enemy name="car" delay="3"/>
			<enemy name="car" delay="6"/>
			<enemy name="car" delay="9"/>
			<enemy name="car" delay="12"/>
			<enemy name="car" delay="15"/>
		</wave>
		<wave pause="0" lifeTime="30" side="right" img="1">
			<enemy name="aerostat" delay="0"/>
			<enemy name="balloon" delay="3"/>
			<enemy name="balloon" delay="6"/>
			<enemy name="balloon" delay="9"/>
			<enemy name="balloon" delay="12"/>
			<enemy name="balloon" delay="15"/>
		</wave>
	</group>
	<group pause="3">
		<wave pause="0" lifeTime="30" side="left" img="1">
			<enemy name="tank1" delay="0"/>
			<enemy name="tank1" delay="3"/>
			<enemy name="tank2" delay="7"/>
			<enemy name="tank1" delay="10"/>
			<enemy name="tank1" delay="13"/>
			<enemy name="tank2" delay="17"/>
		</wave>
	</group>
	<group pause="0">
		<wave pause="0" lifeTime="30" side="left" img="1">
		    <enemy name="aerostat" delay="1"/>
			<enemy name="aerostat" delay="3"/>
			<enemy name="aerostat" delay="5"/>
			<enemy name="aerostat" delay="8"/>
			<enemy name="aerostat" delay="10"/>
			<enemy name="aerostat" delay="14"/>
			<enemy name="aerostat" delay="16"/>
			<enemy name="aerostat" delay="3"/>
			<enemy name="aerostat" delay="9"/>
			<enemy name="aerostat" delay="14"/>
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit1" delay="7"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit1" delay="17"/>
			<enemy name="unit1" delay="18"/>
			<enemy name="unit1" delay="19"/>
			<enemy name="unit1" delay="20"/>
			<enemy name="unit1" delay="21"/>
			<enemy name="unit1" delay="22"/>
			<enemy name="unit1" delay="23"/>
			<enemy name="unit1" delay="24"/>
			<enemy name="unit1" delay="25"/>
			<enemy name="wheel" delay="7"/>
			<enemy name="wheel" delay="8"/>
			<enemy name="wheel" delay="9"/>
			<enemy name="wheel" delay="10"/>
			<enemy name="wheel" delay="11"/>
			<enemy name="wheel" delay="12"/>
			<enemy name="wheel" delay="14"/>
			<enemy name="wheel" delay="15"/>
			<enemy name="wheel" delay="16"/>
			<enemy name="wheel" delay="18"/>
			<enemy name="wheel" delay="19"/>
			<enemy name="wheel" delay="20"/>
			<enemy name="wheel" delay="22"/>
			<enemy name="wheel" delay="23"/>
			<enemy name="wheel" delay="25"/>
		</wave>
		<wave pause="0" lifeTime="30" side="right" img="1">
		    <enemy name="aerostat" delay="1"/>
			<enemy name="aerostat" delay="3"/>
			<enemy name="aerostat" delay="5"/>
			<enemy name="aerostat" delay="8"/>
			<enemy name="aerostat" delay="10"/>
			<enemy name="aerostat" delay="14"/>
			<enemy name="aerostat" delay="16"/>
			<enemy name="aerostat" delay="3"/>
			<enemy name="aerostat" delay="9"/>
			<enemy name="aerostat" delay="14"/>
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit1" delay="7"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit1" delay="17"/>
			<enemy name="unit1" delay="18"/>
			<enemy name="unit1" delay="19"/>
			<enemy name="unit1" delay="20"/>
			<enemy name="unit1" delay="21"/>
			<enemy name="unit1" delay="22"/>
			<enemy name="unit1" delay="23"/>
			<enemy name="unit1" delay="24"/>
			<enemy name="unit1" delay="25"/>
			<enemy name="wheel" delay="7"/>
			<enemy name="wheel" delay="8"/>
			<enemy name="wheel" delay="9"/>
			<enemy name="wheel" delay="10"/>
			<enemy name="wheel" delay="11"/>
			<enemy name="wheel" delay="12"/>
			<enemy name="wheel" delay="14"/>
			<enemy name="wheel" delay="15"/>
			<enemy name="wheel" delay="16"/>
			<enemy name="wheel" delay="18"/>
			<enemy name="wheel" delay="19"/>
			<enemy name="wheel" delay="20"/>
			<enemy name="wheel" delay="22"/>
			<enemy name="wheel" delay="23"/>
			<enemy name="wheel" delay="25"/>
		</wave>
	</group>
	<group pause="3">
		<wave pause="0" lifeTime="50" side="left" img="1">
			<enemy name="tank1" delay="0"/>
			<enemy name="tank1" delay="3"/>
			<enemy name="tank2" delay="7"/>
			<enemy name="tank1" delay="10"/>
			<enemy name="tank1" delay="13"/>
			<enemy name="tank2" delay="17"/>
			<enemy name="wheel" delay="18"/>
			<enemy name="wheel" delay="19"/>
			<enemy name="wheel" delay="20"/>
			<enemy name="wheel" delay="22"/>
			<enemy name="wheel" delay="23"/>
			<enemy name="wheel" delay="25"/>
			<enemy name="parashut" delay="1"/>
			<enemy name="parashut" delay="3"/>
			<enemy name="parashut" delay="5"/>
			<enemy name="parashut" delay="8"/>
			<enemy name="parashut" delay="10"/>
			<enemy name="parashut" delay="14"/>
			<enemy name="parashut" delay="16"/>
			<enemy name="parashut" delay="3"/>
			<enemy name="parashut" delay="9"/>
			<enemy name="parashut" delay="14"/>
		</wave>
		<wave pause="0" lifeTime="30" side="right" img="1">
			<enemy name="tank1" delay="0"/>
			<enemy name="tank1" delay="3"/>
			<enemy name="tank2" delay="7"/>
			<enemy name="tank1" delay="10"/>
			<enemy name="tank1" delay="13"/>
			<enemy name="tank2" delay="17"/>
			<enemy name="wheel" delay="18"/>
			<enemy name="wheel" delay="19"/>
			<enemy name="wheel" delay="20"/>
			<enemy name="wheel" delay="22"/>
			<enemy name="wheel" delay="23"/>
			<enemy name="wheel" delay="25"/>
			<enemy name="parashut" delay="1"/>
			<enemy name="parashut" delay="3"/>
			<enemy name="parashut" delay="5"/>
			<enemy name="parashut" delay="8"/>
			<enemy name="parashut" delay="10"/>
			<enemy name="parashut" delay="14"/>
			<enemy name="parashut" delay="16"/>
			<enemy name="parashut" delay="3"/>
			<enemy name="parashut" delay="9"/>
			<enemy name="parashut" delay="14"/>
		</wave>
	</group>
	<group pause="3">
		<wave pause="0" lifeTime="30" side="left" img="1">
			<enemy name="walker1" delay="0"/>
			<enemy name="walker1" delay="5"/>
			<enemy name="walker1" delay="10"/>
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit1" delay="7"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit1" delay="17"/>
			<enemy name="unit1" delay="18"/>
			<enemy name="unit1" delay="19"/>
			<enemy name="unit1" delay="20"/>
			<enemy name="unit1" delay="21"/>
			<enemy name="unit1" delay="22"/>
			<enemy name="unit1" delay="23"/>
			<enemy name="unit1" delay="24"/>
			<enemy name="unit1" delay="25"/>
		</wave>
		<wave pause="0" lifeTime="30" side="right" img="1">
			<enemy name="walker1" delay="0"/>
			<enemy name="walker1" delay="5"/>
			<enemy name="walker1" delay="10"/>
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit1" delay="7"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit1" delay="17"/>
			<enemy name="unit1" delay="18"/>
			<enemy name="unit1" delay="19"/>
			<enemy name="unit1" delay="20"/>
			<enemy name="unit1" delay="21"/>
			<enemy name="unit1" delay="22"/>
			<enemy name="unit1" delay="23"/>
			<enemy name="unit1" delay="24"/>
			<enemy name="unit1" delay="25"/>
		</wave>
	</group>
	<group pause="8">
		<wave pause="0" lifeTime="70" side="left" img="1">
			<enemy name="wheel" delay="0"/>
			<enemy name="wheel" delay="3"/>
			<enemy name="wheel" delay="6"/>
			<enemy name="wheel" delay="10"/>
			<enemy name="wheel" delay="20"/>
			<enemy name="wheel" delay="30"/>
			<enemy name="wheel" delay="40"/>
			<enemy name="wheel" delay="50"/>
			<enemy name="wheel" delay="60"/>
			<enemy name="wheel" delay="70"/>
			
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit1" delay="6"/>
			<enemy name="unit1" delay="7"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="12"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit1" delay="17"/>
			<enemy name="unit1" delay="19"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="12"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit1" delay="17"/>
			<enemy name="unit1" delay="19"/>
			<enemy name="unit1" delay="20"/>
			<enemy name="unit1" delay="21"/>
			<enemy name="unit1" delay="22"/>
			<enemy name="unit1" delay="23"/>
			<enemy name="unit1" delay="24"/>
			<enemy name="unit1" delay="25"/>
			<enemy name="unit1" delay="26"/>
			<enemy name="unit1" delay="27"/>
			<enemy name="unit1" delay="28"/>
			<enemy name="unit1" delay="29"/>
			<enemy name="unit1" delay="30"/>
			<enemy name="unit1" delay="40"/>
			<enemy name="unit1" delay="41"/>
			<enemy name="unit1" delay="42"/>
			<enemy name="unit1" delay="43"/>
			<enemy name="unit1" delay="44"/>
			<enemy name="unit1" delay="45"/>
			<enemy name="unit1" delay="46"/>
			<enemy name="unit1" delay="47"/>
			<enemy name="unit1" delay="48"/>
			<enemy name="unit1" delay="49"/>
			<enemy name="unit1" delay="50"/>
			
			<enemy name="unit2" delay="20"/>
			<enemy name="unit2" delay="22"/>
			<enemy name="unit2" delay="24"/>
			<enemy name="unit2" delay="26"/>
			<enemy name="unit2" delay="28"/>
			<enemy name="unit2" delay="30"/>
			<enemy name="unit2" delay="32"/>
			<enemy name="unit2" delay="34"/>
			<enemy name="unit2" delay="36"/>
			<enemy name="unit2" delay="38"/>
			<enemy name="unit2" delay="40"/>
			<enemy name="unit2" delay="42"/>
			<enemy name="unit2" delay="44"/>
			<enemy name="unit2" delay="46"/>
			<enemy name="unit2" delay="48"/>
			<enemy name="unit2" delay="50"/>
			<enemy name="unit2" delay="52"/>
			<enemy name="unit2" delay="54"/>
			<enemy name="unit2" delay="56"/>
			<enemy name="unit2" delay="58"/>
			<enemy name="unit2" delay="60"/>
			<enemy name="unit2" delay="62"/>
			<enemy name="unit2" delay="64"/>
			<enemy name="unit2" delay="66"/>
			<enemy name="unit2" delay="68"/>
			
			<enemy name="balloon" delay="40"/>
			<enemy name="balloon" delay="44"/>
			<enemy name="balloon" delay="48"/>
			<enemy name="balloon" delay="52"/>
			<enemy name="aerostat" delay="54"/>
			<enemy name="aerostat" delay="56"/>
			<enemy name="aerostat" delay="58"/>
			<enemy name="aerostat" delay="60"/>
			
			<enemy name="parashut" delay="61"/>
			<enemy name="parashut" delay="62"/>
			<enemy name="parashut" delay="63"/>
			<enemy name="parashut" delay="64"/>
			<enemy name="parashut" delay="65"/>
			<enemy name="parashut" delay="66"/>
			<enemy name="parashut" delay="67"/>
			<enemy name="parashut" delay="68"/>
			<enemy name="parashut" delay="69"/>
			<enemy name="parashut" delay="70"/>
			<enemy name="parashut" delay="71"/>
			<enemy name="parashut" delay="72"/>
			<enemy name="parashut" delay="73"/>
			<enemy name="parashut" delay="74"/>
			<enemy name="parashut" delay="75"/>
			<enemy name="parashut" delay="76"/>
			<enemy name="parashut" delay="77"/>
			<enemy name="parashut" delay="78"/>
			<enemy name="parashut" delay="79"/>
			<enemy name="parashut" delay="80"/>
			
			<enemy name="walker1" delay="30"/>
			<enemy name="walker1" delay="50"/>
			
			<enemy name="tank2" delay="20"/>
			<enemy name="tank2" delay="40"/>
			<enemy name="tank2" delay="60"/>
			<enemy name="tank2" delay="65"/>
			
			<enemy name="walker2" delay="70"/>
			
		</wave>
		<wave pause="0" lifeTime="70" side="right" img="1">
			<enemy name="wheel" delay="0"/>
			<enemy name="wheel" delay="3"/>
			<enemy name="wheel" delay="6"/>
			<enemy name="wheel" delay="10"/>
			<enemy name="wheel" delay="20"/>
			<enemy name="wheel" delay="30"/>
			<enemy name="wheel" delay="40"/>
			<enemy name="wheel" delay="50"/>
			<enemy name="wheel" delay="60"/>
			<enemy name="wheel" delay="70"/>
			
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit1" delay="6"/>
			<enemy name="unit1" delay="7"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="12"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit1" delay="17"/>
			<enemy name="unit1" delay="19"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="12"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit1" delay="17"/>
			<enemy name="unit1" delay="19"/>
			<enemy name="unit1" delay="20"/>
			<enemy name="unit1" delay="21"/>
			<enemy name="unit1" delay="22"/>
			<enemy name="unit1" delay="23"/>
			<enemy name="unit1" delay="24"/>
			<enemy name="unit1" delay="25"/>
			<enemy name="unit1" delay="26"/>
			<enemy name="unit1" delay="27"/>
			<enemy name="unit1" delay="28"/>
			<enemy name="unit1" delay="29"/>
			<enemy name="unit1" delay="30"/>
			<enemy name="unit1" delay="40"/>
			<enemy name="unit1" delay="41"/>
			<enemy name="unit1" delay="42"/>
			<enemy name="unit1" delay="43"/>
			<enemy name="unit1" delay="44"/>
			<enemy name="unit1" delay="45"/>
			<enemy name="unit1" delay="46"/>
			<enemy name="unit1" delay="47"/>
			<enemy name="unit1" delay="48"/>
			<enemy name="unit1" delay="49"/>
			<enemy name="unit1" delay="50"/>
			
			<enemy name="unit2" delay="20"/>
			<enemy name="unit2" delay="22"/>
			<enemy name="unit2" delay="24"/>
			<enemy name="unit2" delay="26"/>
			<enemy name="unit2" delay="28"/>
			<enemy name="unit2" delay="30"/>
			<enemy name="unit2" delay="32"/>
			<enemy name="unit2" delay="34"/>
			<enemy name="unit2" delay="36"/>
			<enemy name="unit2" delay="38"/>
			<enemy name="unit2" delay="40"/>
			<enemy name="unit2" delay="42"/>
			<enemy name="unit2" delay="44"/>
			<enemy name="unit2" delay="46"/>
			<enemy name="unit2" delay="48"/>
			<enemy name="unit2" delay="50"/>
			<enemy name="unit2" delay="52"/>
			<enemy name="unit2" delay="54"/>
			<enemy name="unit2" delay="56"/>
			<enemy name="unit2" delay="58"/>
			<enemy name="unit2" delay="60"/>
			<enemy name="unit2" delay="62"/>
			<enemy name="unit2" delay="64"/>
			<enemy name="unit2" delay="66"/>
			<enemy name="unit2" delay="68"/>
			
			<enemy name="balloon" delay="40"/>
			<enemy name="balloon" delay="44"/>
			<enemy name="balloon" delay="48"/>
			<enemy name="balloon" delay="52"/>
			<enemy name="aerostat" delay="54"/>
			<enemy name="aerostat" delay="56"/>
			<enemy name="aerostat" delay="58"/>
			<enemy name="aerostat" delay="60"/>
			
			<enemy name="parashut" delay="61"/>
			<enemy name="parashut" delay="62"/>
			<enemy name="parashut" delay="63"/>
			<enemy name="parashut" delay="64"/>
			<enemy name="parashut" delay="65"/>
			<enemy name="parashut" delay="66"/>
			<enemy name="parashut" delay="67"/>
			<enemy name="parashut" delay="68"/>
			<enemy name="parashut" delay="69"/>
			<enemy name="parashut" delay="70"/>
			<enemy name="parashut" delay="71"/>
			<enemy name="parashut" delay="72"/>
			<enemy name="parashut" delay="73"/>
			<enemy name="parashut" delay="74"/>
			<enemy name="parashut" delay="75"/>
			<enemy name="parashut" delay="76"/>
			<enemy name="parashut" delay="77"/>
			<enemy name="parashut" delay="78"/>
			<enemy name="parashut" delay="79"/>
			<enemy name="parashut" delay="80"/>
			
			<enemy name="walker1" delay="30"/>
			<enemy name="walker1" delay="50"/>
			
			<enemy name="tank2" delay="20"/>
			<enemy name="tank2" delay="40"/>
			<enemy name="tank2" delay="60"/>
			<enemy name="tank2" delay="65"/>
			
			<enemy name="walker2" delay="70"/>
		</wave>
	</group>
</level>;
            var _loc_14:* = <level eye=""normal"" money=""56000"" maxTower=""5"" maxUpgrade=""5"" bg=""5"" upgradeTwo=""true"" threeStarHealth=""80"" twoStarHealth=""60"" preStartMoney=""3000"">
n	t<!-- 
n	t	tpreStartMoney - денег за досрочный вызов волны, может указываться у level и wave
n	t	tpause - пауза перед появлением, (секунды)
n	t	tlifeTime - время жизни волны, (секунды)
n	t	timg - картинка, иконка досрочного вызова волны
n	t	tside - сторона, откуда появится враг (left, right), - можно указывать целиком волне(wave) и также отдельным юнитам(enemy)
n	t-->
n<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""30"" side=""left"" img=""1"">
n	t	t    <enemy name=""balloon"" delay=""1""/>
n	t	t	t<enemy name=""balloon"" delay=""5""/>
n	t	t	t<enemy name=""balloon"" delay=""10""/>
n	t	t	t<enemy name=""balloon"" delay=""15""/>
n	t	t	t<enemy name=""balloon"" delay=""20""/>
n	t	t	t<enemy name=""parashut"" delay=""1""/>
n	t	t	t<enemy name=""parashut"" delay=""3""/>
n	t	t	t<enemy name=""parashut"" delay=""5""/>
n	t	t	t<enemy name=""parashut"" delay=""7""/>
n	t	t	t<enemy name=""parashut"" delay=""9""/>
n	t	t	t<enemy name=""parashut"" delay=""11""/>
n	t	t	t<enemy name=""parashut"" delay=""13""/>
n	t	t	t<enemy name=""parashut"" delay=""15""/>
n	t	t	t<enemy name=""parashut"" delay=""16""/>
n	t	t	t<enemy name=""parashut"" delay=""17""/>
n	t	t	t<enemy name=""parashut"" delay=""18""/>
n	t	t	t<enemy name=""parashut"" delay=""19""/>
n	t	t	t<enemy name=""parashut"" delay=""20""/>
n	t	t	t
n	t	t	t<enemy name=""tanket"" delay=""0""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""30"" side=""right"" img=""1"">
n	t	t    <enemy name=""balloon"" delay=""1""/>
n	t	t	t<enemy name=""balloon"" delay=""5""/>
n	t	t	t<enemy name=""balloon"" delay=""10""/>
n	t	t	t<enemy name=""balloon"" delay=""15""/>
n	t	t	t<enemy name=""balloon"" delay=""20""/>
n            <enemy name=""parashut"" delay=""1""/>
n	t	t	t<enemy name=""parashut"" delay=""3""/>
n	t	t	t<enemy name=""parashut"" delay=""5""/>
n	t	t	t<enemy name=""parashut"" delay=""7""/>
n	t	t	t<enemy name=""parashut"" delay=""9""/>
n	t	t	t<enemy name=""parashut"" delay=""11""/>
n	t	t	t<enemy name=""parashut"" delay=""13""/>
n	t	t	t<enemy name=""parashut"" delay=""15""/>
n	t	t	t<enemy name=""parashut"" delay=""16""/>
n	t	t	t<enemy name=""parashut"" delay=""17""/>
n	t	t	t<enemy name=""parashut"" delay=""18""/>
n	t	t	t<enemy name=""parashut"" delay=""19""/>
n	t	t	t<enemy name=""parashut"" delay=""20""/>
n	t	t	t
n	t	t	t<enemy name=""tanket"" delay=""20""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""3"">
n	t<wave pause=""0"" lifeTime=""10"" side=""left"" img=""1"">
n	t	t    <enemy name=""heli"" delay=""1""/>
n	t	t	t<enemy name=""heli"" delay=""5""/>
n	t	t	t<enemy name=""heli"" delay=""10""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""10"" side=""right"" img=""1"">
n	t	t    <enemy name=""heli"" delay=""1""/>
n	t	t	t<enemy name=""heli"" delay=""5""/>
n	t	t	t<enemy name=""heli"" delay=""10""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""10"" side=""left"" img=""1"">
n	t	t    <enemy name=""car"" delay=""1""/>
n	t	t	t<enemy name=""car"" delay=""5""/>
n	t	t	t<enemy name=""car"" delay=""10""/>
n	t	t	t<enemy name=""car"" delay=""15""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""10"" side=""right"" img=""1"">
n	t	t    <enemy name=""car"" delay=""1""/>
n	t	t	t<enemy name=""car"" delay=""5""/>
n	t	t	t<enemy name=""car"" delay=""10""/>
n	t	t	t<enemy name=""car"" delay=""15""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""3"">
n	t	t<wave pause=""0"" lifeTime=""20"" side=""left"" img=""1"">
n	t	t    <enemy name=""unit2"" delay=""0""/>
n	t	t    <enemy name=""unit2"" delay=""1""/>
n	t	t    <enemy name=""unit2"" delay=""2""/>
n	t	t    <enemy name=""unit2"" delay=""3""/>
n	t	t    <enemy name=""unit2"" delay=""4""/>
n	t	t    <enemy name=""unit2"" delay=""5""/>
n	t	t	t<enemy name=""airplane"" delay=""1""/>
n	t	t	t<enemy name=""airplane"" delay=""5""/>
n	t	t	t<enemy name=""airplane"" delay=""8""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""20"" side=""right"" img=""1"">
n	t	t    <enemy name=""unit2"" delay=""0""/>
n	t	t    <enemy name=""unit2"" delay=""1""/>
n	t	t    <enemy name=""unit2"" delay=""2""/>
n	t	t    <enemy name=""unit2"" delay=""3""/>
n	t	t    <enemy name=""unit2"" delay=""4""/>
n	t	t    <enemy name=""unit2"" delay=""5""/>
n	t	t	t<enemy name=""airplane"" delay=""1""/>
n	t	t	t<enemy name=""airplane"" delay=""5""/>
n	t	t	t<enemy name=""airplane"" delay=""8""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""3"">
n	t	t<wave pause=""0"" lifeTime=""50"" side=""left"" img=""1"">
n	t	t    <enemy name=""heli"" delay=""1""/>
n	t	t	t<enemy name=""heli"" delay=""5""/>
n	t	t	t<enemy name=""heli"" delay=""10""/>
n	t	t	t<enemy name=""heli"" delay=""15""/>
n	t	t	t<enemy name=""heli"" delay=""20""/>
n	t	t	t<enemy name=""parashut"" delay=""1""/>
n	t	t	t<enemy name=""parashut"" delay=""3""/>
n	t	t	t<enemy name=""parashut"" delay=""5""/>
n	t	t	t<enemy name=""parashut"" delay=""7""/>
n	t	t	t<enemy name=""parashut"" delay=""9""/>
n	t	t	t<enemy name=""parashut"" delay=""11""/>
n	t	t	t<enemy name=""parashut"" delay=""13""/>
n	t	t	t<enemy name=""parashut"" delay=""15""/>
n	t	t	t
n	t	t	t<enemy name=""unit2"" delay=""0""/>
n	t	t    <enemy name=""unit2"" delay=""2""/>
n	t	t    <enemy name=""unit2"" delay=""4""/>
n	t	t    <enemy name=""unit2"" delay=""6""/>
n	t	t    <enemy name=""unit2"" delay=""8""/>
n	t	t    <enemy name=""unit2"" delay=""10""/>
n	t	t    <enemy name=""unit2"" delay=""12""/>
n	t	t    <enemy name=""unit2"" delay=""14""/>
n	t	t    <enemy name=""unit2"" delay=""16""/>
n	t	t    <enemy name=""unit2"" delay=""18""/>
n	t	t    <enemy name=""unit2"" delay=""20""/>
n	t	t	t<enemy name=""unit2"" delay=""22""/>
n	t	t    <enemy name=""unit2"" delay=""24""/>
n	t	t    <enemy name=""unit2"" delay=""26""/>
n	t	t    <enemy name=""unit2"" delay=""28""/>
n	t	t    <enemy name=""unit2"" delay=""30""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""50"" side=""right"" img=""1"">
n	t	t    <enemy name=""heli"" delay=""1""/>
n	t	t	t<enemy name=""heli"" delay=""5""/>
n	t	t	t<enemy name=""heli"" delay=""10""/>
n	t	t	t<enemy name=""heli"" delay=""15""/>
n	t	t	t<enemy name=""heli"" delay=""20""/>
n	t	t	t<enemy name=""parashut"" delay=""1""/>
n	t	t	t<enemy name=""parashut"" delay=""3""/>
n	t	t	t<enemy name=""parashut"" delay=""5""/>
n	t	t	t<enemy name=""parashut"" delay=""7""/>
n	t	t	t<enemy name=""parashut"" delay=""9""/>
n	t	t	t<enemy name=""parashut"" delay=""11""/>
n	t	t	t<enemy name=""parashut"" delay=""13""/>
n	t	t	t<enemy name=""parashut"" delay=""15""/>
n	t	t	t<enemy name=""unit2"" delay=""0""/>
n	t	t    <enemy name=""unit2"" delay=""2""/>
n	t	t    <enemy name=""unit2"" delay=""4""/>
n	t	t    <enemy name=""unit2"" delay=""6""/>
n	t	t    <enemy name=""unit2"" delay=""8""/>
n	t	t    <enemy name=""unit2"" delay=""10""/>
n	t	t    <enemy name=""unit2"" delay=""12""/>
n	t	t    <enemy name=""unit2"" delay=""14""/>
n	t	t    <enemy name=""unit2"" delay=""16""/>
n	t	t    <enemy name=""unit2"" delay=""18""/>
n	t	t    <enemy name=""unit2"" delay=""20""/>
n	t	t    <enemy name=""unit2"" delay=""22""/>
n	t	t    <enemy name=""unit2"" delay=""24""/>
n	t	t    <enemy name=""unit2"" delay=""26""/>
n	t	t    <enemy name=""unit2"" delay=""28""/>
n	t	t    <enemy name=""unit2"" delay=""30""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""3"">
n	t	t<wave pause=""0"" lifeTime=""30"" side=""left"" img=""1"">
n	t	t    <enemy name=""tank3"" delay=""1""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""3"">
n	t<wave pause=""0"" lifeTime=""30"" side=""left"" img=""1"">
n	t	t    <enemy name=""heli"" delay=""1""/>
n	t	t	t<enemy name=""heli"" delay=""4""/>
n	t	t	t<enemy name=""heli"" delay=""8""/>
n	t	t	t<enemy name=""heli"" delay=""16""/>
n	t	t	t<enemy name=""heli"" delay=""20""/>
n	t	t    <enemy name=""aerostat"" delay=""5""/>
n	t	t    <enemy name=""aerostat"" delay=""10""/>
n	t	t    <enemy name=""aerostat"" delay=""15""/>
n	t	t	t
n	t	t	t <enemy name=""tank2"" delay=""5""/>
n	t	t	t <enemy name=""tank2"" delay=""10""/>
n	t	t	t <enemy name=""tank2"" delay=""15""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""30"" side=""right"" img=""1"">
n	t	t     <enemy name=""heli"" delay=""1""/>
n	t	t	t<enemy name=""heli"" delay=""4""/>
n	t	t	t<enemy name=""heli"" delay=""8""/>
n	t	t	t<enemy name=""heli"" delay=""16""/>
n	t	t	t<enemy name=""heli"" delay=""20""/>
n	t	t    <enemy name=""aerostat"" delay=""5""/>
n	t	t    <enemy name=""aerostat"" delay=""10""/>
n	t	t    <enemy name=""aerostat"" delay=""15""/>
n	t	t	t
n	t	t	t <enemy name=""tank2"" delay=""5""/>
n	t	t	t <enemy name=""tank2"" delay=""10""/>
n	t	t	t <enemy name=""tank2"" delay=""15""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""5"">
n	t<wave pause=""0"" lifeTime=""40"" side=""left"" img=""1"">
n	t	t    <enemy name=""heli"" delay=""1""/>
n	t	t	t<enemy name=""heli"" delay=""3""/>
n	t	t	t<enemy name=""heli"" delay=""6""/>
n	t	t	t<enemy name=""heli"" delay=""9""/>
n	t	t	t<enemy name=""heli"" delay=""12""/>
n	t	t	t<enemy name=""heli"" delay=""15""/>
n	t	t	t<enemy name=""heli"" delay=""18""/>
n	t	t	t<enemy name=""heli"" delay=""21""/>
n	t	t	t<enemy name=""heli"" delay=""24""/>
n	t	t	t<enemy name=""heli"" delay=""27""/>
n	t	t	t<enemy name=""heli"" delay=""30""/>
n	t	t	t
n	t	t	t<enemy name=""unit2"" delay=""0""/>
n	t	t    <enemy name=""unit2"" delay=""2""/>
n	t	t    <enemy name=""unit2"" delay=""4""/>
n	t	t    <enemy name=""unit2"" delay=""6""/>
n	t	t    <enemy name=""unit2"" delay=""8""/>
n	t	t    <enemy name=""unit2"" delay=""10""/>
n	t	t    <enemy name=""unit2"" delay=""12""/>
n	t	t    <enemy name=""unit2"" delay=""14""/>
n	t	t    <enemy name=""unit2"" delay=""16""/>
n	t	t    <enemy name=""unit2"" delay=""18""/>
n	t	t    <enemy name=""unit2"" delay=""22""/>
n	t	t    <enemy name=""unit2"" delay=""24""/>
n	t	t    <enemy name=""unit2"" delay=""26""/>
n	t	t    <enemy name=""unit2"" delay=""28""/>
n	t	t    <enemy name=""unit2"" delay=""30""/>
n	t	t	t<enemy name=""unit2"" delay=""0""/>
n	t	t    <enemy name=""unit2"" delay=""2""/>
n	t	t    <enemy name=""unit2"" delay=""4""/>
n	t	t    <enemy name=""unit2"" delay=""6""/>
n	t	t    <enemy name=""unit2"" delay=""8""/>
n	t	t    <enemy name=""unit2"" delay=""10""/>
n	t	t    <enemy name=""unit2"" delay=""12""/>
n	t	t    <enemy name=""unit2"" delay=""14""/>
n	t	t    <enemy name=""unit2"" delay=""16""/>
n	t	t    <enemy name=""unit2"" delay=""18""/>
n	t	t    <enemy name=""unit2"" delay=""22""/>
n	t	t    <enemy name=""unit2"" delay=""24""/>
n	t	t    <enemy name=""unit2"" delay=""26""/>
n	t	t    <enemy name=""unit2"" delay=""28""/>
n	t	t    <enemy name=""unit2"" delay=""30""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""40"" side=""right"" img=""1"">
n	t	t    <enemy name=""heli"" delay=""1""/>
n	t	t	t<enemy name=""heli"" delay=""3""/>
n	t	t	t<enemy name=""heli"" delay=""6""/>
n	t	t	t<enemy name=""heli"" delay=""9""/>
n	t	t	t<enemy name=""heli"" delay=""12""/>
n	t	t	t<enemy name=""heli"" delay=""15""/>
n	t	t	t<enemy name=""heli"" delay=""18""/>
n	t	t	t<enemy name=""heli"" delay=""21""/>
n	t	t	t<enemy name=""heli"" delay=""24""/>
n	t	t	t<enemy name=""heli"" delay=""27""/>
n	t	t	t<enemy name=""heli"" delay=""30""/>
n	t	t	t
n	t	t	t<enemy name=""unit2"" delay=""0""/>
n	t	t    <enemy name=""unit2"" delay=""2""/>
n	t	t    <enemy name=""unit2"" delay=""4""/>
n	t	t    <enemy name=""unit2"" delay=""6""/>
n	t	t    <enemy name=""unit2"" delay=""8""/>
n	t	t    <enemy name=""unit2"" delay=""10""/>
n	t	t    <enemy name=""unit2"" delay=""12""/>
n	t	t    <enemy name=""unit2"" delay=""14""/>
n	t	t    <enemy name=""unit2"" delay=""16""/>
n	t	t    <enemy name=""unit2"" delay=""18""/>
n	t	t    <enemy name=""unit2"" delay=""22""/>
n	t	t    <enemy name=""unit2"" delay=""24""/>
n	t	t    <enemy name=""unit2"" delay=""26""/>
n	t	t    <enemy name=""unit2"" delay=""28""/>
n	t	t    <enemy name=""unit2"" delay=""30""/>
n	t	t	t<enemy name=""unit2"" delay=""0""/>
n	t	t    <enemy name=""unit2"" delay=""2""/>
n	t	t    <enemy name=""unit2"" delay=""4""/>
n	t	t    <enemy name=""unit2"" delay=""6""/>
n	t	t    <enemy name=""unit2"" delay=""8""/>
n	t	t    <enemy name=""unit2"" delay=""10""/>
n	t	t    <enemy name=""unit2"" delay=""12""/>
n	t	t    <enemy name=""unit2"" delay=""14""/>
n	t	t    <enemy name=""unit2"" delay=""16""/>
n	t	t    <enemy name=""unit2"" delay=""18""/>
n	t	t    <enemy name=""unit2"" delay=""22""/>
n	t	t    <enemy name=""unit2"" delay=""24""/>
n	t	t    <enemy name=""unit2"" delay=""26""/>
n	t	t    <enemy name=""unit2"" delay=""28""/>
n	t	t    <enemy name=""unit2"" delay=""30""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""3"">
n	t<wave pause=""0"" lifeTime=""30"" side=""left"" img=""1"">
n	t	t    <enemy name=""aerostat"" delay=""1""/>
n	t	t	t<enemy name=""aerostat"" delay=""4""/>
n	t	t	t<enemy name=""aerostat"" delay=""8""/>
n	t	t	t<enemy name=""aerostat"" delay=""16""/>
n	t	t	t<enemy name=""aerostat"" delay=""20""/>
n	t	t	t
n	t	t	t<enemy name=""parashut"" delay=""1""/>
n	t	t	t<enemy name=""parashut"" delay=""3""/>
n	t	t	t<enemy name=""parashut"" delay=""5""/>
n	t	t	t<enemy name=""parashut"" delay=""7""/>
n	t	t	t<enemy name=""parashut"" delay=""9""/>
n	t	t	t<enemy name=""parashut"" delay=""11""/>
n	t	t	t<enemy name=""parashut"" delay=""13""/>
n	t	t	t<enemy name=""parashut"" delay=""15""/>
n	t	t	t
n	t	t	t <enemy name=""tank3"" delay=""1""/>
n
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""30"" side=""right"" img=""1"">
n	t	t    <enemy name=""aerostat"" delay=""1""/>
n	t	t	t<enemy name=""aerostat"" delay=""4""/>
n	t	t	t<enemy name=""aerostat"" delay=""8""/>
n	t	t	t<enemy name=""aerostat"" delay=""16""/>
n	t	t	t
n	t	t	t<enemy name=""parashut"" delay=""1""/>
n	t	t	t<enemy name=""parashut"" delay=""3""/>
n	t	t	t<enemy name=""parashut"" delay=""5""/>
n	t	t	t<enemy name=""parashut"" delay=""7""/>
n	t	t	t<enemy name=""parashut"" delay=""9""/>
n	t	t	t<enemy name=""parashut"" delay=""11""/>
n	t	t	t<enemy name=""parashut"" delay=""13""/>
n	t	t	t<enemy name=""parashut"" delay=""15""/>
n	t	t	t
n	t	t	t<enemy name=""tank3"" delay=""1""/>
n	t	t</wave>
n	t</group>
n	t
n	t
n	t<group pause=""5"">
n	t	t<wave pause=""0"" lifeTime=""30"" side=""left"" img=""1"">
n	t	t	t<enemy name=""airplane"" delay=""1""/>
n	t	t	t<enemy name=""airplane"" delay=""3""/>
n	t	t	t<enemy name=""airplane"" delay=""5""/>
n	t	t	t<enemy name=""airplane"" delay=""8""/>
n	t	t	t<enemy name=""airplane"" delay=""10""/>
n	t	t	t
n	t	t	t<enemy name=""car"" delay=""2""/>
n	t	t	t<enemy name=""car"" delay=""3""/>
n	t	t	t<enemy name=""car"" delay=""4""/>
n	t	t	t<enemy name=""car"" delay=""5""/>
n	t	t	t<enemy name=""car"" delay=""6""/>
n	t      
n	t	t    <enemy name=""walker1"" delay=""1""/>
n	t	t	t<enemy name=""walker1"" delay=""10""/>
n	t	t	t<enemy name=""walker1"" delay=""15""/>
n	t	t	t
n	t	t	t<enemy name=""car"" delay=""16""/>
n	t	t	t<enemy name=""car"" delay=""17""/>
n	t	t	t<enemy name=""car"" delay=""18""/>
n	t	t	t<enemy name=""car"" delay=""19""/>
n	t	t	t<enemy name=""car"" delay=""20""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""10"" side=""right"" img=""1"">
n	t	t<enemy name=""airplane"" delay=""1""/>
n	t	t	t<enemy name=""airplane"" delay=""3""/>
n	t	t	t<enemy name=""airplane"" delay=""5""/>
n	t	t	t<enemy name=""airplane"" delay=""8""/>
n	t	t	t<enemy name=""airplane"" delay=""10""/>
n	t	t	t
n	t	t	t<enemy name=""car"" delay=""2""/>
n	t	t	t<enemy name=""car"" delay=""3""/>
n	t	t	t<enemy name=""car"" delay=""4""/>
n	t	t	t<enemy name=""car"" delay=""5""/>
n	t	t	t<enemy name=""car"" delay=""6""/>
n	t      
n	t	t    <enemy name=""walker1"" delay=""1""/>
n	t	t	t<enemy name=""walker1"" delay=""10""/>
n	t	t	t<enemy name=""walker1"" delay=""15""/>
n	t	t	t
n	t	t	t<enemy name=""car"" delay=""16""/>
n	t	t	t<enemy name=""car"" delay=""17""/>
n	t	t	t<enemy name=""car"" delay=""18""/>
n	t	t	t<enemy name=""car"" delay=""19""/>
n	t	t	t<enemy name=""car"" delay=""20""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""5"">
n	t<wave pause=""0"" lifeTime=""30"" side=""left"" img=""1"">
n	t	t    <enemy name=""balloon"" delay=""1""/>
n	t	t	t<enemy name=""balloon"" delay=""4""/>
n	t	t	t<enemy name=""balloon"" delay=""8""/>
n	t	t	t<enemy name=""balloon"" delay=""16""/>
n	t	t	t<enemy name=""balloon"" delay=""20""/>
n	t	t	t
n	t	t	t<enemy name=""tank3"" delay=""1""/>
n	t	t	t<enemy name=""tank3"" delay=""5""/>
n	t	t	t<enemy name=""tank3"" delay=""10""/>
n	t	t	t<enemy name=""walker1"" delay=""15""/>
n
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""30"" side=""right"" img=""1"">
n	t	t	t<enemy name=""balloon"" delay=""1""/>
n	t	t	t<enemy name=""balloon"" delay=""4""/>
n	t	t	t<enemy name=""balloon"" delay=""8""/>
n	t	t	t<enemy name=""balloon"" delay=""16""/>
n	t	t	t<enemy name=""balloon"" delay=""20""/>
n	t	t	t
n	t	t	t<enemy name=""tank3"" delay=""1""/>
n	t	t	t<enemy name=""tank3"" delay=""5""/>
n	t	t	t<enemy name=""tank3"" delay=""10""/>
n	t	t	t<enemy name=""walker1"" delay=""15""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""5"">
n	t    <wave pause=""0"" lifeTime=""40"" side=""left"" img=""1"">
n	t	t    <enemy name=""car"" delay=""1""/>
n	t	t	t<enemy name=""car"" delay=""4""/>
n	t	t	t<enemy name=""car"" delay=""8""/>
n	t	t	t<enemy name=""car"" delay=""16""/>
n	t	t	t<enemy name=""car"" delay=""20""/>
n	t	t	t
n	t	t	t<enemy name=""tank1"" delay=""10""/>
n	t	t	t<enemy name=""tank1"" delay=""14""/>
n	t	t	t<enemy name=""tank1"" delay=""18""/>
n	t	t	t
n	t	t	t<enemy name=""tank2"" delay=""22""/>
n	t	t	t<enemy name=""tank2"" delay=""26""/>
n	t	t	t<enemy name=""tank2"" delay=""30""/>
n	t	t	t
n	t	t	t<enemy name=""heli"" delay=""1""/>
n	t	t	t<enemy name=""heli"" delay=""3""/>
n	t	t	t<enemy name=""heli"" delay=""6""/>
n	t	t	t<enemy name=""heli"" delay=""9""/>
n	t	t	t<enemy name=""heli"" delay=""12""/>
n	t	t	t<enemy name=""heli"" delay=""15""/>
n	t	t	t<enemy name=""heli"" delay=""18""/>
n	t	t	t<enemy name=""heli"" delay=""21""/>
n	t	t	t<enemy name=""heli"" delay=""24""/>
n	t	t	t<enemy name=""heli"" delay=""27""/>
n	t	t	t<enemy name=""heli"" delay=""30""/>
n	t	t	t<enemy name=""heli"" delay=""21""/>
n	t	t	t<enemy name=""heli"" delay=""24""/>
n	t	t	t<enemy name=""heli"" delay=""27""/>
n	t	t	t<enemy name=""heli"" delay=""30""/>
n	t	t	t
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""40"" side=""right"" img=""1"">
n	t	t<enemy name=""car"" delay=""1""/>
n	t	t	t<enemy name=""car"" delay=""4""/>
n	t	t	t<enemy name=""car"" delay=""8""/>
n	t	t	t<enemy name=""car"" delay=""16""/>
n	t	t	t<enemy name=""car"" delay=""20""/>
n	t	t	t
n	t	t	t<enemy name=""tank1"" delay=""10""/>
n	t	t	t<enemy name=""tank1"" delay=""14""/>
n	t	t	t<enemy name=""tank1"" delay=""18""/>
n	t	t	t
n	t	t	t<enemy name=""tank2"" delay=""22""/>
n	t	t	t<enemy name=""tank2"" delay=""26""/>
n	t	t	t<enemy name=""tank2"" delay=""30""/>
n	t	t	t
n	t	t	t<enemy name=""heli"" delay=""1""/>
n	t	t	t<enemy name=""heli"" delay=""3""/>
n	t	t	t<enemy name=""heli"" delay=""6""/>
n	t	t	t<enemy name=""heli"" delay=""9""/>
n	t	t	t<enemy name=""heli"" delay=""12""/>
n	t	t	t<enemy name=""heli"" delay=""15""/>
n	t	t	t<enemy name=""heli"" delay=""18""/>
n	t	t	t<enemy name=""heli"" delay=""21""/>
n	t	t	t<enemy name=""heli"" delay=""24""/>
n	t	t	t<enemy name=""heli"" delay=""27""/>
n	t	t	t<enemy name=""heli"" delay=""30""/>
n	t	t	t<enemy name=""heli"" delay=""21""/>
n	t	t	t<enemy name=""heli"" delay=""24""/>
n	t	t	t<enemy name=""heli"" delay=""27""/>
n	t	t	t<enemy name=""heli"" delay=""30""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""5"">
n	t	t<wave pause=""0"" lifeTime=""50"" side=""left"" img=""1"">
n	t	t    <enemy name=""airship"" delay=""1""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""50"" side=""right"" img=""1"">
n	t	t    <enemy name=""airship"" delay=""1""/>
n	t	t</wave>
n	t</group>
n</level>")("<level eye="normal" money="56000" maxTower="5" maxUpgrade="5" bg="5" upgradeTwo="true" threeStarHealth="80" twoStarHealth="60" preStartMoney="3000">
	<!-- 
		preStartMoney - денег за досрочный вызов волны, может указываться у level и wave
		pause - пауза перед появлением, (секунды)
		lifeTime - время жизни волны, (секунды)
		img - картинка, иконка досрочного вызова волны
		side - сторона, откуда появится враг (left, right), - можно указывать целиком волне(wave) и также отдельным юнитам(enemy)
	-->
<group pause="0">
		<wave pause="0" lifeTime="30" side="left" img="1">
		    <enemy name="balloon" delay="1"/>
			<enemy name="balloon" delay="5"/>
			<enemy name="balloon" delay="10"/>
			<enemy name="balloon" delay="15"/>
			<enemy name="balloon" delay="20"/>
			<enemy name="parashut" delay="1"/>
			<enemy name="parashut" delay="3"/>
			<enemy name="parashut" delay="5"/>
			<enemy name="parashut" delay="7"/>
			<enemy name="parashut" delay="9"/>
			<enemy name="parashut" delay="11"/>
			<enemy name="parashut" delay="13"/>
			<enemy name="parashut" delay="15"/>
			<enemy name="parashut" delay="16"/>
			<enemy name="parashut" delay="17"/>
			<enemy name="parashut" delay="18"/>
			<enemy name="parashut" delay="19"/>
			<enemy name="parashut" delay="20"/>
			
			<enemy name="tanket" delay="0"/>
		</wave>
		<wave pause="0" lifeTime="30" side="right" img="1">
		    <enemy name="balloon" delay="1"/>
			<enemy name="balloon" delay="5"/>
			<enemy name="balloon" delay="10"/>
			<enemy name="balloon" delay="15"/>
			<enemy name="balloon" delay="20"/>
            <enemy name="parashut" delay="1"/>
			<enemy name="parashut" delay="3"/>
			<enemy name="parashut" delay="5"/>
			<enemy name="parashut" delay="7"/>
			<enemy name="parashut" delay="9"/>
			<enemy name="parashut" delay="11"/>
			<enemy name="parashut" delay="13"/>
			<enemy name="parashut" delay="15"/>
			<enemy name="parashut" delay="16"/>
			<enemy name="parashut" delay="17"/>
			<enemy name="parashut" delay="18"/>
			<enemy name="parashut" delay="19"/>
			<enemy name="parashut" delay="20"/>
			
			<enemy name="tanket" delay="20"/>
		</wave>
	</group>
	<group pause="3">
	<wave pause="0" lifeTime="10" side="left" img="1">
		    <enemy name="heli" delay="1"/>
			<enemy name="heli" delay="5"/>
			<enemy name="heli" delay="10"/>
		</wave>
		<wave pause="0" lifeTime="10" side="right" img="1">
		    <enemy name="heli" delay="1"/>
			<enemy name="heli" delay="5"/>
			<enemy name="heli" delay="10"/>
		</wave>
	</group>
	<group pause="0">
		<wave pause="0" lifeTime="10" side="left" img="1">
		    <enemy name="car" delay="1"/>
			<enemy name="car" delay="5"/>
			<enemy name="car" delay="10"/>
			<enemy name="car" delay="15"/>
		</wave>
		<wave pause="0" lifeTime="10" side="right" img="1">
		    <enemy name="car" delay="1"/>
			<enemy name="car" delay="5"/>
			<enemy name="car" delay="10"/>
			<enemy name="car" delay="15"/>
		</wave>
	</group>
	<group pause="3">
		<wave pause="0" lifeTime="20" side="left" img="1">
		    <enemy name="unit2" delay="0"/>
		    <enemy name="unit2" delay="1"/>
		    <enemy name="unit2" delay="2"/>
		    <enemy name="unit2" delay="3"/>
		    <enemy name="unit2" delay="4"/>
		    <enemy name="unit2" delay="5"/>
			<enemy name="airplane" delay="1"/>
			<enemy name="airplane" delay="5"/>
			<enemy name="airplane" delay="8"/>
		</wave>
		<wave pause="0" lifeTime="20" side="right" img="1">
		    <enemy name="unit2" delay="0"/>
		    <enemy name="unit2" delay="1"/>
		    <enemy name="unit2" delay="2"/>
		    <enemy name="unit2" delay="3"/>
		    <enemy name="unit2" delay="4"/>
		    <enemy name="unit2" delay="5"/>
			<enemy name="airplane" delay="1"/>
			<enemy name="airplane" delay="5"/>
			<enemy name="airplane" delay="8"/>
		</wave>
	</group>
	<group pause="3">
		<wave pause="0" lifeTime="50" side="left" img="1">
		    <enemy name="heli" delay="1"/>
			<enemy name="heli" delay="5"/>
			<enemy name="heli" delay="10"/>
			<enemy name="heli" delay="15"/>
			<enemy name="heli" delay="20"/>
			<enemy name="parashut" delay="1"/>
			<enemy name="parashut" delay="3"/>
			<enemy name="parashut" delay="5"/>
			<enemy name="parashut" delay="7"/>
			<enemy name="parashut" delay="9"/>
			<enemy name="parashut" delay="11"/>
			<enemy name="parashut" delay="13"/>
			<enemy name="parashut" delay="15"/>
			
			<enemy name="unit2" delay="0"/>
		    <enemy name="unit2" delay="2"/>
		    <enemy name="unit2" delay="4"/>
		    <enemy name="unit2" delay="6"/>
		    <enemy name="unit2" delay="8"/>
		    <enemy name="unit2" delay="10"/>
		    <enemy name="unit2" delay="12"/>
		    <enemy name="unit2" delay="14"/>
		    <enemy name="unit2" delay="16"/>
		    <enemy name="unit2" delay="18"/>
		    <enemy name="unit2" delay="20"/>
			<enemy name="unit2" delay="22"/>
		    <enemy name="unit2" delay="24"/>
		    <enemy name="unit2" delay="26"/>
		    <enemy name="unit2" delay="28"/>
		    <enemy name="unit2" delay="30"/>
		</wave>
		<wave pause="0" lifeTime="50" side="right" img="1">
		    <enemy name="heli" delay="1"/>
			<enemy name="heli" delay="5"/>
			<enemy name="heli" delay="10"/>
			<enemy name="heli" delay="15"/>
			<enemy name="heli" delay="20"/>
			<enemy name="parashut" delay="1"/>
			<enemy name="parashut" delay="3"/>
			<enemy name="parashut" delay="5"/>
			<enemy name="parashut" delay="7"/>
			<enemy name="parashut" delay="9"/>
			<enemy name="parashut" delay="11"/>
			<enemy name="parashut" delay="13"/>
			<enemy name="parashut" delay="15"/>
			<enemy name="unit2" delay="0"/>
		    <enemy name="unit2" delay="2"/>
		    <enemy name="unit2" delay="4"/>
		    <enemy name="unit2" delay="6"/>
		    <enemy name="unit2" delay="8"/>
		    <enemy name="unit2" delay="10"/>
		    <enemy name="unit2" delay="12"/>
		    <enemy name="unit2" delay="14"/>
		    <enemy name="unit2" delay="16"/>
		    <enemy name="unit2" delay="18"/>
		    <enemy name="unit2" delay="20"/>
		    <enemy name="unit2" delay="22"/>
		    <enemy name="unit2" delay="24"/>
		    <enemy name="unit2" delay="26"/>
		    <enemy name="unit2" delay="28"/>
		    <enemy name="unit2" delay="30"/>
		</wave>
	</group>
	<group pause="3">
		<wave pause="0" lifeTime="30" side="left" img="1">
		    <enemy name="tank3" delay="1"/>
		</wave>
	</group>
	<group pause="3">
	<wave pause="0" lifeTime="30" side="left" img="1">
		    <enemy name="heli" delay="1"/>
			<enemy name="heli" delay="4"/>
			<enemy name="heli" delay="8"/>
			<enemy name="heli" delay="16"/>
			<enemy name="heli" delay="20"/>
		    <enemy name="aerostat" delay="5"/>
		    <enemy name="aerostat" delay="10"/>
		    <enemy name="aerostat" delay="15"/>
			
			 <enemy name="tank2" delay="5"/>
			 <enemy name="tank2" delay="10"/>
			 <enemy name="tank2" delay="15"/>
		</wave>
		<wave pause="0" lifeTime="30" side="right" img="1">
		     <enemy name="heli" delay="1"/>
			<enemy name="heli" delay="4"/>
			<enemy name="heli" delay="8"/>
			<enemy name="heli" delay="16"/>
			<enemy name="heli" delay="20"/>
		    <enemy name="aerostat" delay="5"/>
		    <enemy name="aerostat" delay="10"/>
		    <enemy name="aerostat" delay="15"/>
			
			 <enemy name="tank2" delay="5"/>
			 <enemy name="tank2" delay="10"/>
			 <enemy name="tank2" delay="15"/>
		</wave>
	</group>
	<group pause="5">
	<wave pause="0" lifeTime="40" side="left" img="1">
		    <enemy name="heli" delay="1"/>
			<enemy name="heli" delay="3"/>
			<enemy name="heli" delay="6"/>
			<enemy name="heli" delay="9"/>
			<enemy name="heli" delay="12"/>
			<enemy name="heli" delay="15"/>
			<enemy name="heli" delay="18"/>
			<enemy name="heli" delay="21"/>
			<enemy name="heli" delay="24"/>
			<enemy name="heli" delay="27"/>
			<enemy name="heli" delay="30"/>
			
			<enemy name="unit2" delay="0"/>
		    <enemy name="unit2" delay="2"/>
		    <enemy name="unit2" delay="4"/>
		    <enemy name="unit2" delay="6"/>
		    <enemy name="unit2" delay="8"/>
		    <enemy name="unit2" delay="10"/>
		    <enemy name="unit2" delay="12"/>
		    <enemy name="unit2" delay="14"/>
		    <enemy name="unit2" delay="16"/>
		    <enemy name="unit2" delay="18"/>
		    <enemy name="unit2" delay="22"/>
		    <enemy name="unit2" delay="24"/>
		    <enemy name="unit2" delay="26"/>
		    <enemy name="unit2" delay="28"/>
		    <enemy name="unit2" delay="30"/>
			<enemy name="unit2" delay="0"/>
		    <enemy name="unit2" delay="2"/>
		    <enemy name="unit2" delay="4"/>
		    <enemy name="unit2" delay="6"/>
		    <enemy name="unit2" delay="8"/>
		    <enemy name="unit2" delay="10"/>
		    <enemy name="unit2" delay="12"/>
		    <enemy name="unit2" delay="14"/>
		    <enemy name="unit2" delay="16"/>
		    <enemy name="unit2" delay="18"/>
		    <enemy name="unit2" delay="22"/>
		    <enemy name="unit2" delay="24"/>
		    <enemy name="unit2" delay="26"/>
		    <enemy name="unit2" delay="28"/>
		    <enemy name="unit2" delay="30"/>
		</wave>
		<wave pause="0" lifeTime="40" side="right" img="1">
		    <enemy name="heli" delay="1"/>
			<enemy name="heli" delay="3"/>
			<enemy name="heli" delay="6"/>
			<enemy name="heli" delay="9"/>
			<enemy name="heli" delay="12"/>
			<enemy name="heli" delay="15"/>
			<enemy name="heli" delay="18"/>
			<enemy name="heli" delay="21"/>
			<enemy name="heli" delay="24"/>
			<enemy name="heli" delay="27"/>
			<enemy name="heli" delay="30"/>
			
			<enemy name="unit2" delay="0"/>
		    <enemy name="unit2" delay="2"/>
		    <enemy name="unit2" delay="4"/>
		    <enemy name="unit2" delay="6"/>
		    <enemy name="unit2" delay="8"/>
		    <enemy name="unit2" delay="10"/>
		    <enemy name="unit2" delay="12"/>
		    <enemy name="unit2" delay="14"/>
		    <enemy name="unit2" delay="16"/>
		    <enemy name="unit2" delay="18"/>
		    <enemy name="unit2" delay="22"/>
		    <enemy name="unit2" delay="24"/>
		    <enemy name="unit2" delay="26"/>
		    <enemy name="unit2" delay="28"/>
		    <enemy name="unit2" delay="30"/>
			<enemy name="unit2" delay="0"/>
		    <enemy name="unit2" delay="2"/>
		    <enemy name="unit2" delay="4"/>
		    <enemy name="unit2" delay="6"/>
		    <enemy name="unit2" delay="8"/>
		    <enemy name="unit2" delay="10"/>
		    <enemy name="unit2" delay="12"/>
		    <enemy name="unit2" delay="14"/>
		    <enemy name="unit2" delay="16"/>
		    <enemy name="unit2" delay="18"/>
		    <enemy name="unit2" delay="22"/>
		    <enemy name="unit2" delay="24"/>
		    <enemy name="unit2" delay="26"/>
		    <enemy name="unit2" delay="28"/>
		    <enemy name="unit2" delay="30"/>
		</wave>
	</group>
	<group pause="3">
	<wave pause="0" lifeTime="30" side="left" img="1">
		    <enemy name="aerostat" delay="1"/>
			<enemy name="aerostat" delay="4"/>
			<enemy name="aerostat" delay="8"/>
			<enemy name="aerostat" delay="16"/>
			<enemy name="aerostat" delay="20"/>
			
			<enemy name="parashut" delay="1"/>
			<enemy name="parashut" delay="3"/>
			<enemy name="parashut" delay="5"/>
			<enemy name="parashut" delay="7"/>
			<enemy name="parashut" delay="9"/>
			<enemy name="parashut" delay="11"/>
			<enemy name="parashut" delay="13"/>
			<enemy name="parashut" delay="15"/>
			
			 <enemy name="tank3" delay="1"/>

		</wave>
		<wave pause="0" lifeTime="30" side="right" img="1">
		    <enemy name="aerostat" delay="1"/>
			<enemy name="aerostat" delay="4"/>
			<enemy name="aerostat" delay="8"/>
			<enemy name="aerostat" delay="16"/>
			
			<enemy name="parashut" delay="1"/>
			<enemy name="parashut" delay="3"/>
			<enemy name="parashut" delay="5"/>
			<enemy name="parashut" delay="7"/>
			<enemy name="parashut" delay="9"/>
			<enemy name="parashut" delay="11"/>
			<enemy name="parashut" delay="13"/>
			<enemy name="parashut" delay="15"/>
			
			<enemy name="tank3" delay="1"/>
		</wave>
	</group>
	
	
	<group pause="5">
		<wave pause="0" lifeTime="30" side="left" img="1">
			<enemy name="airplane" delay="1"/>
			<enemy name="airplane" delay="3"/>
			<enemy name="airplane" delay="5"/>
			<enemy name="airplane" delay="8"/>
			<enemy name="airplane" delay="10"/>
			
			<enemy name="car" delay="2"/>
			<enemy name="car" delay="3"/>
			<enemy name="car" delay="4"/>
			<enemy name="car" delay="5"/>
			<enemy name="car" delay="6"/>
	      
		    <enemy name="walker1" delay="1"/>
			<enemy name="walker1" delay="10"/>
			<enemy name="walker1" delay="15"/>
			
			<enemy name="car" delay="16"/>
			<enemy name="car" delay="17"/>
			<enemy name="car" delay="18"/>
			<enemy name="car" delay="19"/>
			<enemy name="car" delay="20"/>
		</wave>
		<wave pause="0" lifeTime="10" side="right" img="1">
		<enemy name="airplane" delay="1"/>
			<enemy name="airplane" delay="3"/>
			<enemy name="airplane" delay="5"/>
			<enemy name="airplane" delay="8"/>
			<enemy name="airplane" delay="10"/>
			
			<enemy name="car" delay="2"/>
			<enemy name="car" delay="3"/>
			<enemy name="car" delay="4"/>
			<enemy name="car" delay="5"/>
			<enemy name="car" delay="6"/>
	      
		    <enemy name="walker1" delay="1"/>
			<enemy name="walker1" delay="10"/>
			<enemy name="walker1" delay="15"/>
			
			<enemy name="car" delay="16"/>
			<enemy name="car" delay="17"/>
			<enemy name="car" delay="18"/>
			<enemy name="car" delay="19"/>
			<enemy name="car" delay="20"/>
		</wave>
	</group>
	<group pause="5">
	<wave pause="0" lifeTime="30" side="left" img="1">
		    <enemy name="balloon" delay="1"/>
			<enemy name="balloon" delay="4"/>
			<enemy name="balloon" delay="8"/>
			<enemy name="balloon" delay="16"/>
			<enemy name="balloon" delay="20"/>
			
			<enemy name="tank3" delay="1"/>
			<enemy name="tank3" delay="5"/>
			<enemy name="tank3" delay="10"/>
			<enemy name="walker1" delay="15"/>

		</wave>
		<wave pause="0" lifeTime="30" side="right" img="1">
			<enemy name="balloon" delay="1"/>
			<enemy name="balloon" delay="4"/>
			<enemy name="balloon" delay="8"/>
			<enemy name="balloon" delay="16"/>
			<enemy name="balloon" delay="20"/>
			
			<enemy name="tank3" delay="1"/>
			<enemy name="tank3" delay="5"/>
			<enemy name="tank3" delay="10"/>
			<enemy name="walker1" delay="15"/>
		</wave>
	</group>
	<group pause="5">
	    <wave pause="0" lifeTime="40" side="left" img="1">
		    <enemy name="car" delay="1"/>
			<enemy name="car" delay="4"/>
			<enemy name="car" delay="8"/>
			<enemy name="car" delay="16"/>
			<enemy name="car" delay="20"/>
			
			<enemy name="tank1" delay="10"/>
			<enemy name="tank1" delay="14"/>
			<enemy name="tank1" delay="18"/>
			
			<enemy name="tank2" delay="22"/>
			<enemy name="tank2" delay="26"/>
			<enemy name="tank2" delay="30"/>
			
			<enemy name="heli" delay="1"/>
			<enemy name="heli" delay="3"/>
			<enemy name="heli" delay="6"/>
			<enemy name="heli" delay="9"/>
			<enemy name="heli" delay="12"/>
			<enemy name="heli" delay="15"/>
			<enemy name="heli" delay="18"/>
			<enemy name="heli" delay="21"/>
			<enemy name="heli" delay="24"/>
			<enemy name="heli" delay="27"/>
			<enemy name="heli" delay="30"/>
			<enemy name="heli" delay="21"/>
			<enemy name="heli" delay="24"/>
			<enemy name="heli" delay="27"/>
			<enemy name="heli" delay="30"/>
			
		</wave>
		<wave pause="0" lifeTime="40" side="right" img="1">
		<enemy name="car" delay="1"/>
			<enemy name="car" delay="4"/>
			<enemy name="car" delay="8"/>
			<enemy name="car" delay="16"/>
			<enemy name="car" delay="20"/>
			
			<enemy name="tank1" delay="10"/>
			<enemy name="tank1" delay="14"/>
			<enemy name="tank1" delay="18"/>
			
			<enemy name="tank2" delay="22"/>
			<enemy name="tank2" delay="26"/>
			<enemy name="tank2" delay="30"/>
			
			<enemy name="heli" delay="1"/>
			<enemy name="heli" delay="3"/>
			<enemy name="heli" delay="6"/>
			<enemy name="heli" delay="9"/>
			<enemy name="heli" delay="12"/>
			<enemy name="heli" delay="15"/>
			<enemy name="heli" delay="18"/>
			<enemy name="heli" delay="21"/>
			<enemy name="heli" delay="24"/>
			<enemy name="heli" delay="27"/>
			<enemy name="heli" delay="30"/>
			<enemy name="heli" delay="21"/>
			<enemy name="heli" delay="24"/>
			<enemy name="heli" delay="27"/>
			<enemy name="heli" delay="30"/>
		</wave>
	</group>
	<group pause="5">
		<wave pause="0" lifeTime="50" side="left" img="1">
		    <enemy name="airship" delay="1"/>
		</wave>
		<wave pause="0" lifeTime="50" side="right" img="1">
		    <enemy name="airship" delay="1"/>
		</wave>
	</group>
</level>;
            var _loc_15:* = <level eye=""normal"" money=""60000"" maxTower=""5"" maxUpgrade=""5"" bg=""5"" upgradeTwo=""true"" threeStarHealth=""80"" twoStarHealth=""60"" preStartMoney=""3200"">
n	t<!-- 
n	t	tpreStartMoney - денег за досрочный вызов волны, может указываться у level и wave
n	t	tpause - пауза перед появлением, (секунды)
n	t	tlifeTime - время жизни волны, (секунды)
n	t	timg - картинка, иконка досрочного вызова волны
n	t	tside - сторона, откуда появится враг (left, right), - можно указывать целиком волне(wave) и также отдельным юнитам(enemy)
n	t-->
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""10"" side=""right"" img=""1"">
n	t	t    <enemy name=""tanket"" delay=""1""/>
n	t	t	t<enemy name=""tanket"" delay=""4""/>
n	t	t	t<enemy name=""tanket"" delay=""8""/>
n	t	t	t<enemy name=""tanket"" delay=""12""/>
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t    <enemy name=""unit1"" delay=""3""/>
n	t	t    <enemy name=""unit1"" delay=""6""/>
n	t	t    <enemy name=""unit1"" delay=""9""/>
n	t	t    <enemy name=""unit1"" delay=""12""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""5"" side=""left"" img=""1"">
n	t	t    <enemy name=""unit1"" delay=""1""/>
n	t	t    <enemy name=""unit1"" delay=""3""/>
n	t	t    <enemy name=""unit1"" delay=""6""/>
n	t	t    <enemy name=""unit1"" delay=""9""/>
n	t	t    <enemy name=""unit1"" delay=""12""/>
n	t	t    <enemy name=""car"" delay=""1""/>
n	t	t	t<enemy name=""car"" delay=""5""/>
n	t	t	t<enemy name=""car"" delay=""10""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""15"" side=""right"" img=""1"">
n	t	t    <enemy name=""heli"" delay=""1""/>
n	t	t	t<enemy name=""heli"" delay=""5""/>
n	t	t	t<enemy name=""heli"" delay=""10""/>
n	t	t	t<enemy name=""heli"" delay=""15""/>
n	t	t	t<enemy name=""aerostat"" delay=""2""/>
n	t	t	t<enemy name=""aerostat"" delay=""7""/>
n	t	t	t<enemy name=""aerostat"" delay=""12""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""10"" side=""left"" img=""1"">
n	t	t    <enemy name=""tank1"" delay=""1""/>
n	t	t    <enemy name=""tank1"" delay=""5""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""50"" side=""right"" img=""1"">
n	t	t    <enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit2"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit2"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit2"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit2"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit2"" delay=""17""/>
n	t	t	t<enemy name=""unit1"" delay=""18""/>
n	t	t	t<enemy name=""unit1"" delay=""19""/>
n	t	t	t<enemy name=""unit2"" delay=""20""/>
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit2"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit2"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit2"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit2"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit2"" delay=""17""/>
n	t	t	t<enemy name=""unit1"" delay=""18""/>
n	t	t	t<enemy name=""unit1"" delay=""19""/>
n	t	t	t<enemy name=""unit2"" delay=""20""/>
n	t	t	t<enemy name=""unit1"" delay=""21""/>
n	t	t	t<enemy name=""unit1"" delay=""22""/>
n	t	t	t<enemy name=""unit2"" delay=""23""/>
n	t	t	t<enemy name=""unit1"" delay=""24""/>
n	t	t	t<enemy name=""unit1"" delay=""25""/>
n	t	t	t<enemy name=""unit2"" delay=""26""/>
n	t	t	t<enemy name=""unit1"" delay=""27""/>
n	t	t	t<enemy name=""unit1"" delay=""28""/>
n	t	t	t<enemy name=""unit2"" delay=""29""/>
n	t	t	t<enemy name=""parashut"" delay=""1""/>
n	t	t	t<enemy name=""parashut"" delay=""3""/>
n	t	t	t<enemy name=""parashut"" delay=""5""/>
n	t	t	t<enemy name=""parashut"" delay=""7""/>
n	t	t	t<enemy name=""parashut"" delay=""9""/>
n	t	t	t<enemy name=""parashut"" delay=""11""/>
n	t	t	t<enemy name=""parashut"" delay=""13""/>
n	t	t	t<enemy name=""parashut"" delay=""15""/>
n	t	t	t<enemy name=""parashut"" delay=""16""/>
n	t	t	t<enemy name=""parashut"" delay=""17""/>
n	t	t	t<enemy name=""parashut"" delay=""18""/>
n	t	t	t<enemy name=""parashut"" delay=""19""/>
n	t	t	t<enemy name=""parashut"" delay=""20""/>
n	t	t	t
n	t	t	t<enemy name=""walker1"" delay=""25""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""3"">
n	t<wave pause=""0"" lifeTime=""30"" side=""left"" img=""1"">
n	t	t    <enemy name=""heli"" delay=""1""/>
n	t	t	t<enemy name=""heli"" delay=""4""/>
n	t	t	t<enemy name=""heli"" delay=""8""/>
n	t	t	t<enemy name=""heli"" delay=""16""/>
n	t	t	t<enemy name=""heli"" delay=""20""/>
n	t	t	t<enemy name=""heli"" delay=""24""/>
n	t	t	t<enemy name=""heli"" delay=""28""/>
n	t	t    <enemy name=""aerostat"" delay=""5""/>
n	t	t    <enemy name=""aerostat"" delay=""10""/>
n	t	t    <enemy name=""aerostat"" delay=""15""/>
n	t	t    <enemy name=""aerostat"" delay=""20""/>
n	t	t    <enemy name=""aerostat"" delay=""25""/>
n	t	t	t<enemy name=""parashut"" delay=""3""/>
n	t	t	t<enemy name=""parashut"" delay=""7""/>
n	t	t	t<enemy name=""parashut"" delay=""9""/>
n	t	t	t<enemy name=""parashut"" delay=""13""/>
n	t	t	t<enemy name=""parashut"" delay=""16""/>
n	t	t	t<enemy name=""parashut"" delay=""18""/>
n	t	t	t<enemy name=""parashut"" delay=""20""/>
n	t	t	t
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""30"" side=""right"" img=""1"">
n	t	t	t <enemy name=""tank3"" delay=""10""/>
n	t	t	t <enemy name=""unit2"" delay=""23""/>
n	t	t	t <enemy name=""unit2"" delay=""24""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""3"">
n	t	t<wave pause=""0"" lifeTime=""30"" side=""left"" img=""1"">
n	t	t	t<enemy name=""walker1"" delay=""1""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""30"" side=""right"" img=""1"">
n	t	t	t<enemy name=""walker1"" delay=""1""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""3"">
n	t	t<wave pause=""0"" lifeTime=""30"" side=""left"" img=""1"">
n	t	t	t<enemy name=""tank2"" delay=""1""/>
n	t	t	t<enemy name=""tank2"" delay=""4""/>
n	t	t	t<enemy name=""tank2"" delay=""8""/>
n	t	t	t<enemy name=""tank2"" delay=""12""/>
n	t	t	t<enemy name=""unit2"" delay=""2""/>
n	t	t	t<enemy name=""unit2"" delay=""5""/>
n	t	t	t<enemy name=""unit2"" delay=""13""/>
n	t	t	t<enemy name=""unit2"" delay=""17""/>
n	t	t	t<enemy name=""unit2"" delay=""18""/>
n	t	t	t<enemy name=""unit2"" delay=""19""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""30"" side=""right"" img=""1"">
n	t	t	t<enemy name=""wheel"" delay=""10""/>
n	t	t	t<enemy name=""wheel"" delay=""11""/>
n	t	t	t<enemy name=""wheel"" delay=""12""/>
n	t	t	t<enemy name=""wheel"" delay=""13""/>
n	t	t	t<enemy name=""wheel"" delay=""14""/>
n	t	t	t<enemy name=""wheel"" delay=""15""/>
n	t	t	t<enemy name=""wheel"" delay=""16""/>
n	t	t	t<enemy name=""wheel"" delay=""17""/>
n	t	t	t<enemy name=""wheel"" delay=""18""/>
n	t	t	t<enemy name=""wheel"" delay=""19""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""3"">
n	t	t<wave pause=""0"" lifeTime=""30"" side=""left"" img=""1"">
n	t	t    <enemy name=""balloon"" delay=""0""/>
n	t	t	t<enemy name=""balloon"" delay=""2""/>
n	t	t	t<enemy name=""balloon"" delay=""4""/>
n	t	t	t<enemy name=""balloon"" delay=""6""/>
n	t	t	t<enemy name=""balloon"" delay=""8""/>
n	t	t	t<enemy name=""balloon"" delay=""10""/>
n	t	t	t<enemy name=""balloon"" delay=""12""/>
n	t	t	t<enemy name=""balloon"" delay=""14""/>
n	t	t	t<enemy name=""balloon"" delay=""16""/>
n	t	t	t<enemy name=""balloon"" delay=""18""/>
n	t	t	t<enemy name=""balloon"" delay=""20""/>
n	t	t	t
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit2"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit2"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit2"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit2"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit2"" delay=""17""/>
n	t	t	t<enemy name=""unit1"" delay=""18""/>
n	t	t	t<enemy name=""unit1"" delay=""19""/>
n	t	t	t<enemy name=""unit2"" delay=""20""/>
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit2"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit2"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit2"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit2"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit2"" delay=""17""/>
n	t	t	t<enemy name=""unit1"" delay=""18""/>
n	t	t	t<enemy name=""unit1"" delay=""19""/>
n	t	t	t<enemy name=""unit2"" delay=""20""/>
n	t	t	t<enemy name=""unit1"" delay=""21""/>
n	t	t	t<enemy name=""unit1"" delay=""22""/>
n	t	t	t<enemy name=""unit2"" delay=""23""/>
n	t	t	t<enemy name=""unit1"" delay=""24""/>
n	t	t	t<enemy name=""unit1"" delay=""25""/>
n	t	t	t<enemy name=""unit2"" delay=""26""/>
n	t	t	t<enemy name=""unit1"" delay=""27""/>
n	t	t	t<enemy name=""unit1"" delay=""28""/>
n	t	t	t<enemy name=""unit2"" delay=""29""/>
n	t	t	t<enemy name=""walker1"" delay=""15""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""30"" side=""right"" img=""1"">
n	t	t    <enemy name=""balloon"" delay=""0""/>
n	t	t	t<enemy name=""balloon"" delay=""2""/>
n	t	t	t<enemy name=""balloon"" delay=""4""/>
n	t	t	t<enemy name=""balloon"" delay=""6""/>
n	t	t	t<enemy name=""balloon"" delay=""8""/>
n	t	t	t<enemy name=""balloon"" delay=""10""/>
n	t	t	t<enemy name=""balloon"" delay=""12""/>
n	t	t	t<enemy name=""balloon"" delay=""14""/>
n	t	t	t<enemy name=""balloon"" delay=""16""/>
n	t	t	t<enemy name=""balloon"" delay=""18""/>
n	t	t	t<enemy name=""balloon"" delay=""20""/>
n	t	t	t
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit2"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit2"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit2"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit2"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit2"" delay=""17""/>
n	t	t	t<enemy name=""unit1"" delay=""18""/>
n	t	t	t<enemy name=""unit1"" delay=""19""/>
n	t	t	t<enemy name=""unit2"" delay=""20""/>
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit2"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit2"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit2"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit2"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit2"" delay=""17""/>
n	t	t	t<enemy name=""unit1"" delay=""18""/>
n	t	t	t<enemy name=""unit1"" delay=""19""/>
n	t	t	t<enemy name=""unit2"" delay=""20""/>
n	t	t	t<enemy name=""unit1"" delay=""21""/>
n	t	t	t<enemy name=""unit1"" delay=""22""/>
n	t	t	t<enemy name=""unit2"" delay=""23""/>
n	t	t	t<enemy name=""unit1"" delay=""24""/>
n	t	t	t<enemy name=""unit1"" delay=""25""/>
n	t	t	t<enemy name=""unit2"" delay=""26""/>
n	t	t	t<enemy name=""unit1"" delay=""27""/>
n	t	t	t<enemy name=""unit1"" delay=""28""/>
n	t	t	t<enemy name=""unit2"" delay=""29""/>
n	t	t	t<enemy name=""walker1"" delay=""15""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""3"">
n	t	t<wave pause=""0"" lifeTime=""30"" side=""left"" img=""1"">
n	t	t	t<enemy name=""tanket"" delay=""10""/>
n	t	t	t<enemy name=""tanket"" delay=""12""/>
n	t	t	t<enemy name=""tanket"" delay=""14""/>
n	t	t	t<enemy name=""tanket"" delay=""16""/>
n	t	t	t<enemy name=""tanket"" delay=""18""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""30"" side=""right"" img=""1"">
n	t	t	t<enemy name=""tank3"" delay=""1""/>
n	t	t	t<enemy name=""tank3"" delay=""8""/>
n	t	t	t<enemy name=""tank3"" delay=""16""/>
n	t	t</wave>
n	t</group>
n	t
n	t<group pause=""3"">
n	t	t<wave pause=""0"" lifeTime=""30"" side=""left"" img=""1"">
n	t	t    <enemy name=""heli"" delay=""1""/>
n	t	t	t<enemy name=""heli"" delay=""4""/>
n	t	t	t<enemy name=""heli"" delay=""8""/>
n	t	t	t<enemy name=""heli"" delay=""16""/>
n	t	t	t<enemy name=""heli"" delay=""20""/>
n	t	t	t<enemy name=""heli"" delay=""24""/>
n	t	t	t<enemy name=""heli"" delay=""28""/>
n	t	t    <enemy name=""unit2"" delay=""1""/>
n	t	t	t<enemy name=""unit2"" delay=""2""/>
n	t	t	t<enemy name=""unit2"" delay=""3""/>
n	t	t	t<enemy name=""unit2"" delay=""4""/>
n	t	t	t<enemy name=""unit2"" delay=""5""/>
n	t	t	t<enemy name=""unit2"" delay=""6""/>
n	t	t	t<enemy name=""unit2"" delay=""7""/>
n	t	t	t<enemy name=""unit2"" delay=""8""/>
n	t	t	t<enemy name=""unit2"" delay=""9""/>
n	t	t	t<enemy name=""unit2"" delay=""10""/>
n	t	t	t<enemy name=""unit2"" delay=""11""/>
n	t	t	t<enemy name=""unit2"" delay=""12""/>
n	t	t	t<enemy name=""unit2"" delay=""13""/>
n	t	t	t<enemy name=""unit2"" delay=""14""/>
n	t	t	t<enemy name=""unit2"" delay=""15""/>
n	t	t	t<enemy name=""unit2"" delay=""16""/>
n	t	t	t<enemy name=""unit2"" delay=""17""/>
n	t	t	t<enemy name=""unit2"" delay=""18""/>
n	t	t	t<enemy name=""unit2"" delay=""19""/>
n	t	t	t<enemy name=""unit2"" delay=""20""/>
n	t	t	t<enemy name=""unit2"" delay=""21""/>
n	t	t	t<enemy name=""unit2"" delay=""22""/>
n	t	t	t<enemy name=""unit2"" delay=""23""/>
n	t	t	t<enemy name=""unit2"" delay=""24""/>
n	t	t	t<enemy name=""unit2"" delay=""25""/>
n	t	t	t<enemy name=""unit2"" delay=""26""/>
n	t	t	t<enemy name=""unit2"" delay=""27""/>
n	t	t	t<enemy name=""unit2"" delay=""28""/>
n	t	t	t<enemy name=""unit2"" delay=""29""/>
n	t	t	t<enemy name=""unit2"" delay=""30""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""30"" side=""right"" img=""1"">
n	t	t<enemy name=""heli"" delay=""1""/>
n	t	t	t<enemy name=""heli"" delay=""4""/>
n	t	t	t<enemy name=""heli"" delay=""8""/>
n	t	t	t<enemy name=""heli"" delay=""16""/>
n	t	t	t<enemy name=""heli"" delay=""20""/>
n	t	t	t<enemy name=""heli"" delay=""24""/>
n	t	t	t<enemy name=""heli"" delay=""28""/>
n	t	t    <enemy name=""unit2"" delay=""1""/>
n	t	t	t<enemy name=""unit2"" delay=""2""/>
n	t	t	t<enemy name=""unit2"" delay=""3""/>
n	t	t	t<enemy name=""unit2"" delay=""4""/>
n	t	t	t<enemy name=""unit2"" delay=""5""/>
n	t	t	t<enemy name=""unit2"" delay=""6""/>
n	t	t	t<enemy name=""unit2"" delay=""7""/>
n	t	t	t<enemy name=""unit2"" delay=""8""/>
n	t	t	t<enemy name=""unit2"" delay=""9""/>
n	t	t	t<enemy name=""unit2"" delay=""10""/>
n	t	t	t<enemy name=""unit2"" delay=""11""/>
n	t	t	t<enemy name=""unit2"" delay=""12""/>
n	t	t	t<enemy name=""unit2"" delay=""13""/>
n	t	t	t<enemy name=""unit2"" delay=""14""/>
n	t	t	t<enemy name=""unit2"" delay=""15""/>
n	t	t	t<enemy name=""unit2"" delay=""16""/>
n	t	t	t<enemy name=""unit2"" delay=""17""/>
n	t	t	t<enemy name=""unit2"" delay=""18""/>
n	t	t	t<enemy name=""unit2"" delay=""19""/>
n	t	t	t<enemy name=""unit2"" delay=""20""/>
n	t	t	t<enemy name=""unit2"" delay=""21""/>
n	t	t	t<enemy name=""unit2"" delay=""22""/>
n	t	t	t<enemy name=""unit2"" delay=""23""/>
n	t	t	t<enemy name=""unit2"" delay=""24""/>
n	t	t	t<enemy name=""unit2"" delay=""25""/>
n	t	t	t<enemy name=""unit2"" delay=""26""/>
n	t	t	t<enemy name=""unit2"" delay=""27""/>
n	t	t	t<enemy name=""unit2"" delay=""28""/>
n	t	t	t<enemy name=""unit2"" delay=""29""/>
n	t	t	t<enemy name=""unit2"" delay=""30""/>
n	t	t</wave>
n	t</group>
n	t
n	t<group pause=""3"">
n	t	t<wave pause=""0"" lifeTime=""40"" side=""left"" img=""1"">
n	t	t	t<enemy name=""tank1"" delay=""1""/>
n	t	t	t<enemy name=""tank1"" delay=""4""/>
n	t	t	t<enemy name=""tank1"" delay=""8""/>
n	t	t	t<enemy name=""tank1"" delay=""12""/>
n	t	t	t<enemy name=""tank1"" delay=""16""/>
n	t	t	t
n	t	t	t<enemy name=""tank2"" delay=""2""/>
n	t	t	t<enemy name=""tank2"" delay=""6""/>
n	t	t	t<enemy name=""tank2"" delay=""10""/>
n	t	t	t<enemy name=""tank2"" delay=""14""/>
n	t	t	t<enemy name=""tank2"" delay=""18""/>
n	t	t	t
n	t	t	t<enemy name=""unit2"" delay=""2""/>
n	t	t	t<enemy name=""unit2"" delay=""5""/>
n	t	t	t<enemy name=""unit2"" delay=""13""/>
n	t	t	t<enemy name=""unit2"" delay=""17""/>
n	t	t	t<enemy name=""unit2"" delay=""18""/>
n	t	t	t<enemy name=""unit2"" delay=""19""/>
n	t	t	t<enemy name=""unit2"" delay=""20""/>
n	t	t	t
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""6""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit1"" delay=""12""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""18""/>
n	t	t	t<enemy name=""unit1"" delay=""21""/>
n	t	t	t<enemy name=""unit1"" delay=""24""/>
n	t	t	t
n	t	t	t<enemy name=""airplane"" delay=""1""/>
n	t	t	t<enemy name=""airplane"" delay=""3""/>
n	t	t	t<enemy name=""airplane"" delay=""6""/>
n	t	t	t<enemy name=""airplane"" delay=""9""/>
n	t	t	t<enemy name=""airplane"" delay=""12""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""40"" side=""right"" img=""1"">
n	t	t	t<enemy name=""tank1"" delay=""1""/>
n	t	t	t<enemy name=""tank1"" delay=""4""/>
n	t	t	t<enemy name=""tank1"" delay=""8""/>
n	t	t	t<enemy name=""tank1"" delay=""12""/>
n	t	t	t<enemy name=""tank1"" delay=""16""/>
n	t	t	t
n	t	t	t<enemy name=""tank2"" delay=""2""/>
n	t	t	t<enemy name=""tank2"" delay=""6""/>
n	t	t	t<enemy name=""tank2"" delay=""10""/>
n	t	t	t<enemy name=""tank2"" delay=""14""/>
n	t	t	t<enemy name=""tank2"" delay=""18""/>
n	t	t	t
n	t	t	t<enemy name=""unit2"" delay=""2""/>
n	t	t	t<enemy name=""unit2"" delay=""5""/>
n	t	t	t<enemy name=""unit2"" delay=""13""/>
n	t	t	t<enemy name=""unit2"" delay=""17""/>
n	t	t	t<enemy name=""unit2"" delay=""18""/>
n	t	t	t<enemy name=""unit2"" delay=""19""/>
n	t	t	t<enemy name=""unit2"" delay=""20""/>
n	t	t	t
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""6""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit1"" delay=""12""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""18""/>
n	t	t	t<enemy name=""unit1"" delay=""21""/>
n	t	t	t<enemy name=""unit1"" delay=""24""/>
n	t	t	t
n	t	t	t<enemy name=""airplane"" delay=""1""/>
n	t	t	t<enemy name=""airplane"" delay=""3""/>
n	t	t	t<enemy name=""airplane"" delay=""6""/>
n	t	t	t<enemy name=""airplane"" delay=""9""/>
n	t	t	t<enemy name=""airplane"" delay=""12""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""3"">
n	t	t<wave pause=""0"" lifeTime=""50"" side=""left"" img=""1"">
n	t	t	t<enemy name=""walker2"" delay=""1""/>
n	t	t	t<enemy name=""unit2"" delay=""16""/>
n	t	t	t<enemy name=""unit2"" delay=""18""/>
n	t	t	t<enemy name=""unit2"" delay=""20""/>
n	t	t	t<enemy name=""unit2"" delay=""22""/>
n	t	t	t<enemy name=""unit2"" delay=""24""/>
n	t	t	t<enemy name=""unit2"" delay=""26""/>
n	t	t	t<enemy name=""unit2"" delay=""28""/>
n	t	t	t<enemy name=""unit2"" delay=""30""/>
n	t	t	t
n	t	t	t<enemy name=""aerostat"" delay=""20""/>
n	t	t	t<enemy name=""aerostat"" delay=""25""/>
n	t	t	t<enemy name=""aerostat"" delay=""30""/>
n	t	t	t
n	t	t	t<enemy name=""parashut"" delay=""15""/>
n	t	t	t<enemy name=""parashut"" delay=""17""/>
n	t	t	t<enemy name=""parashut"" delay=""19""/>
n	t	t	t<enemy name=""parashut"" delay=""21""/>
n	t	t	t<enemy name=""parashut"" delay=""23""/>
n	t	t	t<enemy name=""parashut"" delay=""25""/>
n	t	t	t<enemy name=""parashut"" delay=""27""/>
n	t	t	t<enemy name=""parashut"" delay=""29""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""50"" side=""right"" img=""1"">
n	t	t	t<enemy name=""walker2"" delay=""1""/>
n	t	t	t<enemy name=""unit2"" delay=""16""/>
n	t	t	t<enemy name=""unit2"" delay=""18""/>
n	t	t	t<enemy name=""unit2"" delay=""20""/>
n	t	t	t<enemy name=""unit2"" delay=""22""/>
n	t	t	t<enemy name=""unit2"" delay=""24""/>
n	t	t	t<enemy name=""unit2"" delay=""26""/>
n	t	t	t<enemy name=""unit2"" delay=""28""/>
n	t	t	t<enemy name=""unit2"" delay=""30""/>
n	t	t	t<enemy name=""aerostat"" delay=""20""/>
n	t	t	t<enemy name=""aerostat"" delay=""25""/>
n	t	t	t<enemy name=""aerostat"" delay=""30""/>
n	t	t	t
n	t	t	t<enemy name=""parashut"" delay=""15""/>
n	t	t	t<enemy name=""parashut"" delay=""17""/>
n	t	t	t<enemy name=""parashut"" delay=""19""/>
n	t	t	t<enemy name=""parashut"" delay=""21""/>
n	t	t	t<enemy name=""parashut"" delay=""23""/>
n	t	t	t<enemy name=""parashut"" delay=""25""/>
n	t	t	t<enemy name=""parashut"" delay=""27""/>
n	t	t	t<enemy name=""parashut"" delay=""29""/>
n	t	t</wave>
n	t</group>
n	t
n</level>")("<level eye="normal" money="60000" maxTower="5" maxUpgrade="5" bg="5" upgradeTwo="true" threeStarHealth="80" twoStarHealth="60" preStartMoney="3200">
	<!-- 
		preStartMoney - денег за досрочный вызов волны, может указываться у level и wave
		pause - пауза перед появлением, (секунды)
		lifeTime - время жизни волны, (секунды)
		img - картинка, иконка досрочного вызова волны
		side - сторона, откуда появится враг (left, right), - можно указывать целиком волне(wave) и также отдельным юнитам(enemy)
	-->
	<group pause="0">
		<wave pause="0" lifeTime="10" side="right" img="1">
		    <enemy name="tanket" delay="1"/>
			<enemy name="tanket" delay="4"/>
			<enemy name="tanket" delay="8"/>
			<enemy name="tanket" delay="12"/>
			<enemy name="unit1" delay="1"/>
		    <enemy name="unit1" delay="3"/>
		    <enemy name="unit1" delay="6"/>
		    <enemy name="unit1" delay="9"/>
		    <enemy name="unit1" delay="12"/>
		</wave>
	</group>
	<group pause="0">
		<wave pause="0" lifeTime="5" side="left" img="1">
		    <enemy name="unit1" delay="1"/>
		    <enemy name="unit1" delay="3"/>
		    <enemy name="unit1" delay="6"/>
		    <enemy name="unit1" delay="9"/>
		    <enemy name="unit1" delay="12"/>
		    <enemy name="car" delay="1"/>
			<enemy name="car" delay="5"/>
			<enemy name="car" delay="10"/>
		</wave>
	</group>
	<group pause="0">
		<wave pause="0" lifeTime="15" side="right" img="1">
		    <enemy name="heli" delay="1"/>
			<enemy name="heli" delay="5"/>
			<enemy name="heli" delay="10"/>
			<enemy name="heli" delay="15"/>
			<enemy name="aerostat" delay="2"/>
			<enemy name="aerostat" delay="7"/>
			<enemy name="aerostat" delay="12"/>
		</wave>
	</group>
	<group pause="0">
		<wave pause="0" lifeTime="10" side="left" img="1">
		    <enemy name="tank1" delay="1"/>
		    <enemy name="tank1" delay="5"/>
		</wave>
	</group>
	<group pause="0">
		<wave pause="0" lifeTime="50" side="right" img="1">
		    <enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit2" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit2" delay="7"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit2" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit2" delay="14"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit2" delay="17"/>
			<enemy name="unit1" delay="18"/>
			<enemy name="unit1" delay="19"/>
			<enemy name="unit2" delay="20"/>
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit2" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit2" delay="7"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit2" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit2" delay="14"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit2" delay="17"/>
			<enemy name="unit1" delay="18"/>
			<enemy name="unit1" delay="19"/>
			<enemy name="unit2" delay="20"/>
			<enemy name="unit1" delay="21"/>
			<enemy name="unit1" delay="22"/>
			<enemy name="unit2" delay="23"/>
			<enemy name="unit1" delay="24"/>
			<enemy name="unit1" delay="25"/>
			<enemy name="unit2" delay="26"/>
			<enemy name="unit1" delay="27"/>
			<enemy name="unit1" delay="28"/>
			<enemy name="unit2" delay="29"/>
			<enemy name="parashut" delay="1"/>
			<enemy name="parashut" delay="3"/>
			<enemy name="parashut" delay="5"/>
			<enemy name="parashut" delay="7"/>
			<enemy name="parashut" delay="9"/>
			<enemy name="parashut" delay="11"/>
			<enemy name="parashut" delay="13"/>
			<enemy name="parashut" delay="15"/>
			<enemy name="parashut" delay="16"/>
			<enemy name="parashut" delay="17"/>
			<enemy name="parashut" delay="18"/>
			<enemy name="parashut" delay="19"/>
			<enemy name="parashut" delay="20"/>
			
			<enemy name="walker1" delay="25"/>
		</wave>
	</group>
	<group pause="3">
	<wave pause="0" lifeTime="30" side="left" img="1">
		    <enemy name="heli" delay="1"/>
			<enemy name="heli" delay="4"/>
			<enemy name="heli" delay="8"/>
			<enemy name="heli" delay="16"/>
			<enemy name="heli" delay="20"/>
			<enemy name="heli" delay="24"/>
			<enemy name="heli" delay="28"/>
		    <enemy name="aerostat" delay="5"/>
		    <enemy name="aerostat" delay="10"/>
		    <enemy name="aerostat" delay="15"/>
		    <enemy name="aerostat" delay="20"/>
		    <enemy name="aerostat" delay="25"/>
			<enemy name="parashut" delay="3"/>
			<enemy name="parashut" delay="7"/>
			<enemy name="parashut" delay="9"/>
			<enemy name="parashut" delay="13"/>
			<enemy name="parashut" delay="16"/>
			<enemy name="parashut" delay="18"/>
			<enemy name="parashut" delay="20"/>
			
		</wave>
		<wave pause="0" lifeTime="30" side="right" img="1">
			 <enemy name="tank3" delay="10"/>
			 <enemy name="unit2" delay="23"/>
			 <enemy name="unit2" delay="24"/>
		</wave>
	</group>
	<group pause="3">
		<wave pause="0" lifeTime="30" side="left" img="1">
			<enemy name="walker1" delay="1"/>
		</wave>
		<wave pause="0" lifeTime="30" side="right" img="1">
			<enemy name="walker1" delay="1"/>
		</wave>
	</group>
	<group pause="3">
		<wave pause="0" lifeTime="30" side="left" img="1">
			<enemy name="tank2" delay="1"/>
			<enemy name="tank2" delay="4"/>
			<enemy name="tank2" delay="8"/>
			<enemy name="tank2" delay="12"/>
			<enemy name="unit2" delay="2"/>
			<enemy name="unit2" delay="5"/>
			<enemy name="unit2" delay="13"/>
			<enemy name="unit2" delay="17"/>
			<enemy name="unit2" delay="18"/>
			<enemy name="unit2" delay="19"/>
		</wave>
		<wave pause="0" lifeTime="30" side="right" img="1">
			<enemy name="wheel" delay="10"/>
			<enemy name="wheel" delay="11"/>
			<enemy name="wheel" delay="12"/>
			<enemy name="wheel" delay="13"/>
			<enemy name="wheel" delay="14"/>
			<enemy name="wheel" delay="15"/>
			<enemy name="wheel" delay="16"/>
			<enemy name="wheel" delay="17"/>
			<enemy name="wheel" delay="18"/>
			<enemy name="wheel" delay="19"/>
		</wave>
	</group>
	<group pause="3">
		<wave pause="0" lifeTime="30" side="left" img="1">
		    <enemy name="balloon" delay="0"/>
			<enemy name="balloon" delay="2"/>
			<enemy name="balloon" delay="4"/>
			<enemy name="balloon" delay="6"/>
			<enemy name="balloon" delay="8"/>
			<enemy name="balloon" delay="10"/>
			<enemy name="balloon" delay="12"/>
			<enemy name="balloon" delay="14"/>
			<enemy name="balloon" delay="16"/>
			<enemy name="balloon" delay="18"/>
			<enemy name="balloon" delay="20"/>
			
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit2" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit2" delay="7"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit2" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit2" delay="14"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit2" delay="17"/>
			<enemy name="unit1" delay="18"/>
			<enemy name="unit1" delay="19"/>
			<enemy name="unit2" delay="20"/>
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit2" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit2" delay="7"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit2" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit2" delay="14"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit2" delay="17"/>
			<enemy name="unit1" delay="18"/>
			<enemy name="unit1" delay="19"/>
			<enemy name="unit2" delay="20"/>
			<enemy name="unit1" delay="21"/>
			<enemy name="unit1" delay="22"/>
			<enemy name="unit2" delay="23"/>
			<enemy name="unit1" delay="24"/>
			<enemy name="unit1" delay="25"/>
			<enemy name="unit2" delay="26"/>
			<enemy name="unit1" delay="27"/>
			<enemy name="unit1" delay="28"/>
			<enemy name="unit2" delay="29"/>
			<enemy name="walker1" delay="15"/>
		</wave>
		<wave pause="0" lifeTime="30" side="right" img="1">
		    <enemy name="balloon" delay="0"/>
			<enemy name="balloon" delay="2"/>
			<enemy name="balloon" delay="4"/>
			<enemy name="balloon" delay="6"/>
			<enemy name="balloon" delay="8"/>
			<enemy name="balloon" delay="10"/>
			<enemy name="balloon" delay="12"/>
			<enemy name="balloon" delay="14"/>
			<enemy name="balloon" delay="16"/>
			<enemy name="balloon" delay="18"/>
			<enemy name="balloon" delay="20"/>
			
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit2" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit2" delay="7"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit2" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit2" delay="14"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit2" delay="17"/>
			<enemy name="unit1" delay="18"/>
			<enemy name="unit1" delay="19"/>
			<enemy name="unit2" delay="20"/>
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit2" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit2" delay="7"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit2" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit2" delay="14"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit2" delay="17"/>
			<enemy name="unit1" delay="18"/>
			<enemy name="unit1" delay="19"/>
			<enemy name="unit2" delay="20"/>
			<enemy name="unit1" delay="21"/>
			<enemy name="unit1" delay="22"/>
			<enemy name="unit2" delay="23"/>
			<enemy name="unit1" delay="24"/>
			<enemy name="unit1" delay="25"/>
			<enemy name="unit2" delay="26"/>
			<enemy name="unit1" delay="27"/>
			<enemy name="unit1" delay="28"/>
			<enemy name="unit2" delay="29"/>
			<enemy name="walker1" delay="15"/>
		</wave>
	</group>
	<group pause="3">
		<wave pause="0" lifeTime="30" side="left" img="1">
			<enemy name="tanket" delay="10"/>
			<enemy name="tanket" delay="12"/>
			<enemy name="tanket" delay="14"/>
			<enemy name="tanket" delay="16"/>
			<enemy name="tanket" delay="18"/>
		</wave>
		<wave pause="0" lifeTime="30" side="right" img="1">
			<enemy name="tank3" delay="1"/>
			<enemy name="tank3" delay="8"/>
			<enemy name="tank3" delay="16"/>
		</wave>
	</group>
	
	<group pause="3">
		<wave pause="0" lifeTime="30" side="left" img="1">
		    <enemy name="heli" delay="1"/>
			<enemy name="heli" delay="4"/>
			<enemy name="heli" delay="8"/>
			<enemy name="heli" delay="16"/>
			<enemy name="heli" delay="20"/>
			<enemy name="heli" delay="24"/>
			<enemy name="heli" delay="28"/>
		    <enemy name="unit2" delay="1"/>
			<enemy name="unit2" delay="2"/>
			<enemy name="unit2" delay="3"/>
			<enemy name="unit2" delay="4"/>
			<enemy name="unit2" delay="5"/>
			<enemy name="unit2" delay="6"/>
			<enemy name="unit2" delay="7"/>
			<enemy name="unit2" delay="8"/>
			<enemy name="unit2" delay="9"/>
			<enemy name="unit2" delay="10"/>
			<enemy name="unit2" delay="11"/>
			<enemy name="unit2" delay="12"/>
			<enemy name="unit2" delay="13"/>
			<enemy name="unit2" delay="14"/>
			<enemy name="unit2" delay="15"/>
			<enemy name="unit2" delay="16"/>
			<enemy name="unit2" delay="17"/>
			<enemy name="unit2" delay="18"/>
			<enemy name="unit2" delay="19"/>
			<enemy name="unit2" delay="20"/>
			<enemy name="unit2" delay="21"/>
			<enemy name="unit2" delay="22"/>
			<enemy name="unit2" delay="23"/>
			<enemy name="unit2" delay="24"/>
			<enemy name="unit2" delay="25"/>
			<enemy name="unit2" delay="26"/>
			<enemy name="unit2" delay="27"/>
			<enemy name="unit2" delay="28"/>
			<enemy name="unit2" delay="29"/>
			<enemy name="unit2" delay="30"/>
		</wave>
		<wave pause="0" lifeTime="30" side="right" img="1">
		<enemy name="heli" delay="1"/>
			<enemy name="heli" delay="4"/>
			<enemy name="heli" delay="8"/>
			<enemy name="heli" delay="16"/>
			<enemy name="heli" delay="20"/>
			<enemy name="heli" delay="24"/>
			<enemy name="heli" delay="28"/>
		    <enemy name="unit2" delay="1"/>
			<enemy name="unit2" delay="2"/>
			<enemy name="unit2" delay="3"/>
			<enemy name="unit2" delay="4"/>
			<enemy name="unit2" delay="5"/>
			<enemy name="unit2" delay="6"/>
			<enemy name="unit2" delay="7"/>
			<enemy name="unit2" delay="8"/>
			<enemy name="unit2" delay="9"/>
			<enemy name="unit2" delay="10"/>
			<enemy name="unit2" delay="11"/>
			<enemy name="unit2" delay="12"/>
			<enemy name="unit2" delay="13"/>
			<enemy name="unit2" delay="14"/>
			<enemy name="unit2" delay="15"/>
			<enemy name="unit2" delay="16"/>
			<enemy name="unit2" delay="17"/>
			<enemy name="unit2" delay="18"/>
			<enemy name="unit2" delay="19"/>
			<enemy name="unit2" delay="20"/>
			<enemy name="unit2" delay="21"/>
			<enemy name="unit2" delay="22"/>
			<enemy name="unit2" delay="23"/>
			<enemy name="unit2" delay="24"/>
			<enemy name="unit2" delay="25"/>
			<enemy name="unit2" delay="26"/>
			<enemy name="unit2" delay="27"/>
			<enemy name="unit2" delay="28"/>
			<enemy name="unit2" delay="29"/>
			<enemy name="unit2" delay="30"/>
		</wave>
	</group>
	
	<group pause="3">
		<wave pause="0" lifeTime="40" side="left" img="1">
			<enemy name="tank1" delay="1"/>
			<enemy name="tank1" delay="4"/>
			<enemy name="tank1" delay="8"/>
			<enemy name="tank1" delay="12"/>
			<enemy name="tank1" delay="16"/>
			
			<enemy name="tank2" delay="2"/>
			<enemy name="tank2" delay="6"/>
			<enemy name="tank2" delay="10"/>
			<enemy name="tank2" delay="14"/>
			<enemy name="tank2" delay="18"/>
			
			<enemy name="unit2" delay="2"/>
			<enemy name="unit2" delay="5"/>
			<enemy name="unit2" delay="13"/>
			<enemy name="unit2" delay="17"/>
			<enemy name="unit2" delay="18"/>
			<enemy name="unit2" delay="19"/>
			<enemy name="unit2" delay="20"/>
			
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="6"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit1" delay="12"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="18"/>
			<enemy name="unit1" delay="21"/>
			<enemy name="unit1" delay="24"/>
			
			<enemy name="airplane" delay="1"/>
			<enemy name="airplane" delay="3"/>
			<enemy name="airplane" delay="6"/>
			<enemy name="airplane" delay="9"/>
			<enemy name="airplane" delay="12"/>
		</wave>
		<wave pause="0" lifeTime="40" side="right" img="1">
			<enemy name="tank1" delay="1"/>
			<enemy name="tank1" delay="4"/>
			<enemy name="tank1" delay="8"/>
			<enemy name="tank1" delay="12"/>
			<enemy name="tank1" delay="16"/>
			
			<enemy name="tank2" delay="2"/>
			<enemy name="tank2" delay="6"/>
			<enemy name="tank2" delay="10"/>
			<enemy name="tank2" delay="14"/>
			<enemy name="tank2" delay="18"/>
			
			<enemy name="unit2" delay="2"/>
			<enemy name="unit2" delay="5"/>
			<enemy name="unit2" delay="13"/>
			<enemy name="unit2" delay="17"/>
			<enemy name="unit2" delay="18"/>
			<enemy name="unit2" delay="19"/>
			<enemy name="unit2" delay="20"/>
			
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="6"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit1" delay="12"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="18"/>
			<enemy name="unit1" delay="21"/>
			<enemy name="unit1" delay="24"/>
			
			<enemy name="airplane" delay="1"/>
			<enemy name="airplane" delay="3"/>
			<enemy name="airplane" delay="6"/>
			<enemy name="airplane" delay="9"/>
			<enemy name="airplane" delay="12"/>
		</wave>
	</group>
	<group pause="3">
		<wave pause="0" lifeTime="50" side="left" img="1">
			<enemy name="walker2" delay="1"/>
			<enemy name="unit2" delay="16"/>
			<enemy name="unit2" delay="18"/>
			<enemy name="unit2" delay="20"/>
			<enemy name="unit2" delay="22"/>
			<enemy name="unit2" delay="24"/>
			<enemy name="unit2" delay="26"/>
			<enemy name="unit2" delay="28"/>
			<enemy name="unit2" delay="30"/>
			
			<enemy name="aerostat" delay="20"/>
			<enemy name="aerostat" delay="25"/>
			<enemy name="aerostat" delay="30"/>
			
			<enemy name="parashut" delay="15"/>
			<enemy name="parashut" delay="17"/>
			<enemy name="parashut" delay="19"/>
			<enemy name="parashut" delay="21"/>
			<enemy name="parashut" delay="23"/>
			<enemy name="parashut" delay="25"/>
			<enemy name="parashut" delay="27"/>
			<enemy name="parashut" delay="29"/>
		</wave>
		<wave pause="0" lifeTime="50" side="right" img="1">
			<enemy name="walker2" delay="1"/>
			<enemy name="unit2" delay="16"/>
			<enemy name="unit2" delay="18"/>
			<enemy name="unit2" delay="20"/>
			<enemy name="unit2" delay="22"/>
			<enemy name="unit2" delay="24"/>
			<enemy name="unit2" delay="26"/>
			<enemy name="unit2" delay="28"/>
			<enemy name="unit2" delay="30"/>
			<enemy name="aerostat" delay="20"/>
			<enemy name="aerostat" delay="25"/>
			<enemy name="aerostat" delay="30"/>
			
			<enemy name="parashut" delay="15"/>
			<enemy name="parashut" delay="17"/>
			<enemy name="parashut" delay="19"/>
			<enemy name="parashut" delay="21"/>
			<enemy name="parashut" delay="23"/>
			<enemy name="parashut" delay="25"/>
			<enemy name="parashut" delay="27"/>
			<enemy name="parashut" delay="29"/>
		</wave>
	</group>
	
</level>;
            var _loc_16:* = <level eye=""normal"" money=""71000"" maxTower=""5"" maxUpgrade=""5"" bg=""5"" upgradeTwo=""true"" threeStarHealth=""80"" twoStarHealth=""60"" preStartMoney=""3500"">
n	t<!-- 
n	t	tpreStartMoney - денег за досрочный вызов волны, может указываться у level и wave
n	t	tpause - пауза перед появлением, (секунды)
n	t	tlifeTime - время жизни волны, (секунды)
n	t	timg - картинка, иконка досрочного вызова волны
n	t	tside - сторона, откуда появится враг (left, right), - можно указывать целиком волне(wave) и также отдельным юнитам(enemy)
n	t-->
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""400"" side=""left"" img=""1"">
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""6""/>
n	t	t	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""12""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit1"" delay=""17""/>
n	t	t	t<enemy name=""unit1"" delay=""19""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""12""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit1"" delay=""17""/>
n	t	t	t<enemy name=""unit1"" delay=""19""/>
n	t	t	t<enemy name=""unit1"" delay=""20""/>
n	t	t	t<enemy name=""unit1"" delay=""21""/>
n	t	t	t<enemy name=""unit1"" delay=""22""/>
n	t	t	t<enemy name=""unit1"" delay=""23""/>
n	t	t	t<enemy name=""unit1"" delay=""24""/>
n	t	t	t<enemy name=""unit1"" delay=""25""/>
n	t	t	t<enemy name=""unit1"" delay=""26""/>
n	t	t	t<enemy name=""unit1"" delay=""27""/>
n	t	t	t<enemy name=""unit1"" delay=""28""/>
n	t	t	t<enemy name=""unit1"" delay=""29""/>
n	t	t	t<enemy name=""unit1"" delay=""30""/>
n	t	t	t
n	t	t	t<enemy name=""unit1"" delay=""50""/>
n	t	t	t<enemy name=""unit1"" delay=""51""/>
n	t	t	t<enemy name=""unit1"" delay=""52""/>
n	t	t	t<enemy name=""unit1"" delay=""53""/>
n	t	t	t<enemy name=""unit1"" delay=""54""/>
n	t	t	t<enemy name=""unit1"" delay=""55""/>
n	t	t	t<enemy name=""unit1"" delay=""56""/>
n	t	t	t<enemy name=""unit1"" delay=""57""/>
n	t	t	t<enemy name=""unit1"" delay=""58""/>
n	t	t	t<enemy name=""unit1"" delay=""59""/>
n	t	t	t<enemy name=""unit1"" delay=""60""/>
n	t	t	t
n	t	t	t<enemy name=""unit1"" delay=""71""/>
n	t	t	t<enemy name=""unit1"" delay=""72""/>
n	t	t	t<enemy name=""unit1"" delay=""73""/>
n	t	t	t<enemy name=""unit1"" delay=""74""/>
n	t	t	t<enemy name=""unit1"" delay=""75""/>
n	t	t	t<enemy name=""unit1"" delay=""76""/>
n	t	t	t<enemy name=""unit1"" delay=""77""/>
n	t	t	t<enemy name=""unit1"" delay=""78""/>
n	t	t	t<enemy name=""unit1"" delay=""79""/>
n	t	t	t<enemy name=""unit1"" delay=""80""/>
n	t	t	t<enemy name=""unit1"" delay=""81""/>
n	t	t	t<enemy name=""unit1"" delay=""82""/>
n	t	t	t<enemy name=""unit1"" delay=""83""/>
n	t	t	t<enemy name=""unit1"" delay=""84""/>
n	t	t	t<enemy name=""unit1"" delay=""85""/>
n	t	t	t<enemy name=""unit1"" delay=""86""/>
n	t	t	t<enemy name=""unit1"" delay=""87""/>
n	t	t	t<enemy name=""unit1"" delay=""88""/>
n	t	t	t<enemy name=""unit1"" delay=""89""/>
n	t	t	t<enemy name=""unit1"" delay=""90""/>
n	t	t	t<enemy name=""unit1"" delay=""101""/>
n	t	t	t<enemy name=""unit1"" delay=""102""/>
n	t	t	t<enemy name=""unit1"" delay=""103""/>
n	t	t	t<enemy name=""unit1"" delay=""104""/>
n	t	t	t<enemy name=""unit1"" delay=""105""/>
n	t	t	t<enemy name=""unit1"" delay=""106""/>
n	t	t	t<enemy name=""unit1"" delay=""107""/>
n	t	t	t<enemy name=""unit1"" delay=""108""/>
n	t	t	t<enemy name=""unit1"" delay=""109""/>
n	t	t	t<enemy name=""unit1"" delay=""110""/>
n	t	t	t<enemy name=""unit1"" delay=""111""/>
n	t	t	t<enemy name=""unit1"" delay=""112""/>
n	t	t	t<enemy name=""unit1"" delay=""113""/>
n	t	t	t<enemy name=""unit1"" delay=""114""/>
n	t	t	t<enemy name=""unit1"" delay=""115""/>
n	t	t	t<enemy name=""unit1"" delay=""116""/>
n	t	t	t<enemy name=""unit1"" delay=""117""/>
n	t	t	t<enemy name=""unit1"" delay=""118""/>
n	t	t	t<enemy name=""unit1"" delay=""119""/>
n	t	t	t<enemy name=""unit1"" delay=""120""/>
n	t	t	t
n	t	t	t<enemy name=""unit1"" delay=""151""/>
n	t	t	t<enemy name=""unit1"" delay=""152""/>
n	t	t	t<enemy name=""unit1"" delay=""153""/>
n	t	t	t<enemy name=""unit1"" delay=""154""/>
n	t	t	t<enemy name=""unit1"" delay=""155""/>
n	t	t	t<enemy name=""unit1"" delay=""156""/>
n	t	t	t<enemy name=""unit1"" delay=""157""/>
n	t	t	t<enemy name=""unit1"" delay=""158""/>
n	t	t	t<enemy name=""unit1"" delay=""159""/>
n	t	t	t<enemy name=""unit1"" delay=""160""/>
n	t	t	t<enemy name=""unit1"" delay=""161""/>
n	t	t	t<enemy name=""unit1"" delay=""162""/>
n	t	t	t<enemy name=""unit1"" delay=""163""/>
n	t	t	t<enemy name=""unit1"" delay=""164""/>
n	t	t	t<enemy name=""unit1"" delay=""165""/>
n	t	t	t<enemy name=""unit1"" delay=""166""/>
n	t	t	t<enemy name=""unit1"" delay=""167""/>
n	t	t	t<enemy name=""unit1"" delay=""168""/>
n	t	t	t<enemy name=""unit1"" delay=""169""/>
n	t	t	t<enemy name=""unit1"" delay=""170""/>
n	t	t	t<enemy name=""unit1"" delay=""171""/>
n	t	t	t<enemy name=""unit1"" delay=""172""/>
n	t	t	t<enemy name=""unit1"" delay=""173""/>
n	t	t	t<enemy name=""unit1"" delay=""174""/>
n	t	t	t<enemy name=""unit1"" delay=""175""/>
n	t	t	t<enemy name=""unit1"" delay=""176""/>
n	t	t	t<enemy name=""unit1"" delay=""177""/>
n	t	t	t<enemy name=""unit1"" delay=""178""/>
n	t	t	t<enemy name=""unit1"" delay=""179""/>
n	t	t	t<enemy name=""unit1"" delay=""180""/>
n	t	t	t
n	t	t	t<enemy name=""unit1"" delay=""221""/>
n	t	t	t<enemy name=""unit1"" delay=""222""/>
n	t	t	t<enemy name=""unit1"" delay=""223""/>
n	t	t	t<enemy name=""unit1"" delay=""224""/>
n	t	t	t<enemy name=""unit1"" delay=""225""/>
n	t	t	t<enemy name=""unit1"" delay=""226""/>
n	t	t	t<enemy name=""unit1"" delay=""227""/>
n	t	t	t<enemy name=""unit1"" delay=""228""/>
n	t	t	t<enemy name=""unit1"" delay=""229""/>
n	t	t	t<enemy name=""unit1"" delay=""230""/>
n	t	t	t<enemy name=""unit1"" delay=""231""/>
n	t	t	t<enemy name=""unit1"" delay=""232""/>
n	t	t	t<enemy name=""unit1"" delay=""233""/>
n	t	t	t<enemy name=""unit1"" delay=""234""/>
n	t	t	t<enemy name=""unit1"" delay=""235""/>
n	t	t	t<enemy name=""unit1"" delay=""236""/>
n	t	t	t<enemy name=""unit1"" delay=""237""/>
n	t	t	t<enemy name=""unit1"" delay=""238""/>
n	t	t	t<enemy name=""unit1"" delay=""239""/>
n	t	t	t<enemy name=""unit1"" delay=""240""/>
n	t	t	t<enemy name=""unit1"" delay=""241""/>
n	t	t	t<enemy name=""unit1"" delay=""242""/>
n	t	t	t<enemy name=""unit1"" delay=""243""/>
n	t	t	t<enemy name=""unit1"" delay=""244""/>
n	t	t	t<enemy name=""unit1"" delay=""245""/>
n	t	t	t<enemy name=""unit1"" delay=""246""/>
n	t	t	t<enemy name=""unit1"" delay=""247""/>
n	t	t	t<enemy name=""unit1"" delay=""248""/>
n	t	t	t<enemy name=""unit1"" delay=""249""/>
n	t	t	t<enemy name=""unit1"" delay=""250""/>
n	t	t	t
n	t	t	t<enemy name=""unit1"" delay=""261""/>
n	t	t	t<enemy name=""unit1"" delay=""262""/>
n	t	t	t<enemy name=""unit1"" delay=""263""/>
n	t	t	t<enemy name=""unit1"" delay=""264""/>
n	t	t	t<enemy name=""unit1"" delay=""265""/>
n	t	t	t<enemy name=""unit1"" delay=""266""/>
n	t	t	t<enemy name=""unit1"" delay=""267""/>
n	t	t	t<enemy name=""unit1"" delay=""268""/>
n	t	t	t<enemy name=""unit1"" delay=""269""/>
n	t	t	t<enemy name=""unit1"" delay=""270""/>
n	t	t	t<enemy name=""unit1"" delay=""271""/>
n	t	t	t<enemy name=""unit1"" delay=""272""/>
n	t	t	t<enemy name=""unit1"" delay=""273""/>
n	t	t	t<enemy name=""unit1"" delay=""274""/>
n	t	t	t<enemy name=""unit1"" delay=""275""/>
n	t	t	t<enemy name=""unit1"" delay=""276""/>
n	t	t	t<enemy name=""unit1"" delay=""277""/>
n	t	t	t<enemy name=""unit1"" delay=""278""/>
n	t	t	t<enemy name=""unit1"" delay=""279""/>
n	t	t	t<enemy name=""unit1"" delay=""280""/>
n	t	t	t<enemy name=""unit1"" delay=""281""/>
n	t	t	t<enemy name=""unit1"" delay=""282""/>
n	t	t	t<enemy name=""unit1"" delay=""283""/>
n	t	t	t<enemy name=""unit1"" delay=""284""/>
n	t	t	t<enemy name=""unit1"" delay=""285""/>
n	t	t	t<enemy name=""unit1"" delay=""286""/>
n	t	t	t<enemy name=""unit1"" delay=""287""/>
n	t	t	t<enemy name=""unit1"" delay=""288""/>
n	t	t	t<enemy name=""unit1"" delay=""289""/>
n	t	t	t<enemy name=""unit1"" delay=""290""/>
n	t	t	t<enemy name=""unit1"" delay=""291""/>
n	t	t	t<enemy name=""unit1"" delay=""292""/>
n	t	t	t<enemy name=""unit1"" delay=""293""/>
n	t	t	t<enemy name=""unit1"" delay=""294""/>
n	t	t	t<enemy name=""unit1"" delay=""295""/>
n	t	t	t<enemy name=""unit1"" delay=""296""/>
n	t	t	t<enemy name=""unit1"" delay=""297""/>
n	t	t	t<enemy name=""unit1"" delay=""298""/>
n	t	t	t<enemy name=""unit1"" delay=""299""/>
n	t	t	t<enemy name=""unit1"" delay=""300""/>
n	t	t	t
n	t	t	t<!-- unit2  -->
n	t	t	t<enemy name=""unit2"" delay=""80""/>
n	t	t	t<enemy name=""unit2"" delay=""82""/>
n	t	t	t<enemy name=""unit2"" delay=""84""/>
n	t	t	t<enemy name=""unit2"" delay=""86""/>
n	t	t	t<enemy name=""unit2"" delay=""88""/>
n	t	t	t<enemy name=""unit2"" delay=""90""/>
n	t	t	t<enemy name=""unit2"" delay=""92""/>
n	t	t	t<enemy name=""unit2"" delay=""94""/>
n	t	t	t<enemy name=""unit2"" delay=""96""/>
n	t	t	t<enemy name=""unit2"" delay=""98""/>
n	t	t	t<enemy name=""unit2"" delay=""100""/>
n	t	t	t
n	t	t	t<enemy name=""unit2"" delay=""120""/>
n	t	t	t<enemy name=""unit2"" delay=""122""/>
n	t	t	t<enemy name=""unit2"" delay=""124""/>
n	t	t	t<enemy name=""unit2"" delay=""126""/>
n	t	t	t<enemy name=""unit2"" delay=""128""/>
n	t	t	t<enemy name=""unit2"" delay=""130""/>
n	t	t	t<enemy name=""unit2"" delay=""132""/>
n	t	t	t<enemy name=""unit2"" delay=""134""/>
n	t	t	t<enemy name=""unit2"" delay=""136""/>
n	t	t	t<enemy name=""unit2"" delay=""138""/>
n	t	t	t<enemy name=""unit2"" delay=""140""/>
n	t	t	t<enemy name=""unit2"" delay=""142""/>
n	t	t	t<enemy name=""unit2"" delay=""144""/>
n	t	t	t<enemy name=""unit2"" delay=""146""/>
n	t	t	t<enemy name=""unit2"" delay=""148""/>
n	t	t	t<enemy name=""unit2"" delay=""150""/>
n	t	t	t
n	t	t	t<enemy name=""unit2"" delay=""170""/>
n	t	t	t<enemy name=""unit2"" delay=""172""/>
n	t	t	t<enemy name=""unit2"" delay=""174""/>
n	t	t	t<enemy name=""unit2"" delay=""176""/>
n	t	t	t<enemy name=""unit2"" delay=""178""/>
n	t	t	t<enemy name=""unit2"" delay=""180""/>
n	t	t	t<enemy name=""unit2"" delay=""182""/>
n	t	t	t<enemy name=""unit2"" delay=""184""/>
n	t	t	t<enemy name=""unit2"" delay=""186""/>
n	t	t	t<enemy name=""unit2"" delay=""188""/>
n	t	t	t<enemy name=""unit2"" delay=""190""/>
n	t	t	t<enemy name=""unit2"" delay=""192""/>
n	t	t	t<enemy name=""unit2"" delay=""194""/>
n	t	t	t<enemy name=""unit2"" delay=""196""/>
n	t	t	t<enemy name=""unit2"" delay=""198""/>
n	t	t	t<enemy name=""unit2"" delay=""200""/>
n	t	t	t
n	t	t	t<enemy name=""unit2"" delay=""230""/>
n	t	t	t<enemy name=""unit2"" delay=""232""/>
n	t	t	t<enemy name=""unit2"" delay=""234""/>
n	t	t	t<enemy name=""unit2"" delay=""236""/>
n	t	t	t<enemy name=""unit2"" delay=""238""/>
n	t	t	t<enemy name=""unit2"" delay=""240""/>
n	t	t	t<enemy name=""unit2"" delay=""242""/>
n	t	t	t<enemy name=""unit2"" delay=""244""/>
n	t	t	t<enemy name=""unit2"" delay=""246""/>
n	t	t	t<enemy name=""unit2"" delay=""248""/>
n	t	t	t<enemy name=""unit2"" delay=""252""/>
n	t	t	t<enemy name=""unit2"" delay=""254""/>
n	t	t	t<enemy name=""unit2"" delay=""256""/>
n	t	t	t<enemy name=""unit2"" delay=""258""/>
n	t	t	t<enemy name=""unit2"" delay=""260""/>
n	t	t	t<enemy name=""unit2"" delay=""262""/>
n	t	t	t<enemy name=""unit2"" delay=""264""/>
n	t	t	t<enemy name=""unit2"" delay=""266""/>
n	t	t	t<enemy name=""unit2"" delay=""268""/>
n	t	t	t<enemy name=""unit2"" delay=""270""/>
n	t	t	t<enemy name=""unit2"" delay=""272""/>
n	t	t	t<enemy name=""unit2"" delay=""274""/>
n	t	t	t<enemy name=""unit2"" delay=""276""/>
n	t	t	t<enemy name=""unit2"" delay=""278""/>
n	t	t	t<enemy name=""unit2"" delay=""280""/>
n	t	t	t<enemy name=""unit2"" delay=""282""/>
n	t	t	t<enemy name=""unit2"" delay=""284""/>
n	t	t	t<enemy name=""unit2"" delay=""286""/>
n	t	t	t<enemy name=""unit2"" delay=""288""/>
n	t	t	t<enemy name=""unit2"" delay=""290""/>
n	t	t	t<enemy name=""unit2"" delay=""292""/>
n	t	t	t<enemy name=""unit2"" delay=""294""/>
n	t	t	t
n	t	t	t<enemy name=""airplane"" delay=""180""/>
n	t	t	t<enemy name=""airplane"" delay=""185""/>
n	t	t	t<enemy name=""airplane"" delay=""190""/>
n	t	t	t<enemy name=""airplane"" delay=""195""/>
n	t	t	t
n	t	t	t<!-- tanket  -->
n	t	t	t<enemy name=""tanket"" delay=""20""/>
n	t	t	t<enemy name=""tanket"" delay=""25""/>
n	t	t	t<enemy name=""tanket"" delay=""30""/>
n	t	t	t<enemy name=""tanket"" delay=""35""/>
n	t	t	t<enemy name=""tanket"" delay=""40""/>
n	t	t	t<enemy name=""tanket"" delay=""43""/>
n	t	t	t<enemy name=""tanket"" delay=""46""/>
n	t	t	t<enemy name=""tanket"" delay=""49""/>
n	t	t	t
n	t	t	t<!-- car or balloon  -->
n	t	t	t<enemy name=""balloon"" delay=""40""/>
n	t	t	t<enemy name=""balloon"" delay=""44""/>
n	t	t	t<enemy name=""balloon"" delay=""48""/>
n	t	t	t<enemy name=""balloon"" delay=""52""/>
n	t	t	t<enemy name=""balloon"" delay=""56""/>
n	t	t	t<enemy name=""balloon"" delay=""60""/>
n	t	t	t<enemy name=""balloon"" delay=""63""/>
n	t	t	t<enemy name=""balloon"" delay=""66""/>
n	t	t	t<enemy name=""balloon"" delay=""69""/>
n	t	t	t<enemy name=""balloon"" delay=""72""/>
n	t	t	t<enemy name=""balloon"" delay=""75""/>
n	t	t	t<enemy name=""balloon"" delay=""78""/>
n	t	t	t
n	t	t	t<!-- cars -->
n	t	t	t<enemy name=""car"" delay=""90""/>
n	t	t	t<enemy name=""car"" delay=""100""/>
n	t	t	t<enemy name=""car"" delay=""110""/>
n	t	t	t<enemy name=""car"" delay=""120""/>
n	t	t	t<enemy name=""car"" delay=""130""/>
n	t	t	t<enemy name=""car"" delay=""140""/>
n	t	t	t<enemy name=""car"" delay=""150""/>
n	t	t	t<enemy name=""car"" delay=""170""/>
n	t	t	t<enemy name=""car"" delay=""190""/>
n	t	t	t<enemy name=""car"" delay=""220""/>
n	t	t	t<enemy name=""car"" delay=""260""/>
n	t	t	t
n	t	t	t<!-- aerostat or tank1 -->
n	t	t	t<enemy name=""tank1"" delay=""85""/>
n	t	t	t<enemy name=""tank1"" delay=""95""/>
n	t	t	t<enemy name=""tank1"" delay=""105""/>
n	t	t	t<enemy name=""tank1"" delay=""115""/>
n	t	t	t
n	t	t	t<!-- aerostats  -->
n	t	t	t<enemy name=""aerostat"" delay=""120""/>
n	t	t	t<enemy name=""aerostat"" delay=""130""/>
n	t	t	t<enemy name=""aerostat"" delay=""140""/>
n	t	t	t<enemy name=""aerostat"" delay=""160""/>
n	t	t	t<enemy name=""aerostat"" delay=""200""/>
n	t	t	t<enemy name=""aerostat"" delay=""240""/>
n	t	t	t<enemy name=""aerostat"" delay=""280""/>
n	t	t	t
n	t	t	t<!-- tanks -->
n	t	t	t<enemy name=""tank1"" delay=""140""/>
n	t	t	t<enemy name=""tank2"" delay=""160""/>
n	t	t	t<enemy name=""tank1"" delay=""180""/>
n	t	t	t<enemy name=""tank2"" delay=""200""/>
n	t	t	t<enemy name=""tank1"" delay=""220""/>
n	t	t	t<enemy name=""tank2"" delay=""240""/>
n	t	t	t<enemy name=""tank1"" delay=""260""/>
n	t	t	t<enemy name=""tank1"" delay=""280""/>
n	t	t	t
n	t	t	t<enemy name=""tank3"" delay=""170""/>
n	t	t	t<enemy name=""tank3"" delay=""180""/>
n	t	t	t
n	t	t	t<!-- parashuts -->
n	t	t	t<enemy name=""parashut"" delay=""180""/>
n	t	t	t<enemy name=""parashut"" delay=""183""/>
n	t	t	t<enemy name=""parashut"" delay=""186""/>
n	t	t	t<enemy name=""parashut"" delay=""190""/>
n	t	t	t<enemy name=""parashut"" delay=""193""/>
n	t	t	t<enemy name=""parashut"" delay=""196""/>
n	t	t	t<enemy name=""parashut"" delay=""200""/>
n	t	t	t<enemy name=""parashut"" delay=""203""/>
n	t	t	t<enemy name=""parashut"" delay=""206""/>
n	t	t	t<enemy name=""parashut"" delay=""210""/>
n	t	t	t<enemy name=""parashut"" delay=""203""/>
n	t	t	t<enemy name=""parashut"" delay=""216""/>
n	t	t	t<enemy name=""parashut"" delay=""220""/>
n	t	t	t<enemy name=""parashut"" delay=""223""/>
n	t	t	t<enemy name=""parashut"" delay=""226""/>
n	t	t	t<enemy name=""parashut"" delay=""230""/>
n	t	t	t<enemy name=""parashut"" delay=""233""/>
n	t	t	t<enemy name=""parashut"" delay=""236""/>
n	t	t	t<enemy name=""parashut"" delay=""240""/>
n	t	t	t<enemy name=""parashut"" delay=""243""/>
n	t	t	t<enemy name=""parashut"" delay=""246""/>
n	t	t	t<enemy name=""parashut"" delay=""250""/>
n	t	t	t<enemy name=""parashut"" delay=""253""/>
n	t	t	t<enemy name=""parashut"" delay=""256""/>
n	t	t	t<enemy name=""parashut"" delay=""260""/>
n	t	t	t
n	t	t	t<!-- Heli or walker  -->
n	t	t	t<enemy name=""heli"" delay=""190""/>
n	t	t	t<enemy name=""heli"" delay=""194""/>
n	t	t	t<enemy name=""heli"" delay=""198""/>
n	t	t	t<enemy name=""heli"" delay=""200""/>
n	t	t	t<enemy name=""heli"" delay=""204""/>
n	t	t	t<enemy name=""heli"" delay=""208""/>
n	t	t	t<enemy name=""heli"" delay=""212""/>
n	t	t	t<enemy name=""heli"" delay=""216""/>
n	t	t	t<enemy name=""heli"" delay=""220""/>
n	t	t	t<enemy name=""heli"" delay=""225""/>
n	t	t	t<enemy name=""heli"" delay=""230""/>
n	t	t	t
n	t	t	t<!-- heli -->
n	t	t	t<enemy name=""heli"" delay=""260""/>
n	t	t	t<enemy name=""heli"" delay=""270""/>
n	t	t	t<enemy name=""heli"" delay=""280""/>
n	t	t	t<enemy name=""heli"" delay=""290""/>
n	t	t	t
n	t	t	t<!-- walker -->
n	t	t	t<enemy name=""walker1"" delay=""255""/>
n	t	t	t<enemy name=""walker1"" delay=""265""/>
n	t	t	t<enemy name=""walker1"" delay=""275""/>
n	t	t	t<enemy name=""walker1"" delay=""285""/>
n	t	t	t
n	t	t	t<!-- Final -->
n	t	t	t<enemy name=""walker2"" delay=""300""/>
n	t	t	t<enemy name=""airship"" delay=""320""/>
n	t	t	t<enemy name=""tank4"" delay=""350""/>
n	t	t	t
n	t	t<!-- ////////////////////////////////////////////////////////////////////////////////////// -->
n	t	t<!-- ////////////////////////////////////////////////////////////////////////////////////// -->
n	t	t<!-- ////////////////////////////////////////////////////////////////////////////////////// -->
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""10"" side=""right"" img=""1"">
n	t	t<!-- ////////////////////////////////////////////////////////////////////////////////////// -->
n	t	t<!-- ////////////////////////////////////////////////////////////////////////////////////// -->
n	t	t<!-- ////////////////////////////////////////////////////////////////////////////////////// -->
n	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""6""/>
n	t	t	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""12""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit1"" delay=""17""/>
n	t	t	t<enemy name=""unit1"" delay=""19""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""12""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit1"" delay=""17""/>
n	t	t	t<enemy name=""unit1"" delay=""19""/>
n	t	t	t<enemy name=""unit1"" delay=""20""/>
n	t	t	t<enemy name=""unit1"" delay=""21""/>
n	t	t	t<enemy name=""unit1"" delay=""22""/>
n	t	t	t<enemy name=""unit1"" delay=""23""/>
n	t	t	t<enemy name=""unit1"" delay=""24""/>
n	t	t	t<enemy name=""unit1"" delay=""25""/>
n	t	t	t<enemy name=""unit1"" delay=""26""/>
n	t	t	t<enemy name=""unit1"" delay=""27""/>
n	t	t	t<enemy name=""unit1"" delay=""28""/>
n	t	t	t<enemy name=""unit1"" delay=""29""/>
n	t	t	t<enemy name=""unit1"" delay=""30""/>
n	t	t	t
n	t	t	t<enemy name=""unit1"" delay=""50""/>
n	t	t	t<enemy name=""unit1"" delay=""51""/>
n	t	t	t<enemy name=""unit1"" delay=""52""/>
n	t	t	t<enemy name=""unit1"" delay=""53""/>
n	t	t	t<enemy name=""unit1"" delay=""54""/>
n	t	t	t<enemy name=""unit1"" delay=""55""/>
n	t	t	t<enemy name=""unit1"" delay=""56""/>
n	t	t	t<enemy name=""unit1"" delay=""57""/>
n	t	t	t<enemy name=""unit1"" delay=""58""/>
n	t	t	t<enemy name=""unit1"" delay=""59""/>
n	t	t	t<enemy name=""unit1"" delay=""60""/>
n	t	t	t
n	t	t	t<enemy name=""unit1"" delay=""71""/>
n	t	t	t<enemy name=""unit1"" delay=""72""/>
n	t	t	t<enemy name=""unit1"" delay=""73""/>
n	t	t	t<enemy name=""unit1"" delay=""74""/>
n	t	t	t<enemy name=""unit1"" delay=""75""/>
n	t	t	t<enemy name=""unit1"" delay=""76""/>
n	t	t	t<enemy name=""unit1"" delay=""77""/>
n	t	t	t<enemy name=""unit1"" delay=""78""/>
n	t	t	t<enemy name=""unit1"" delay=""79""/>
n	t	t	t<enemy name=""unit1"" delay=""80""/>
n	t	t	t<enemy name=""unit1"" delay=""81""/>
n	t	t	t<enemy name=""unit1"" delay=""82""/>
n	t	t	t<enemy name=""unit1"" delay=""83""/>
n	t	t	t<enemy name=""unit1"" delay=""84""/>
n	t	t	t<enemy name=""unit1"" delay=""85""/>
n	t	t	t<enemy name=""unit1"" delay=""86""/>
n	t	t	t<enemy name=""unit1"" delay=""87""/>
n	t	t	t<enemy name=""unit1"" delay=""88""/>
n	t	t	t<enemy name=""unit1"" delay=""89""/>
n	t	t	t<enemy name=""unit1"" delay=""90""/>
n	t	t	t<enemy name=""unit1"" delay=""101""/>
n	t	t	t<enemy name=""unit1"" delay=""102""/>
n	t	t	t<enemy name=""unit1"" delay=""103""/>
n	t	t	t<enemy name=""unit1"" delay=""104""/>
n	t	t	t<enemy name=""unit1"" delay=""105""/>
n	t	t	t<enemy name=""unit1"" delay=""106""/>
n	t	t	t<enemy name=""unit1"" delay=""107""/>
n	t	t	t<enemy name=""unit1"" delay=""108""/>
n	t	t	t<enemy name=""unit1"" delay=""109""/>
n	t	t	t<enemy name=""unit1"" delay=""110""/>
n	t	t	t<enemy name=""unit1"" delay=""111""/>
n	t	t	t<enemy name=""unit1"" delay=""112""/>
n	t	t	t<enemy name=""unit1"" delay=""113""/>
n	t	t	t<enemy name=""unit1"" delay=""114""/>
n	t	t	t<enemy name=""unit1"" delay=""115""/>
n	t	t	t<enemy name=""unit1"" delay=""116""/>
n	t	t	t<enemy name=""unit1"" delay=""117""/>
n	t	t	t<enemy name=""unit1"" delay=""118""/>
n	t	t	t<enemy name=""unit1"" delay=""119""/>
n	t	t	t<enemy name=""unit1"" delay=""120""/>
n	t	t	t
n	t	t	t<enemy name=""unit1"" delay=""151""/>
n	t	t	t<enemy name=""unit1"" delay=""152""/>
n	t	t	t<enemy name=""unit1"" delay=""153""/>
n	t	t	t<enemy name=""unit1"" delay=""154""/>
n	t	t	t<enemy name=""unit1"" delay=""155""/>
n	t	t	t<enemy name=""unit1"" delay=""156""/>
n	t	t	t<enemy name=""unit1"" delay=""157""/>
n	t	t	t<enemy name=""unit1"" delay=""158""/>
n	t	t	t<enemy name=""unit1"" delay=""159""/>
n	t	t	t<enemy name=""unit1"" delay=""160""/>
n	t	t	t<enemy name=""unit1"" delay=""161""/>
n	t	t	t<enemy name=""unit1"" delay=""162""/>
n	t	t	t<enemy name=""unit1"" delay=""163""/>
n	t	t	t<enemy name=""unit1"" delay=""164""/>
n	t	t	t<enemy name=""unit1"" delay=""165""/>
n	t	t	t<enemy name=""unit1"" delay=""166""/>
n	t	t	t<enemy name=""unit1"" delay=""167""/>
n	t	t	t<enemy name=""unit1"" delay=""168""/>
n	t	t	t<enemy name=""unit1"" delay=""169""/>
n	t	t	t<enemy name=""unit1"" delay=""170""/>
n	t	t	t<enemy name=""unit1"" delay=""171""/>
n	t	t	t<enemy name=""unit1"" delay=""172""/>
n	t	t	t<enemy name=""unit1"" delay=""173""/>
n	t	t	t<enemy name=""unit1"" delay=""174""/>
n	t	t	t<enemy name=""unit1"" delay=""175""/>
n	t	t	t<enemy name=""unit1"" delay=""176""/>
n	t	t	t<enemy name=""unit1"" delay=""177""/>
n	t	t	t<enemy name=""unit1"" delay=""178""/>
n	t	t	t<enemy name=""unit1"" delay=""179""/>
n	t	t	t<enemy name=""unit1"" delay=""180""/>
n	t	t	t
n	t	t	t<enemy name=""unit1"" delay=""221""/>
n	t	t	t<enemy name=""unit1"" delay=""222""/>
n	t	t	t<enemy name=""unit1"" delay=""223""/>
n	t	t	t<enemy name=""unit1"" delay=""224""/>
n	t	t	t<enemy name=""unit1"" delay=""225""/>
n	t	t	t<enemy name=""unit1"" delay=""226""/>
n	t	t	t<enemy name=""unit1"" delay=""227""/>
n	t	t	t<enemy name=""unit1"" delay=""228""/>
n	t	t	t<enemy name=""unit1"" delay=""229""/>
n	t	t	t<enemy name=""unit1"" delay=""230""/>
n	t	t	t<enemy name=""unit1"" delay=""231""/>
n	t	t	t<enemy name=""unit1"" delay=""232""/>
n	t	t	t<enemy name=""unit1"" delay=""233""/>
n	t	t	t<enemy name=""unit1"" delay=""234""/>
n	t	t	t<enemy name=""unit1"" delay=""235""/>
n	t	t	t<enemy name=""unit1"" delay=""236""/>
n	t	t	t<enemy name=""unit1"" delay=""237""/>
n	t	t	t<enemy name=""unit1"" delay=""238""/>
n	t	t	t<enemy name=""unit1"" delay=""239""/>
n	t	t	t<enemy name=""unit1"" delay=""240""/>
n	t	t	t<enemy name=""unit1"" delay=""241""/>
n	t	t	t<enemy name=""unit1"" delay=""242""/>
n	t	t	t<enemy name=""unit1"" delay=""243""/>
n	t	t	t<enemy name=""unit1"" delay=""244""/>
n	t	t	t<enemy name=""unit1"" delay=""245""/>
n	t	t	t<enemy name=""unit1"" delay=""246""/>
n	t	t	t<enemy name=""unit1"" delay=""247""/>
n	t	t	t<enemy name=""unit1"" delay=""248""/>
n	t	t	t<enemy name=""unit1"" delay=""249""/>
n	t	t	t<enemy name=""unit1"" delay=""250""/>
n	t	t	t
n	t	t	t<enemy name=""unit1"" delay=""261""/>
n	t	t	t<enemy name=""unit1"" delay=""262""/>
n	t	t	t<enemy name=""unit1"" delay=""263""/>
n	t	t	t<enemy name=""unit1"" delay=""264""/>
n	t	t	t<enemy name=""unit1"" delay=""265""/>
n	t	t	t<enemy name=""unit1"" delay=""266""/>
n	t	t	t<enemy name=""unit1"" delay=""267""/>
n	t	t	t<enemy name=""unit1"" delay=""268""/>
n	t	t	t<enemy name=""unit1"" delay=""269""/>
n	t	t	t<enemy name=""unit1"" delay=""270""/>
n	t	t	t<enemy name=""unit1"" delay=""271""/>
n	t	t	t<enemy name=""unit1"" delay=""272""/>
n	t	t	t<enemy name=""unit1"" delay=""273""/>
n	t	t	t<enemy name=""unit1"" delay=""274""/>
n	t	t	t<enemy name=""unit1"" delay=""275""/>
n	t	t	t<enemy name=""unit1"" delay=""276""/>
n	t	t	t<enemy name=""unit1"" delay=""277""/>
n	t	t	t<enemy name=""unit1"" delay=""278""/>
n	t	t	t<enemy name=""unit1"" delay=""279""/>
n	t	t	t<enemy name=""unit1"" delay=""280""/>
n	t	t	t<enemy name=""unit1"" delay=""281""/>
n	t	t	t<enemy name=""unit1"" delay=""282""/>
n	t	t	t<enemy name=""unit1"" delay=""283""/>
n	t	t	t<enemy name=""unit1"" delay=""284""/>
n	t	t	t<enemy name=""unit1"" delay=""285""/>
n	t	t	t<enemy name=""unit1"" delay=""286""/>
n	t	t	t<enemy name=""unit1"" delay=""287""/>
n	t	t	t<enemy name=""unit1"" delay=""288""/>
n	t	t	t<enemy name=""unit1"" delay=""289""/>
n	t	t	t<enemy name=""unit1"" delay=""290""/>
n	t	t	t<enemy name=""unit1"" delay=""291""/>
n	t	t	t<enemy name=""unit1"" delay=""292""/>
n	t	t	t<enemy name=""unit1"" delay=""293""/>
n	t	t	t<enemy name=""unit1"" delay=""294""/>
n	t	t	t<enemy name=""unit1"" delay=""295""/>
n	t	t	t<enemy name=""unit1"" delay=""296""/>
n	t	t	t<enemy name=""unit1"" delay=""297""/>
n	t	t	t<enemy name=""unit1"" delay=""298""/>
n	t	t	t<enemy name=""unit1"" delay=""299""/>
n	t	t	t<enemy name=""unit1"" delay=""300""/>
n	t	t	t
n	t	t	t<!-- unit2  -->
n	t	t	t<enemy name=""unit2"" delay=""80""/>
n	t	t	t<enemy name=""unit2"" delay=""82""/>
n	t	t	t<enemy name=""unit2"" delay=""84""/>
n	t	t	t<enemy name=""unit2"" delay=""86""/>
n	t	t	t<enemy name=""unit2"" delay=""88""/>
n	t	t	t<enemy name=""unit2"" delay=""90""/>
n	t	t	t<enemy name=""unit2"" delay=""92""/>
n	t	t	t<enemy name=""unit2"" delay=""94""/>
n	t	t	t<enemy name=""unit2"" delay=""96""/>
n	t	t	t<enemy name=""unit2"" delay=""98""/>
n	t	t	t<enemy name=""unit2"" delay=""100""/>
n	t	t	t
n	t	t	t<enemy name=""unit2"" delay=""120""/>
n	t	t	t<enemy name=""unit2"" delay=""122""/>
n	t	t	t<enemy name=""unit2"" delay=""124""/>
n	t	t	t<enemy name=""unit2"" delay=""126""/>
n	t	t	t<enemy name=""unit2"" delay=""128""/>
n	t	t	t<enemy name=""unit2"" delay=""130""/>
n	t	t	t<enemy name=""unit2"" delay=""132""/>
n	t	t	t<enemy name=""unit2"" delay=""134""/>
n	t	t	t<enemy name=""unit2"" delay=""136""/>
n	t	t	t<enemy name=""unit2"" delay=""138""/>
n	t	t	t<enemy name=""unit2"" delay=""140""/>
n	t	t	t<enemy name=""unit2"" delay=""142""/>
n	t	t	t<enemy name=""unit2"" delay=""144""/>
n	t	t	t<enemy name=""unit2"" delay=""146""/>
n	t	t	t<enemy name=""unit2"" delay=""148""/>
n	t	t	t<enemy name=""unit2"" delay=""150""/>
n	t	t	t
n	t	t	t<enemy name=""unit2"" delay=""170""/>
n	t	t	t<enemy name=""unit2"" delay=""172""/>
n	t	t	t<enemy name=""unit2"" delay=""174""/>
n	t	t	t<enemy name=""unit2"" delay=""176""/>
n	t	t	t<enemy name=""unit2"" delay=""178""/>
n	t	t	t<enemy name=""unit2"" delay=""180""/>
n	t	t	t<enemy name=""unit2"" delay=""182""/>
n	t	t	t<enemy name=""unit2"" delay=""184""/>
n	t	t	t<enemy name=""unit2"" delay=""186""/>
n	t	t	t<enemy name=""unit2"" delay=""188""/>
n	t	t	t<enemy name=""unit2"" delay=""190""/>
n	t	t	t<enemy name=""unit2"" delay=""192""/>
n	t	t	t<enemy name=""unit2"" delay=""194""/>
n	t	t	t<enemy name=""unit2"" delay=""196""/>
n	t	t	t<enemy name=""unit2"" delay=""198""/>
n	t	t	t<enemy name=""unit2"" delay=""200""/>
n	t	t	t
n	t	t	t<enemy name=""unit2"" delay=""230""/>
n	t	t	t<enemy name=""unit2"" delay=""232""/>
n	t	t	t<enemy name=""unit2"" delay=""234""/>
n	t	t	t<enemy name=""unit2"" delay=""236""/>
n	t	t	t<enemy name=""unit2"" delay=""238""/>
n	t	t	t<enemy name=""unit2"" delay=""240""/>
n	t	t	t<enemy name=""unit2"" delay=""242""/>
n	t	t	t<enemy name=""unit2"" delay=""244""/>
n	t	t	t<enemy name=""unit2"" delay=""246""/>
n	t	t	t<enemy name=""unit2"" delay=""248""/>
n	t	t	t<enemy name=""unit2"" delay=""252""/>
n	t	t	t<enemy name=""unit2"" delay=""254""/>
n	t	t	t<enemy name=""unit2"" delay=""256""/>
n	t	t	t<enemy name=""unit2"" delay=""258""/>
n	t	t	t<enemy name=""unit2"" delay=""260""/>
n	t	t	t<enemy name=""unit2"" delay=""262""/>
n	t	t	t<enemy name=""unit2"" delay=""264""/>
n	t	t	t<enemy name=""unit2"" delay=""266""/>
n	t	t	t<enemy name=""unit2"" delay=""268""/>
n	t	t	t<enemy name=""unit2"" delay=""270""/>
n	t	t	t<enemy name=""unit2"" delay=""272""/>
n	t	t	t<enemy name=""unit2"" delay=""274""/>
n	t	t	t<enemy name=""unit2"" delay=""276""/>
n	t	t	t<enemy name=""unit2"" delay=""278""/>
n	t	t	t<enemy name=""unit2"" delay=""280""/>
n	t	t	t<enemy name=""unit2"" delay=""282""/>
n	t	t	t<enemy name=""unit2"" delay=""284""/>
n	t	t	t<enemy name=""unit2"" delay=""286""/>
n	t	t	t<enemy name=""unit2"" delay=""288""/>
n	t	t	t<enemy name=""unit2"" delay=""290""/>
n	t	t	t<enemy name=""unit2"" delay=""292""/>
n	t	t	t<enemy name=""unit2"" delay=""294""/>
n	t	t	t
n	t	t	t<!-- tanket  -->
n	t	t	t<enemy name=""tanket"" delay=""20""/>
n	t	t	t<enemy name=""tanket"" delay=""25""/>
n	t	t	t<enemy name=""tanket"" delay=""30""/>
n	t	t	t<enemy name=""tanket"" delay=""35""/>
n	t	t	t<enemy name=""tanket"" delay=""40""/>
n	t	t	t<enemy name=""tanket"" delay=""43""/>
n	t	t	t<enemy name=""tanket"" delay=""46""/>
n	t	t	t<enemy name=""tanket"" delay=""49""/>
n	t	t	t
n	t	t	t<!-- car or balloon  -->
n	t	t
n	t	t	t<enemy name=""car"" delay=""40""/>
n	t	t	t<enemy name=""car"" delay=""45""/>
n	t	t	t<enemy name=""car"" delay=""50""/>
n	t	t	t<enemy name=""car"" delay=""55""/>
n	t	t	t<enemy name=""car"" delay=""60""/>
n	t	t	t<enemy name=""car"" delay=""65""/>
n	t	t	t<enemy name=""car"" delay=""70""/>
n	t	t	t<enemy name=""car"" delay=""75""/>
n	t	t	t
n	t	t	t<!-- cars -->
n	t	t	t<enemy name=""car"" delay=""90""/>
n	t	t	t<enemy name=""car"" delay=""100""/>
n	t	t	t<enemy name=""car"" delay=""110""/>
n	t	t	t<enemy name=""car"" delay=""120""/>
n	t	t	t<enemy name=""car"" delay=""130""/>
n	t	t	t<enemy name=""car"" delay=""140""/>
n	t	t	t<enemy name=""car"" delay=""150""/>
n	t	t	t<enemy name=""car"" delay=""170""/>
n	t	t	t<enemy name=""car"" delay=""190""/>
n	t	t	t<enemy name=""car"" delay=""220""/>
n	t	t	t<enemy name=""car"" delay=""260""/>
n	t	t	t
n	t	t	t<!-- aerostat or tank1 -->
n	t	t	t<enemy name=""aerostat"" delay=""80""/>
n	t	t	t<enemy name=""aerostat"" delay=""85""/>
n	t	t	t<enemy name=""aerostat"" delay=""90""/>
n	t	t	t<enemy name=""aerostat"" delay=""95""/>
n	t	t	t<enemy name=""aerostat"" delay=""100""/>
n	t	t	t<enemy name=""aerostat"" delay=""105""/>
n	t	t	t<enemy name=""aerostat"" delay=""110""/>
n	t	t	t
n	t	t	t<!-- aerostats  -->
n	t	t	t<enemy name=""aerostat"" delay=""120""/>
n	t	t	t<enemy name=""aerostat"" delay=""130""/>
n	t	t	t<enemy name=""aerostat"" delay=""140""/>
n	t	t	t<enemy name=""aerostat"" delay=""160""/>
n	t	t	t<enemy name=""aerostat"" delay=""200""/>
n	t	t	t<enemy name=""aerostat"" delay=""240""/>
n	t	t	t<enemy name=""aerostat"" delay=""280""/>
n	t	t	t
n	t	t	t<!-- tanks -->
n	t	t	t<enemy name=""tank1"" delay=""140""/>
n	t	t	t<enemy name=""tank2"" delay=""160""/>
n	t	t	t<enemy name=""tank1"" delay=""180""/>
n	t	t	t<enemy name=""tank2"" delay=""200""/>
n	t	t	t<enemy name=""tank1"" delay=""220""/>
n	t	t	t<enemy name=""tank2"" delay=""240""/>
n	t	t	t<enemy name=""tank2"" delay=""260""/>
n	t	t	t<enemy name=""tank1"" delay=""280""/>
n	t	t	t
n	t	t	t<enemy name=""tank3"" delay=""150""/>
n	t	t	t<enemy name=""tank3"" delay=""160""/>
n	t	t	t
n	t	t	t
n	t	t	t<!-- parashuts -->
n	t	t	t<enemy name=""parashut"" delay=""180""/>
n	t	t	t<enemy name=""parashut"" delay=""183""/>
n	t	t	t<enemy name=""parashut"" delay=""186""/>
n	t	t	t<enemy name=""parashut"" delay=""190""/>
n	t	t	t<enemy name=""parashut"" delay=""193""/>
n	t	t	t<enemy name=""parashut"" delay=""196""/>
n	t	t	t<enemy name=""parashut"" delay=""200""/>
n	t	t	t<enemy name=""parashut"" delay=""203""/>
n	t	t	t<enemy name=""parashut"" delay=""206""/>
n	t	t	t<enemy name=""parashut"" delay=""210""/>
n	t	t	t<enemy name=""parashut"" delay=""203""/>
n	t	t	t<enemy name=""parashut"" delay=""216""/>
n	t	t	t<enemy name=""parashut"" delay=""220""/>
n	t	t	t<enemy name=""parashut"" delay=""223""/>
n	t	t	t<enemy name=""parashut"" delay=""226""/>
n	t	t	t<enemy name=""parashut"" delay=""230""/>
n	t	t	t<enemy name=""parashut"" delay=""233""/>
n	t	t	t<enemy name=""parashut"" delay=""236""/>
n	t	t	t<enemy name=""parashut"" delay=""240""/>
n	t	t	t<enemy name=""parashut"" delay=""243""/>
n	t	t	t<enemy name=""parashut"" delay=""246""/>
n	t	t	t<enemy name=""parashut"" delay=""250""/>
n	t	t	t<enemy name=""parashut"" delay=""253""/>
n	t	t	t<enemy name=""parashut"" delay=""256""/>
n	t	t	t<enemy name=""parashut"" delay=""260""/>
n	t	t	t
n	t	t	t<enemy name=""airplane"" delay=""180""/>
n	t	t	t<enemy name=""airplane"" delay=""185""/>
n	t	t	t<enemy name=""airplane"" delay=""190""/>
n	t	t	t<enemy name=""airplane"" delay=""195""/>
n	t	t	t
n	t	t	t<!-- Heli or walker  -->
n	t	t	t<enemy name=""walker1"" delay=""190""/>
n	t	t	t<enemy name=""walker1"" delay=""200""/>
n	t	t	t<enemy name=""walker1"" delay=""212""/>
n	t	t	t<enemy name=""walker1"" delay=""225""/>
n	t	t	t
n	t	t	t<!-- heli -->
n	t	t	t<enemy name=""heli"" delay=""260""/>
n	t	t	t<enemy name=""heli"" delay=""270""/>
n	t	t	t<enemy name=""heli"" delay=""280""/>
n	t	t	t<enemy name=""heli"" delay=""290""/>
n	t	t	t
n	t	t	t<!-- walker -->
n	t	t	t<enemy name=""walker1"" delay=""255""/>
n	t	t	t<enemy name=""walker1"" delay=""265""/>
n	t	t	t<enemy name=""walker1"" delay=""275""/>
n	t	t	t<enemy name=""walker1"" delay=""285""/>
n	t	t	t
n	t	t	t<!-- Final -->
n	t	t	t<enemy name=""walker2"" delay=""300""/>
n	t	t	t<enemy name=""airship"" delay=""320""/>
n	t	t	t<enemy name=""tank4"" delay=""350""/>
n	t	t</wave>
n	t</group>
n</level>")("<level eye="normal" money="71000" maxTower="5" maxUpgrade="5" bg="5" upgradeTwo="true" threeStarHealth="80" twoStarHealth="60" preStartMoney="3500">
	<!-- 
		preStartMoney - денег за досрочный вызов волны, может указываться у level и wave
		pause - пауза перед появлением, (секунды)
		lifeTime - время жизни волны, (секунды)
		img - картинка, иконка досрочного вызова волны
		side - сторона, откуда появится враг (left, right), - можно указывать целиком волне(wave) и также отдельным юнитам(enemy)
	-->
	<group pause="0">
		<wave pause="0" lifeTime="400" side="left" img="1">
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit1" delay="6"/>
			<enemy name="unit1" delay="7"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="12"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit1" delay="17"/>
			<enemy name="unit1" delay="19"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="12"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit1" delay="17"/>
			<enemy name="unit1" delay="19"/>
			<enemy name="unit1" delay="20"/>
			<enemy name="unit1" delay="21"/>
			<enemy name="unit1" delay="22"/>
			<enemy name="unit1" delay="23"/>
			<enemy name="unit1" delay="24"/>
			<enemy name="unit1" delay="25"/>
			<enemy name="unit1" delay="26"/>
			<enemy name="unit1" delay="27"/>
			<enemy name="unit1" delay="28"/>
			<enemy name="unit1" delay="29"/>
			<enemy name="unit1" delay="30"/>
			
			<enemy name="unit1" delay="50"/>
			<enemy name="unit1" delay="51"/>
			<enemy name="unit1" delay="52"/>
			<enemy name="unit1" delay="53"/>
			<enemy name="unit1" delay="54"/>
			<enemy name="unit1" delay="55"/>
			<enemy name="unit1" delay="56"/>
			<enemy name="unit1" delay="57"/>
			<enemy name="unit1" delay="58"/>
			<enemy name="unit1" delay="59"/>
			<enemy name="unit1" delay="60"/>
			
			<enemy name="unit1" delay="71"/>
			<enemy name="unit1" delay="72"/>
			<enemy name="unit1" delay="73"/>
			<enemy name="unit1" delay="74"/>
			<enemy name="unit1" delay="75"/>
			<enemy name="unit1" delay="76"/>
			<enemy name="unit1" delay="77"/>
			<enemy name="unit1" delay="78"/>
			<enemy name="unit1" delay="79"/>
			<enemy name="unit1" delay="80"/>
			<enemy name="unit1" delay="81"/>
			<enemy name="unit1" delay="82"/>
			<enemy name="unit1" delay="83"/>
			<enemy name="unit1" delay="84"/>
			<enemy name="unit1" delay="85"/>
			<enemy name="unit1" delay="86"/>
			<enemy name="unit1" delay="87"/>
			<enemy name="unit1" delay="88"/>
			<enemy name="unit1" delay="89"/>
			<enemy name="unit1" delay="90"/>
			<enemy name="unit1" delay="101"/>
			<enemy name="unit1" delay="102"/>
			<enemy name="unit1" delay="103"/>
			<enemy name="unit1" delay="104"/>
			<enemy name="unit1" delay="105"/>
			<enemy name="unit1" delay="106"/>
			<enemy name="unit1" delay="107"/>
			<enemy name="unit1" delay="108"/>
			<enemy name="unit1" delay="109"/>
			<enemy name="unit1" delay="110"/>
			<enemy name="unit1" delay="111"/>
			<enemy name="unit1" delay="112"/>
			<enemy name="unit1" delay="113"/>
			<enemy name="unit1" delay="114"/>
			<enemy name="unit1" delay="115"/>
			<enemy name="unit1" delay="116"/>
			<enemy name="unit1" delay="117"/>
			<enemy name="unit1" delay="118"/>
			<enemy name="unit1" delay="119"/>
			<enemy name="unit1" delay="120"/>
			
			<enemy name="unit1" delay="151"/>
			<enemy name="unit1" delay="152"/>
			<enemy name="unit1" delay="153"/>
			<enemy name="unit1" delay="154"/>
			<enemy name="unit1" delay="155"/>
			<enemy name="unit1" delay="156"/>
			<enemy name="unit1" delay="157"/>
			<enemy name="unit1" delay="158"/>
			<enemy name="unit1" delay="159"/>
			<enemy name="unit1" delay="160"/>
			<enemy name="unit1" delay="161"/>
			<enemy name="unit1" delay="162"/>
			<enemy name="unit1" delay="163"/>
			<enemy name="unit1" delay="164"/>
			<enemy name="unit1" delay="165"/>
			<enemy name="unit1" delay="166"/>
			<enemy name="unit1" delay="167"/>
			<enemy name="unit1" delay="168"/>
			<enemy name="unit1" delay="169"/>
			<enemy name="unit1" delay="170"/>
			<enemy name="unit1" delay="171"/>
			<enemy name="unit1" delay="172"/>
			<enemy name="unit1" delay="173"/>
			<enemy name="unit1" delay="174"/>
			<enemy name="unit1" delay="175"/>
			<enemy name="unit1" delay="176"/>
			<enemy name="unit1" delay="177"/>
			<enemy name="unit1" delay="178"/>
			<enemy name="unit1" delay="179"/>
			<enemy name="unit1" delay="180"/>
			
			<enemy name="unit1" delay="221"/>
			<enemy name="unit1" delay="222"/>
			<enemy name="unit1" delay="223"/>
			<enemy name="unit1" delay="224"/>
			<enemy name="unit1" delay="225"/>
			<enemy name="unit1" delay="226"/>
			<enemy name="unit1" delay="227"/>
			<enemy name="unit1" delay="228"/>
			<enemy name="unit1" delay="229"/>
			<enemy name="unit1" delay="230"/>
			<enemy name="unit1" delay="231"/>
			<enemy name="unit1" delay="232"/>
			<enemy name="unit1" delay="233"/>
			<enemy name="unit1" delay="234"/>
			<enemy name="unit1" delay="235"/>
			<enemy name="unit1" delay="236"/>
			<enemy name="unit1" delay="237"/>
			<enemy name="unit1" delay="238"/>
			<enemy name="unit1" delay="239"/>
			<enemy name="unit1" delay="240"/>
			<enemy name="unit1" delay="241"/>
			<enemy name="unit1" delay="242"/>
			<enemy name="unit1" delay="243"/>
			<enemy name="unit1" delay="244"/>
			<enemy name="unit1" delay="245"/>
			<enemy name="unit1" delay="246"/>
			<enemy name="unit1" delay="247"/>
			<enemy name="unit1" delay="248"/>
			<enemy name="unit1" delay="249"/>
			<enemy name="unit1" delay="250"/>
			
			<enemy name="unit1" delay="261"/>
			<enemy name="unit1" delay="262"/>
			<enemy name="unit1" delay="263"/>
			<enemy name="unit1" delay="264"/>
			<enemy name="unit1" delay="265"/>
			<enemy name="unit1" delay="266"/>
			<enemy name="unit1" delay="267"/>
			<enemy name="unit1" delay="268"/>
			<enemy name="unit1" delay="269"/>
			<enemy name="unit1" delay="270"/>
			<enemy name="unit1" delay="271"/>
			<enemy name="unit1" delay="272"/>
			<enemy name="unit1" delay="273"/>
			<enemy name="unit1" delay="274"/>
			<enemy name="unit1" delay="275"/>
			<enemy name="unit1" delay="276"/>
			<enemy name="unit1" delay="277"/>
			<enemy name="unit1" delay="278"/>
			<enemy name="unit1" delay="279"/>
			<enemy name="unit1" delay="280"/>
			<enemy name="unit1" delay="281"/>
			<enemy name="unit1" delay="282"/>
			<enemy name="unit1" delay="283"/>
			<enemy name="unit1" delay="284"/>
			<enemy name="unit1" delay="285"/>
			<enemy name="unit1" delay="286"/>
			<enemy name="unit1" delay="287"/>
			<enemy name="unit1" delay="288"/>
			<enemy name="unit1" delay="289"/>
			<enemy name="unit1" delay="290"/>
			<enemy name="unit1" delay="291"/>
			<enemy name="unit1" delay="292"/>
			<enemy name="unit1" delay="293"/>
			<enemy name="unit1" delay="294"/>
			<enemy name="unit1" delay="295"/>
			<enemy name="unit1" delay="296"/>
			<enemy name="unit1" delay="297"/>
			<enemy name="unit1" delay="298"/>
			<enemy name="unit1" delay="299"/>
			<enemy name="unit1" delay="300"/>
			
			<!-- unit2  -->
			<enemy name="unit2" delay="80"/>
			<enemy name="unit2" delay="82"/>
			<enemy name="unit2" delay="84"/>
			<enemy name="unit2" delay="86"/>
			<enemy name="unit2" delay="88"/>
			<enemy name="unit2" delay="90"/>
			<enemy name="unit2" delay="92"/>
			<enemy name="unit2" delay="94"/>
			<enemy name="unit2" delay="96"/>
			<enemy name="unit2" delay="98"/>
			<enemy name="unit2" delay="100"/>
			
			<enemy name="unit2" delay="120"/>
			<enemy name="unit2" delay="122"/>
			<enemy name="unit2" delay="124"/>
			<enemy name="unit2" delay="126"/>
			<enemy name="unit2" delay="128"/>
			<enemy name="unit2" delay="130"/>
			<enemy name="unit2" delay="132"/>
			<enemy name="unit2" delay="134"/>
			<enemy name="unit2" delay="136"/>
			<enemy name="unit2" delay="138"/>
			<enemy name="unit2" delay="140"/>
			<enemy name="unit2" delay="142"/>
			<enemy name="unit2" delay="144"/>
			<enemy name="unit2" delay="146"/>
			<enemy name="unit2" delay="148"/>
			<enemy name="unit2" delay="150"/>
			
			<enemy name="unit2" delay="170"/>
			<enemy name="unit2" delay="172"/>
			<enemy name="unit2" delay="174"/>
			<enemy name="unit2" delay="176"/>
			<enemy name="unit2" delay="178"/>
			<enemy name="unit2" delay="180"/>
			<enemy name="unit2" delay="182"/>
			<enemy name="unit2" delay="184"/>
			<enemy name="unit2" delay="186"/>
			<enemy name="unit2" delay="188"/>
			<enemy name="unit2" delay="190"/>
			<enemy name="unit2" delay="192"/>
			<enemy name="unit2" delay="194"/>
			<enemy name="unit2" delay="196"/>
			<enemy name="unit2" delay="198"/>
			<enemy name="unit2" delay="200"/>
			
			<enemy name="unit2" delay="230"/>
			<enemy name="unit2" delay="232"/>
			<enemy name="unit2" delay="234"/>
			<enemy name="unit2" delay="236"/>
			<enemy name="unit2" delay="238"/>
			<enemy name="unit2" delay="240"/>
			<enemy name="unit2" delay="242"/>
			<enemy name="unit2" delay="244"/>
			<enemy name="unit2" delay="246"/>
			<enemy name="unit2" delay="248"/>
			<enemy name="unit2" delay="252"/>
			<enemy name="unit2" delay="254"/>
			<enemy name="unit2" delay="256"/>
			<enemy name="unit2" delay="258"/>
			<enemy name="unit2" delay="260"/>
			<enemy name="unit2" delay="262"/>
			<enemy name="unit2" delay="264"/>
			<enemy name="unit2" delay="266"/>
			<enemy name="unit2" delay="268"/>
			<enemy name="unit2" delay="270"/>
			<enemy name="unit2" delay="272"/>
			<enemy name="unit2" delay="274"/>
			<enemy name="unit2" delay="276"/>
			<enemy name="unit2" delay="278"/>
			<enemy name="unit2" delay="280"/>
			<enemy name="unit2" delay="282"/>
			<enemy name="unit2" delay="284"/>
			<enemy name="unit2" delay="286"/>
			<enemy name="unit2" delay="288"/>
			<enemy name="unit2" delay="290"/>
			<enemy name="unit2" delay="292"/>
			<enemy name="unit2" delay="294"/>
			
			<enemy name="airplane" delay="180"/>
			<enemy name="airplane" delay="185"/>
			<enemy name="airplane" delay="190"/>
			<enemy name="airplane" delay="195"/>
			
			<!-- tanket  -->
			<enemy name="tanket" delay="20"/>
			<enemy name="tanket" delay="25"/>
			<enemy name="tanket" delay="30"/>
			<enemy name="tanket" delay="35"/>
			<enemy name="tanket" delay="40"/>
			<enemy name="tanket" delay="43"/>
			<enemy name="tanket" delay="46"/>
			<enemy name="tanket" delay="49"/>
			
			<!-- car or balloon  -->
			<enemy name="balloon" delay="40"/>
			<enemy name="balloon" delay="44"/>
			<enemy name="balloon" delay="48"/>
			<enemy name="balloon" delay="52"/>
			<enemy name="balloon" delay="56"/>
			<enemy name="balloon" delay="60"/>
			<enemy name="balloon" delay="63"/>
			<enemy name="balloon" delay="66"/>
			<enemy name="balloon" delay="69"/>
			<enemy name="balloon" delay="72"/>
			<enemy name="balloon" delay="75"/>
			<enemy name="balloon" delay="78"/>
			
			<!-- cars -->
			<enemy name="car" delay="90"/>
			<enemy name="car" delay="100"/>
			<enemy name="car" delay="110"/>
			<enemy name="car" delay="120"/>
			<enemy name="car" delay="130"/>
			<enemy name="car" delay="140"/>
			<enemy name="car" delay="150"/>
			<enemy name="car" delay="170"/>
			<enemy name="car" delay="190"/>
			<enemy name="car" delay="220"/>
			<enemy name="car" delay="260"/>
			
			<!-- aerostat or tank1 -->
			<enemy name="tank1" delay="85"/>
			<enemy name="tank1" delay="95"/>
			<enemy name="tank1" delay="105"/>
			<enemy name="tank1" delay="115"/>
			
			<!-- aerostats  -->
			<enemy name="aerostat" delay="120"/>
			<enemy name="aerostat" delay="130"/>
			<enemy name="aerostat" delay="140"/>
			<enemy name="aerostat" delay="160"/>
			<enemy name="aerostat" delay="200"/>
			<enemy name="aerostat" delay="240"/>
			<enemy name="aerostat" delay="280"/>
			
			<!-- tanks -->
			<enemy name="tank1" delay="140"/>
			<enemy name="tank2" delay="160"/>
			<enemy name="tank1" delay="180"/>
			<enemy name="tank2" delay="200"/>
			<enemy name="tank1" delay="220"/>
			<enemy name="tank2" delay="240"/>
			<enemy name="tank1" delay="260"/>
			<enemy name="tank1" delay="280"/>
			
			<enemy name="tank3" delay="170"/>
			<enemy name="tank3" delay="180"/>
			
			<!-- parashuts -->
			<enemy name="parashut" delay="180"/>
			<enemy name="parashut" delay="183"/>
			<enemy name="parashut" delay="186"/>
			<enemy name="parashut" delay="190"/>
			<enemy name="parashut" delay="193"/>
			<enemy name="parashut" delay="196"/>
			<enemy name="parashut" delay="200"/>
			<enemy name="parashut" delay="203"/>
			<enemy name="parashut" delay="206"/>
			<enemy name="parashut" delay="210"/>
			<enemy name="parashut" delay="203"/>
			<enemy name="parashut" delay="216"/>
			<enemy name="parashut" delay="220"/>
			<enemy name="parashut" delay="223"/>
			<enemy name="parashut" delay="226"/>
			<enemy name="parashut" delay="230"/>
			<enemy name="parashut" delay="233"/>
			<enemy name="parashut" delay="236"/>
			<enemy name="parashut" delay="240"/>
			<enemy name="parashut" delay="243"/>
			<enemy name="parashut" delay="246"/>
			<enemy name="parashut" delay="250"/>
			<enemy name="parashut" delay="253"/>
			<enemy name="parashut" delay="256"/>
			<enemy name="parashut" delay="260"/>
			
			<!-- Heli or walker  -->
			<enemy name="heli" delay="190"/>
			<enemy name="heli" delay="194"/>
			<enemy name="heli" delay="198"/>
			<enemy name="heli" delay="200"/>
			<enemy name="heli" delay="204"/>
			<enemy name="heli" delay="208"/>
			<enemy name="heli" delay="212"/>
			<enemy name="heli" delay="216"/>
			<enemy name="heli" delay="220"/>
			<enemy name="heli" delay="225"/>
			<enemy name="heli" delay="230"/>
			
			<!-- heli -->
			<enemy name="heli" delay="260"/>
			<enemy name="heli" delay="270"/>
			<enemy name="heli" delay="280"/>
			<enemy name="heli" delay="290"/>
			
			<!-- walker -->
			<enemy name="walker1" delay="255"/>
			<enemy name="walker1" delay="265"/>
			<enemy name="walker1" delay="275"/>
			<enemy name="walker1" delay="285"/>
			
			<!-- Final -->
			<enemy name="walker2" delay="300"/>
			<enemy name="airship" delay="320"/>
			<enemy name="tank4" delay="350"/>
			
		<!-- ////////////////////////////////////////////////////////////////////////////////////// -->
		<!-- ////////////////////////////////////////////////////////////////////////////////////// -->
		<!-- ////////////////////////////////////////////////////////////////////////////////////// -->
		</wave>
		<wave pause="0" lifeTime="10" side="right" img="1">
		<!-- ////////////////////////////////////////////////////////////////////////////////////// -->
		<!-- ////////////////////////////////////////////////////////////////////////////////////// -->
		<!-- ////////////////////////////////////////////////////////////////////////////////////// -->
		<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit1" delay="6"/>
			<enemy name="unit1" delay="7"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="12"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit1" delay="17"/>
			<enemy name="unit1" delay="19"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="12"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit1" delay="17"/>
			<enemy name="unit1" delay="19"/>
			<enemy name="unit1" delay="20"/>
			<enemy name="unit1" delay="21"/>
			<enemy name="unit1" delay="22"/>
			<enemy name="unit1" delay="23"/>
			<enemy name="unit1" delay="24"/>
			<enemy name="unit1" delay="25"/>
			<enemy name="unit1" delay="26"/>
			<enemy name="unit1" delay="27"/>
			<enemy name="unit1" delay="28"/>
			<enemy name="unit1" delay="29"/>
			<enemy name="unit1" delay="30"/>
			
			<enemy name="unit1" delay="50"/>
			<enemy name="unit1" delay="51"/>
			<enemy name="unit1" delay="52"/>
			<enemy name="unit1" delay="53"/>
			<enemy name="unit1" delay="54"/>
			<enemy name="unit1" delay="55"/>
			<enemy name="unit1" delay="56"/>
			<enemy name="unit1" delay="57"/>
			<enemy name="unit1" delay="58"/>
			<enemy name="unit1" delay="59"/>
			<enemy name="unit1" delay="60"/>
			
			<enemy name="unit1" delay="71"/>
			<enemy name="unit1" delay="72"/>
			<enemy name="unit1" delay="73"/>
			<enemy name="unit1" delay="74"/>
			<enemy name="unit1" delay="75"/>
			<enemy name="unit1" delay="76"/>
			<enemy name="unit1" delay="77"/>
			<enemy name="unit1" delay="78"/>
			<enemy name="unit1" delay="79"/>
			<enemy name="unit1" delay="80"/>
			<enemy name="unit1" delay="81"/>
			<enemy name="unit1" delay="82"/>
			<enemy name="unit1" delay="83"/>
			<enemy name="unit1" delay="84"/>
			<enemy name="unit1" delay="85"/>
			<enemy name="unit1" delay="86"/>
			<enemy name="unit1" delay="87"/>
			<enemy name="unit1" delay="88"/>
			<enemy name="unit1" delay="89"/>
			<enemy name="unit1" delay="90"/>
			<enemy name="unit1" delay="101"/>
			<enemy name="unit1" delay="102"/>
			<enemy name="unit1" delay="103"/>
			<enemy name="unit1" delay="104"/>
			<enemy name="unit1" delay="105"/>
			<enemy name="unit1" delay="106"/>
			<enemy name="unit1" delay="107"/>
			<enemy name="unit1" delay="108"/>
			<enemy name="unit1" delay="109"/>
			<enemy name="unit1" delay="110"/>
			<enemy name="unit1" delay="111"/>
			<enemy name="unit1" delay="112"/>
			<enemy name="unit1" delay="113"/>
			<enemy name="unit1" delay="114"/>
			<enemy name="unit1" delay="115"/>
			<enemy name="unit1" delay="116"/>
			<enemy name="unit1" delay="117"/>
			<enemy name="unit1" delay="118"/>
			<enemy name="unit1" delay="119"/>
			<enemy name="unit1" delay="120"/>
			
			<enemy name="unit1" delay="151"/>
			<enemy name="unit1" delay="152"/>
			<enemy name="unit1" delay="153"/>
			<enemy name="unit1" delay="154"/>
			<enemy name="unit1" delay="155"/>
			<enemy name="unit1" delay="156"/>
			<enemy name="unit1" delay="157"/>
			<enemy name="unit1" delay="158"/>
			<enemy name="unit1" delay="159"/>
			<enemy name="unit1" delay="160"/>
			<enemy name="unit1" delay="161"/>
			<enemy name="unit1" delay="162"/>
			<enemy name="unit1" delay="163"/>
			<enemy name="unit1" delay="164"/>
			<enemy name="unit1" delay="165"/>
			<enemy name="unit1" delay="166"/>
			<enemy name="unit1" delay="167"/>
			<enemy name="unit1" delay="168"/>
			<enemy name="unit1" delay="169"/>
			<enemy name="unit1" delay="170"/>
			<enemy name="unit1" delay="171"/>
			<enemy name="unit1" delay="172"/>
			<enemy name="unit1" delay="173"/>
			<enemy name="unit1" delay="174"/>
			<enemy name="unit1" delay="175"/>
			<enemy name="unit1" delay="176"/>
			<enemy name="unit1" delay="177"/>
			<enemy name="unit1" delay="178"/>
			<enemy name="unit1" delay="179"/>
			<enemy name="unit1" delay="180"/>
			
			<enemy name="unit1" delay="221"/>
			<enemy name="unit1" delay="222"/>
			<enemy name="unit1" delay="223"/>
			<enemy name="unit1" delay="224"/>
			<enemy name="unit1" delay="225"/>
			<enemy name="unit1" delay="226"/>
			<enemy name="unit1" delay="227"/>
			<enemy name="unit1" delay="228"/>
			<enemy name="unit1" delay="229"/>
			<enemy name="unit1" delay="230"/>
			<enemy name="unit1" delay="231"/>
			<enemy name="unit1" delay="232"/>
			<enemy name="unit1" delay="233"/>
			<enemy name="unit1" delay="234"/>
			<enemy name="unit1" delay="235"/>
			<enemy name="unit1" delay="236"/>
			<enemy name="unit1" delay="237"/>
			<enemy name="unit1" delay="238"/>
			<enemy name="unit1" delay="239"/>
			<enemy name="unit1" delay="240"/>
			<enemy name="unit1" delay="241"/>
			<enemy name="unit1" delay="242"/>
			<enemy name="unit1" delay="243"/>
			<enemy name="unit1" delay="244"/>
			<enemy name="unit1" delay="245"/>
			<enemy name="unit1" delay="246"/>
			<enemy name="unit1" delay="247"/>
			<enemy name="unit1" delay="248"/>
			<enemy name="unit1" delay="249"/>
			<enemy name="unit1" delay="250"/>
			
			<enemy name="unit1" delay="261"/>
			<enemy name="unit1" delay="262"/>
			<enemy name="unit1" delay="263"/>
			<enemy name="unit1" delay="264"/>
			<enemy name="unit1" delay="265"/>
			<enemy name="unit1" delay="266"/>
			<enemy name="unit1" delay="267"/>
			<enemy name="unit1" delay="268"/>
			<enemy name="unit1" delay="269"/>
			<enemy name="unit1" delay="270"/>
			<enemy name="unit1" delay="271"/>
			<enemy name="unit1" delay="272"/>
			<enemy name="unit1" delay="273"/>
			<enemy name="unit1" delay="274"/>
			<enemy name="unit1" delay="275"/>
			<enemy name="unit1" delay="276"/>
			<enemy name="unit1" delay="277"/>
			<enemy name="unit1" delay="278"/>
			<enemy name="unit1" delay="279"/>
			<enemy name="unit1" delay="280"/>
			<enemy name="unit1" delay="281"/>
			<enemy name="unit1" delay="282"/>
			<enemy name="unit1" delay="283"/>
			<enemy name="unit1" delay="284"/>
			<enemy name="unit1" delay="285"/>
			<enemy name="unit1" delay="286"/>
			<enemy name="unit1" delay="287"/>
			<enemy name="unit1" delay="288"/>
			<enemy name="unit1" delay="289"/>
			<enemy name="unit1" delay="290"/>
			<enemy name="unit1" delay="291"/>
			<enemy name="unit1" delay="292"/>
			<enemy name="unit1" delay="293"/>
			<enemy name="unit1" delay="294"/>
			<enemy name="unit1" delay="295"/>
			<enemy name="unit1" delay="296"/>
			<enemy name="unit1" delay="297"/>
			<enemy name="unit1" delay="298"/>
			<enemy name="unit1" delay="299"/>
			<enemy name="unit1" delay="300"/>
			
			<!-- unit2  -->
			<enemy name="unit2" delay="80"/>
			<enemy name="unit2" delay="82"/>
			<enemy name="unit2" delay="84"/>
			<enemy name="unit2" delay="86"/>
			<enemy name="unit2" delay="88"/>
			<enemy name="unit2" delay="90"/>
			<enemy name="unit2" delay="92"/>
			<enemy name="unit2" delay="94"/>
			<enemy name="unit2" delay="96"/>
			<enemy name="unit2" delay="98"/>
			<enemy name="unit2" delay="100"/>
			
			<enemy name="unit2" delay="120"/>
			<enemy name="unit2" delay="122"/>
			<enemy name="unit2" delay="124"/>
			<enemy name="unit2" delay="126"/>
			<enemy name="unit2" delay="128"/>
			<enemy name="unit2" delay="130"/>
			<enemy name="unit2" delay="132"/>
			<enemy name="unit2" delay="134"/>
			<enemy name="unit2" delay="136"/>
			<enemy name="unit2" delay="138"/>
			<enemy name="unit2" delay="140"/>
			<enemy name="unit2" delay="142"/>
			<enemy name="unit2" delay="144"/>
			<enemy name="unit2" delay="146"/>
			<enemy name="unit2" delay="148"/>
			<enemy name="unit2" delay="150"/>
			
			<enemy name="unit2" delay="170"/>
			<enemy name="unit2" delay="172"/>
			<enemy name="unit2" delay="174"/>
			<enemy name="unit2" delay="176"/>
			<enemy name="unit2" delay="178"/>
			<enemy name="unit2" delay="180"/>
			<enemy name="unit2" delay="182"/>
			<enemy name="unit2" delay="184"/>
			<enemy name="unit2" delay="186"/>
			<enemy name="unit2" delay="188"/>
			<enemy name="unit2" delay="190"/>
			<enemy name="unit2" delay="192"/>
			<enemy name="unit2" delay="194"/>
			<enemy name="unit2" delay="196"/>
			<enemy name="unit2" delay="198"/>
			<enemy name="unit2" delay="200"/>
			
			<enemy name="unit2" delay="230"/>
			<enemy name="unit2" delay="232"/>
			<enemy name="unit2" delay="234"/>
			<enemy name="unit2" delay="236"/>
			<enemy name="unit2" delay="238"/>
			<enemy name="unit2" delay="240"/>
			<enemy name="unit2" delay="242"/>
			<enemy name="unit2" delay="244"/>
			<enemy name="unit2" delay="246"/>
			<enemy name="unit2" delay="248"/>
			<enemy name="unit2" delay="252"/>
			<enemy name="unit2" delay="254"/>
			<enemy name="unit2" delay="256"/>
			<enemy name="unit2" delay="258"/>
			<enemy name="unit2" delay="260"/>
			<enemy name="unit2" delay="262"/>
			<enemy name="unit2" delay="264"/>
			<enemy name="unit2" delay="266"/>
			<enemy name="unit2" delay="268"/>
			<enemy name="unit2" delay="270"/>
			<enemy name="unit2" delay="272"/>
			<enemy name="unit2" delay="274"/>
			<enemy name="unit2" delay="276"/>
			<enemy name="unit2" delay="278"/>
			<enemy name="unit2" delay="280"/>
			<enemy name="unit2" delay="282"/>
			<enemy name="unit2" delay="284"/>
			<enemy name="unit2" delay="286"/>
			<enemy name="unit2" delay="288"/>
			<enemy name="unit2" delay="290"/>
			<enemy name="unit2" delay="292"/>
			<enemy name="unit2" delay="294"/>
			
			<!-- tanket  -->
			<enemy name="tanket" delay="20"/>
			<enemy name="tanket" delay="25"/>
			<enemy name="tanket" delay="30"/>
			<enemy name="tanket" delay="35"/>
			<enemy name="tanket" delay="40"/>
			<enemy name="tanket" delay="43"/>
			<enemy name="tanket" delay="46"/>
			<enemy name="tanket" delay="49"/>
			
			<!-- car or balloon  -->
		
			<enemy name="car" delay="40"/>
			<enemy name="car" delay="45"/>
			<enemy name="car" delay="50"/>
			<enemy name="car" delay="55"/>
			<enemy name="car" delay="60"/>
			<enemy name="car" delay="65"/>
			<enemy name="car" delay="70"/>
			<enemy name="car" delay="75"/>
			
			<!-- cars -->
			<enemy name="car" delay="90"/>
			<enemy name="car" delay="100"/>
			<enemy name="car" delay="110"/>
			<enemy name="car" delay="120"/>
			<enemy name="car" delay="130"/>
			<enemy name="car" delay="140"/>
			<enemy name="car" delay="150"/>
			<enemy name="car" delay="170"/>
			<enemy name="car" delay="190"/>
			<enemy name="car" delay="220"/>
			<enemy name="car" delay="260"/>
			
			<!-- aerostat or tank1 -->
			<enemy name="aerostat" delay="80"/>
			<enemy name="aerostat" delay="85"/>
			<enemy name="aerostat" delay="90"/>
			<enemy name="aerostat" delay="95"/>
			<enemy name="aerostat" delay="100"/>
			<enemy name="aerostat" delay="105"/>
			<enemy name="aerostat" delay="110"/>
			
			<!-- aerostats  -->
			<enemy name="aerostat" delay="120"/>
			<enemy name="aerostat" delay="130"/>
			<enemy name="aerostat" delay="140"/>
			<enemy name="aerostat" delay="160"/>
			<enemy name="aerostat" delay="200"/>
			<enemy name="aerostat" delay="240"/>
			<enemy name="aerostat" delay="280"/>
			
			<!-- tanks -->
			<enemy name="tank1" delay="140"/>
			<enemy name="tank2" delay="160"/>
			<enemy name="tank1" delay="180"/>
			<enemy name="tank2" delay="200"/>
			<enemy name="tank1" delay="220"/>
			<enemy name="tank2" delay="240"/>
			<enemy name="tank2" delay="260"/>
			<enemy name="tank1" delay="280"/>
			
			<enemy name="tank3" delay="150"/>
			<enemy name="tank3" delay="160"/>
			
			
			<!-- parashuts -->
			<enemy name="parashut" delay="180"/>
			<enemy name="parashut" delay="183"/>
			<enemy name="parashut" delay="186"/>
			<enemy name="parashut" delay="190"/>
			<enemy name="parashut" delay="193"/>
			<enemy name="parashut" delay="196"/>
			<enemy name="parashut" delay="200"/>
			<enemy name="parashut" delay="203"/>
			<enemy name="parashut" delay="206"/>
			<enemy name="parashut" delay="210"/>
			<enemy name="parashut" delay="203"/>
			<enemy name="parashut" delay="216"/>
			<enemy name="parashut" delay="220"/>
			<enemy name="parashut" delay="223"/>
			<enemy name="parashut" delay="226"/>
			<enemy name="parashut" delay="230"/>
			<enemy name="parashut" delay="233"/>
			<enemy name="parashut" delay="236"/>
			<enemy name="parashut" delay="240"/>
			<enemy name="parashut" delay="243"/>
			<enemy name="parashut" delay="246"/>
			<enemy name="parashut" delay="250"/>
			<enemy name="parashut" delay="253"/>
			<enemy name="parashut" delay="256"/>
			<enemy name="parashut" delay="260"/>
			
			<enemy name="airplane" delay="180"/>
			<enemy name="airplane" delay="185"/>
			<enemy name="airplane" delay="190"/>
			<enemy name="airplane" delay="195"/>
			
			<!-- Heli or walker  -->
			<enemy name="walker1" delay="190"/>
			<enemy name="walker1" delay="200"/>
			<enemy name="walker1" delay="212"/>
			<enemy name="walker1" delay="225"/>
			
			<!-- heli -->
			<enemy name="heli" delay="260"/>
			<enemy name="heli" delay="270"/>
			<enemy name="heli" delay="280"/>
			<enemy name="heli" delay="290"/>
			
			<!-- walker -->
			<enemy name="walker1" delay="255"/>
			<enemy name="walker1" delay="265"/>
			<enemy name="walker1" delay="275"/>
			<enemy name="walker1" delay="285"/>
			
			<!-- Final -->
			<enemy name="walker2" delay="300"/>
			<enemy name="airship" delay="320"/>
			<enemy name="tank4" delay="350"/>
		</wave>
	</group>
</level>;
            this.levels.push(_loc_2);
            this.levels.push(_loc_3);
            this.levels.push(_loc_4);
            this.levels.push(_loc_5);
            this.levels.push(_loc_6);
            this.levels.push(_loc_7);
            this.levels.push(_loc_8);
            this.levels.push(_loc_9);
            this.levels.push(_loc_10);
            this.levels.push(_loc_11);
            this.levels.push(_loc_12);
            this.levels.push(_loc_13);
            this.levels.push(_loc_14);
            this.levels.push(_loc_15);
            this.levels.push(_loc_16);
            var _loc_17:* = <level eye=""off"" money=""17000"" maxTower=""2"" bg=""1"" maxUpgrade=""0"" upgradeTwo=""false"" threeStarHealth=""80"" twiStarHealth=""60"" preStartMoney=""1000"">
n
n	t<!-- 
n	tПушки
n	tстолбец - 0 лев, 1 центр, 2 прав
n	tстрока -  0 подвал, 1 первый, 2 второй, ...
n	tиндексы апгрейдов 
n	t1 - upgr2, 
n	t2 - upgr3_1, 
n	t3 - upgr4_1, 
n	t4 - upgr3_2, 
n	t5 - upgr4_2
n	t
n	tзначения для глаза(eye)  off, normal, always
n	t-->
n	t
n	t<settings towerLevel=""2"" towerHealth=""20"" globalUpgrades=""1"" maxCannons=""2"" machinegun=""true"" heavygun=""true"" lightning=""true"" saws=""true"" score=""30000"">
n	t	t<!--
n	t    <cannon name=""saw"" upgr=""5"" col=""0"" row=""1""/>
n	t	t<cannon name=""heavygun"" upgr=""0"" col=""2"" row=""1""/>
n	t	t-->
n	t</settings>
n	t
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""120"" side=""left"" img=""1"">
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""5.5""/>
n	t	t	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""10.5""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit1"" delay=""16.5""/>
n	t	t	t<enemy name=""unit1"" delay=""17""/>
n	t	t	t<enemy name=""unit1"" delay=""19""/>
n	t	t	t<enemy name=""unit1"" delay=""20""/>
n	t	t	t<enemy name=""unit1"" delay=""21""/>
n	t	t	t<enemy name=""unit1"" delay=""22""/>
n	t	t	t
n	t	t	t<enemy name=""unit2"" delay=""25""/>
n	t	t	t<enemy name=""unit2"" delay=""32""/>
n	t	t	t<enemy name=""unit2"" delay=""40""/>
n	t	t	t
n	t	t	t<enemy name=""unit1"" delay=""51""/>
n	t	t	t<enemy name=""unit1"" delay=""51""/>
n	t	t	t<enemy name=""unit1"" delay=""51""/>
n	t	t	t<enemy name=""unit1"" delay=""52""/>
n	t	t	t<enemy name=""unit1"" delay=""52""/>
n	t	t	t
n	t	t	t<enemy name=""unit2"" delay=""55""/>
n	t	t	t<enemy name=""unit2"" delay=""68""/>
n	t	t	t<enemy name=""unit2"" delay=""80""/>
n	t	t</wave>
n	t	t<!-- //////////////////// -->
n	t	t<wave pause=""0"" lifeTime=""120"" side=""right"" img=""1"">
n	t	t  	t<enemy name=""unit1"" delay=""20""/>
n	t	t	t<enemy name=""unit1"" delay=""21""/>
n	t	t	t<enemy name=""unit1"" delay=""22""/>
n	t	t	t<enemy name=""unit1"" delay=""23""/>
n	t	t	t<enemy name=""unit1"" delay=""24""/>
n	t	t	t<enemy name=""unit1"" delay=""25""/>
n	t	t	t<enemy name=""unit1"" delay=""26""/>
n	t	t	t<enemy name=""unit1"" delay=""27""/>
n	t	t	t
n	t	t	t<enemy name=""unit1"" delay=""30""/>
n	t	t	t<enemy name=""unit1"" delay=""35""/>
n	t	t	t<enemy name=""unit1"" delay=""40""/>
n	t	t	t<enemy name=""unit1"" delay=""45""/>
n	t	t	t<enemy name=""unit1"" delay=""50""/>
n	t	t	t
n	t	t	t<enemy name=""unit2"" delay=""60""/>
n	t	t	t<enemy name=""unit2"" delay=""72""/>
n	t	t</wave>
n	t</group>
n</level>")("<level eye="off" money="17000" maxTower="2" bg="1" maxUpgrade="0" upgradeTwo="false" threeStarHealth="80" twiStarHealth="60" preStartMoney="1000">

	<!-- 
	Пушки
	столбец - 0 лев, 1 центр, 2 прав
	строка -  0 подвал, 1 первый, 2 второй, ...
	индексы апгрейдов 
	1 - upgr2, 
	2 - upgr3_1, 
	3 - upgr4_1, 
	4 - upgr3_2, 
	5 - upgr4_2
	
	значения для глаза(eye)  off, normal, always
	-->
	
	<settings towerLevel="2" towerHealth="20" globalUpgrades="1" maxCannons="2" machinegun="true" heavygun="true" lightning="true" saws="true" score="30000">
		<!--
	    <cannon name="saw" upgr="5" col="0" row="1"/>
		<cannon name="heavygun" upgr="0" col="2" row="1"/>
		-->
	</settings>
	
	<group pause="0">
		<wave pause="0" lifeTime="120" side="left" img="1">
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit1" delay="5.5"/>
			<enemy name="unit1" delay="7"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="10.5"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit1" delay="16.5"/>
			<enemy name="unit1" delay="17"/>
			<enemy name="unit1" delay="19"/>
			<enemy name="unit1" delay="20"/>
			<enemy name="unit1" delay="21"/>
			<enemy name="unit1" delay="22"/>
			
			<enemy name="unit2" delay="25"/>
			<enemy name="unit2" delay="32"/>
			<enemy name="unit2" delay="40"/>
			
			<enemy name="unit1" delay="51"/>
			<enemy name="unit1" delay="51"/>
			<enemy name="unit1" delay="51"/>
			<enemy name="unit1" delay="52"/>
			<enemy name="unit1" delay="52"/>
			
			<enemy name="unit2" delay="55"/>
			<enemy name="unit2" delay="68"/>
			<enemy name="unit2" delay="80"/>
		</wave>
		<!-- //////////////////// -->
		<wave pause="0" lifeTime="120" side="right" img="1">
		  	<enemy name="unit1" delay="20"/>
			<enemy name="unit1" delay="21"/>
			<enemy name="unit1" delay="22"/>
			<enemy name="unit1" delay="23"/>
			<enemy name="unit1" delay="24"/>
			<enemy name="unit1" delay="25"/>
			<enemy name="unit1" delay="26"/>
			<enemy name="unit1" delay="27"/>
			
			<enemy name="unit1" delay="30"/>
			<enemy name="unit1" delay="35"/>
			<enemy name="unit1" delay="40"/>
			<enemy name="unit1" delay="45"/>
			<enemy name="unit1" delay="50"/>
			
			<enemy name="unit2" delay="60"/>
			<enemy name="unit2" delay="72"/>
		</wave>
	</group>
</level>;
            var _loc_18:* = <level eye=""off"" money=""20000"" maxTower=""3"" bg=""1"" maxUpgrade=""1"" upgradeTwo=""false"" threeStarHealth=""80"" twiStarHealth=""60"" preStartMoney=""1000"">
n	t
n<!-- 
n	tПушки
n	tстолбец - 0 лев, 1 центр, 2 прав
n	tстрока -  0 подвал, 1 первый, 2 второй, ...
n	tиндексы апгрейдов 
n	t1 - upgr2, 
n	t2 - upgr3_1, 
n	t3 - upgr4_1, 
n	t4 - upgr3_2, 
n	t5 - upgr4_2
n	t
n	tзначения для глаза(eye)  off, normal, always
n	t-->
n	t
n	t<settings towerLevel=""2"" towerHealth=""30"" globalUpgrades=""1"" maxCannons=""4"" machinegun=""false"" heavygun=""true"" lightning=""true"" saws=""true"" score=""32000"">
n	t	t<!--
n	t    <cannon name=""saw"" upgr=""5"" col=""0"" row=""1""/>
n	t	t<cannon name=""heavygun"" upgr=""0"" col=""2"" row=""1""/>
n	t	t-->
n	t</settings>
n
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""40"" side=""left"" img=""1"">
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""12""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit1"" delay=""17""/>
n	t	t	t<enemy name=""unit1"" delay=""18""/>
n	t	t	t<enemy name=""unit1"" delay=""19""/>
n	t	t	t<enemy name=""unit1"" delay=""20""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""40"" side=""right"" img=""1"">
n	t	t    <enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit2"" delay=""10""/>
n	t	t	t<enemy name=""unit2"" delay=""12""/>
n	t	t	t<enemy name=""unit2"" delay=""14""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""5"" side=""left"" img=""1"">
n	t	t	t<enemy name=""unit2"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""wheel"" delay=""4""/>
n	t	t	t<enemy name=""wheel"" delay=""15""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""5"" side=""right"" img=""1"">
n	t	t	t<enemy name=""unit2"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""wheel"" delay=""4""/>
n	t	t	t<enemy name=""wheel"" delay=""15""/>
n	t	t</wave>
n	t</group>
n	t
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""5"" side=""left"" img=""1"">
n	t	t        <enemy name=""unit1"" delay=""1""/>
n	t	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t	t<enemy name=""unit2"" delay=""2""/>
n	t	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t	t<enemy name=""unit2"" delay=""12""/>
n	t	t	t	t<enemy name=""wheel"" delay=""4""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""5"" side=""right"" img=""1"">
n	t	t        <enemy name=""unit1"" delay=""1""/>
n	t	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t	t<enemy name=""unit2"" delay=""2""/>
n	t	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t	t<enemy name=""unit2"" delay=""12""/>
n	t	t	t	t<enemy name=""wheel"" delay=""4""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""3"">
n	t	t<wave pause=""0"" lifeTime=""10"" side=""left"" img=""1"">
n	t	t	t	t<enemy name=""wheel"" delay=""4""/>
n	t	t	t	t<enemy name=""wheel"" delay=""5""/>
n	t	t	t	t<enemy name=""wheel"" delay=""6""/>
n	t	t	t	t<enemy name=""wheel"" delay=""7""/>
n	t	t	t	t<enemy name=""wheel"" delay=""8""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""5"">
n	t	t<wave pause=""0"" lifeTime=""40"" side=""left"" img=""1"">
n	t	t	t	t<enemy name=""unit2"" delay=""2""/>
n	t	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t	t<enemy name=""unit2"" delay=""4""/>
n	t	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t	t<enemy name=""unit2"" delay=""6""/>
n	t	t	t	t<enemy name=""unit2"" delay=""7""/>
n	t	t	t	t<enemy name=""unit2"" delay=""8""/>
n	t	t	t	t<enemy name=""unit2"" delay=""9""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""40"" side=""right"" img=""1"">
n	t	t        <enemy name=""unit2"" delay=""2""/>
n	t	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t	t<enemy name=""unit2"" delay=""4""/>
n	t	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t	t<enemy name=""unit2"" delay=""6""/>
n	t	t	t	t<enemy name=""unit2"" delay=""7""/>
n	t	t	t	t<enemy name=""unit2"" delay=""8""/>
n	t	t	t	t<enemy name=""unit2"" delay=""9""/>
n	t	t</wave>
n	t</group>
n	t
n</level>")("<level eye="off" money="20000" maxTower="3" bg="1" maxUpgrade="1" upgradeTwo="false" threeStarHealth="80" twiStarHealth="60" preStartMoney="1000">
	
<!-- 
	Пушки
	столбец - 0 лев, 1 центр, 2 прав
	строка -  0 подвал, 1 первый, 2 второй, ...
	индексы апгрейдов 
	1 - upgr2, 
	2 - upgr3_1, 
	3 - upgr4_1, 
	4 - upgr3_2, 
	5 - upgr4_2
	
	значения для глаза(eye)  off, normal, always
	-->
	
	<settings towerLevel="2" towerHealth="30" globalUpgrades="1" maxCannons="4" machinegun="false" heavygun="true" lightning="true" saws="true" score="32000">
		<!--
	    <cannon name="saw" upgr="5" col="0" row="1"/>
		<cannon name="heavygun" upgr="0" col="2" row="1"/>
		-->
	</settings>

	<group pause="0">
		<wave pause="0" lifeTime="40" side="left" img="1">
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="12"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit1" delay="17"/>
			<enemy name="unit1" delay="18"/>
			<enemy name="unit1" delay="19"/>
			<enemy name="unit1" delay="20"/>
		</wave>
		<wave pause="0" lifeTime="40" side="right" img="1">
		    <enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit2" delay="10"/>
			<enemy name="unit2" delay="12"/>
			<enemy name="unit2" delay="14"/>
		</wave>
	</group>
	<group pause="0">
		<wave pause="0" lifeTime="5" side="left" img="1">
			<enemy name="unit2" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="wheel" delay="4"/>
			<enemy name="wheel" delay="15"/>
		</wave>
		<wave pause="0" lifeTime="5" side="right" img="1">
			<enemy name="unit2" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="wheel" delay="4"/>
			<enemy name="wheel" delay="15"/>
		</wave>
	</group>
	
	<group pause="0">
		<wave pause="0" lifeTime="5" side="left" img="1">
		        <enemy name="unit1" delay="1"/>
				<enemy name="unit1" delay="2"/>
				<enemy name="unit2" delay="2"/>
				<enemy name="unit1" delay="5"/>
				<enemy name="unit1" delay="9"/>
				<enemy name="unit2" delay="12"/>
				<enemy name="wheel" delay="4"/>
		</wave>
		<wave pause="0" lifeTime="5" side="right" img="1">
		        <enemy name="unit1" delay="1"/>
				<enemy name="unit1" delay="2"/>
				<enemy name="unit2" delay="2"/>
				<enemy name="unit1" delay="5"/>
				<enemy name="unit1" delay="9"/>
				<enemy name="unit2" delay="12"/>
				<enemy name="wheel" delay="4"/>
		</wave>
	</group>
	<group pause="3">
		<wave pause="0" lifeTime="10" side="left" img="1">
				<enemy name="wheel" delay="4"/>
				<enemy name="wheel" delay="5"/>
				<enemy name="wheel" delay="6"/>
				<enemy name="wheel" delay="7"/>
				<enemy name="wheel" delay="8"/>
		</wave>
	</group>
	<group pause="5">
		<wave pause="0" lifeTime="40" side="left" img="1">
				<enemy name="unit2" delay="2"/>
				<enemy name="unit1" delay="3"/>
				<enemy name="unit2" delay="4"/>
				<enemy name="unit1" delay="5"/>
				<enemy name="unit2" delay="6"/>
				<enemy name="unit2" delay="7"/>
				<enemy name="unit2" delay="8"/>
				<enemy name="unit2" delay="9"/>
		</wave>
		<wave pause="0" lifeTime="40" side="right" img="1">
		        <enemy name="unit2" delay="2"/>
				<enemy name="unit1" delay="3"/>
				<enemy name="unit2" delay="4"/>
				<enemy name="unit1" delay="5"/>
				<enemy name="unit2" delay="6"/>
				<enemy name="unit2" delay="7"/>
				<enemy name="unit2" delay="8"/>
				<enemy name="unit2" delay="9"/>
		</wave>
	</group>
	
</level>;
            var _loc_19:* = <level eye=""off"" money=""28000"" maxTower=""3"" bg=""1"" maxUpgrade=""1"" upgradeTwo=""false"" threeStarHealth=""80"" twiStarHealth=""60"" preStartMoney=""1000"">
n	t
n<!-- 
n	tПушки
n	tстолбец - 0 лев, 1 центр, 2 прав
n	tстрока -  0 подвал, 1 первый, 2 второй, ...
n	tиндексы апгрейдов 
n	t1 - upgr2, 
n	t2 - upgr3_1, 
n	t3 - upgr4_1, 
n	t4 - upgr3_2, 
n	t5 - upgr4_2
n	t
n	tзначения для глаза(eye)  off, normal, always
n	t-->
n	t
n	t<settings towerLevel=""2"" towerHealth=""40"" globalUpgrades=""1"" maxCannons=""6"" machinegun=""false"" heavygun=""false"" lightning=""false"" saws=""true"" score=""34000"">
n	t    <cannon name=""machinegun"" upgr=""1"" col=""0"" row=""2""/>
n	t	t<!--
n	t	t<cannon name=""heavygun"" upgr=""0"" col=""2"" row=""1""/>
n	t	t-->
n	t</settings>
n
n	t<group pause=""5"">
n	t	t<wave pause=""0"" lifeTime=""5"" side=""left"" img=""1"">
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""5"" side=""right"" img=""1"">
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""100"" side=""left"" img=""1"">
n	t	t	t<enemy name=""unit2"" delay=""0""/>
n	t	t	t<enemy name=""unit2"" delay=""5""/>
n	t	t	t<enemy name=""unit2"" delay=""10""/>
n	t	t	t<enemy name=""unit2"" delay=""15""/>
n	t	t	t<enemy name=""unit2"" delay=""2""/>
n	t	t	t<enemy name=""unit2"" delay=""7""/>
n	t	t	t<enemy name=""unit2"" delay=""12""/>
n	t	t	t<enemy name=""unit2"" delay=""17""/>
n	t	t	t
n	t	t	t <enemy name=""car"" delay=""40""/>
n	t	t	t <enemy name=""car"" delay=""50""/>
n	t	t	t <enemy name=""car"" delay=""60""/>
n	t	t	t <enemy name=""car"" delay=""70""/>
n	t	t	t 
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""100"" side=""right"" img=""1"">
n	t	t	t<enemy name=""unit2"" delay=""0""/>
n	t	t	t<enemy name=""unit2"" delay=""5""/>
n	t	t	t<enemy name=""unit2"" delay=""10""/>
n	t	t	t<enemy name=""unit2"" delay=""15""/>
n	t	t	t<enemy name=""unit2"" delay=""20""/>
n	t	t	t<enemy name=""unit1"" delay=""0""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""20""/>
n	t	t	t<enemy name=""wheel"" delay=""20""/>
n	t	t	t<enemy name=""wheel"" delay=""22""/>
n	t	t	t
n	t	t	t <enemy name=""car"" delay=""35""/>
n	t	t	t <enemy name=""car"" delay=""45""/>
n	t	t	t <enemy name=""car"" delay=""55""/>
n	t	t	t <enemy name=""car"" delay=""65""/>
n	t	t	t <enemy name=""unit2"" delay=""65""/>
n	t	t	t <enemy name=""unit2"" delay=""65.5""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""50"" side=""left"" img=""1"">
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""12""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit1"" delay=""17""/>
n	t	t	t<enemy name=""unit1"" delay=""18""/>
n	t	t	t<enemy name=""unit1"" delay=""19""/>
n	t	t	t<enemy name=""unit1"" delay=""20""/>
n	t	t	t<enemy name=""unit1"" delay=""21""/>
n	t	t	t<enemy name=""unit1"" delay=""21""/>
n	t	t	t<enemy name=""unit1"" delay=""22""/>
n	t	t	t<enemy name=""unit1"" delay=""23""/>
n	t	t	t<enemy name=""unit1"" delay=""24""/>
n	t	t	t<enemy name=""unit1"" delay=""12.5""/>
n	t	t	t<enemy name=""unit1"" delay=""14.5""/>
n	t	t	t<enemy name=""unit1"" delay=""16.5""/>
n	t	t	t<enemy name=""unit1"" delay=""18.5""/>
n	t	t	t<enemy name=""unit1"" delay=""20.5""/>
n	t	t	t<enemy name=""unit1"" delay=""21.5""/>
n	t	t	t<enemy name=""unit1"" delay=""23.5""/>
n	t	t	t<enemy name=""car"" delay=""26""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""5"" side=""right"" img=""1"">
n	t	t	t<enemy name=""car"" delay=""1""/>
n	t	t	t<enemy name=""car"" delay=""4""/>
n	t	t	t<enemy name=""car"" delay=""8""/>
n	t	t	t<enemy name=""car"" delay=""16""/>
n	t	t	t<enemy name=""car"" delay=""20""/>
n	t	t	t<enemy name=""car"" delay=""24""/>
n	t	t</wave>
n	t</group>
n</level>")("<level eye="off" money="28000" maxTower="3" bg="1" maxUpgrade="1" upgradeTwo="false" threeStarHealth="80" twiStarHealth="60" preStartMoney="1000">
	
<!-- 
	Пушки
	столбец - 0 лев, 1 центр, 2 прав
	строка -  0 подвал, 1 первый, 2 второй, ...
	индексы апгрейдов 
	1 - upgr2, 
	2 - upgr3_1, 
	3 - upgr4_1, 
	4 - upgr3_2, 
	5 - upgr4_2
	
	значения для глаза(eye)  off, normal, always
	-->
	
	<settings towerLevel="2" towerHealth="40" globalUpgrades="1" maxCannons="6" machinegun="false" heavygun="false" lightning="false" saws="true" score="34000">
	    <cannon name="machinegun" upgr="1" col="0" row="2"/>
		<!--
		<cannon name="heavygun" upgr="0" col="2" row="1"/>
		-->
	</settings>

	<group pause="5">
		<wave pause="0" lifeTime="5" side="left" img="1">
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit1" delay="11"/>
		</wave>
		<wave pause="0" lifeTime="5" side="right" img="1">
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit1" delay="11"/>
		</wave>
	</group>
	<group pause="0">
		<wave pause="0" lifeTime="100" side="left" img="1">
			<enemy name="unit2" delay="0"/>
			<enemy name="unit2" delay="5"/>
			<enemy name="unit2" delay="10"/>
			<enemy name="unit2" delay="15"/>
			<enemy name="unit2" delay="2"/>
			<enemy name="unit2" delay="7"/>
			<enemy name="unit2" delay="12"/>
			<enemy name="unit2" delay="17"/>
			
			 <enemy name="car" delay="40"/>
			 <enemy name="car" delay="50"/>
			 <enemy name="car" delay="60"/>
			 <enemy name="car" delay="70"/>
			 
		</wave>
		<wave pause="0" lifeTime="100" side="right" img="1">
			<enemy name="unit2" delay="0"/>
			<enemy name="unit2" delay="5"/>
			<enemy name="unit2" delay="10"/>
			<enemy name="unit2" delay="15"/>
			<enemy name="unit2" delay="20"/>
			<enemy name="unit1" delay="0"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="20"/>
			<enemy name="wheel" delay="20"/>
			<enemy name="wheel" delay="22"/>
			
			 <enemy name="car" delay="35"/>
			 <enemy name="car" delay="45"/>
			 <enemy name="car" delay="55"/>
			 <enemy name="car" delay="65"/>
			 <enemy name="unit2" delay="65"/>
			 <enemy name="unit2" delay="65.5"/>
		</wave>
	</group>
	<group pause="0">
		<wave pause="0" lifeTime="50" side="left" img="1">
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="12"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit1" delay="17"/>
			<enemy name="unit1" delay="18"/>
			<enemy name="unit1" delay="19"/>
			<enemy name="unit1" delay="20"/>
			<enemy name="unit1" delay="21"/>
			<enemy name="unit1" delay="21"/>
			<enemy name="unit1" delay="22"/>
			<enemy name="unit1" delay="23"/>
			<enemy name="unit1" delay="24"/>
			<enemy name="unit1" delay="12.5"/>
			<enemy name="unit1" delay="14.5"/>
			<enemy name="unit1" delay="16.5"/>
			<enemy name="unit1" delay="18.5"/>
			<enemy name="unit1" delay="20.5"/>
			<enemy name="unit1" delay="21.5"/>
			<enemy name="unit1" delay="23.5"/>
			<enemy name="car" delay="26"/>
		</wave>
		<wave pause="0" lifeTime="5" side="right" img="1">
			<enemy name="car" delay="1"/>
			<enemy name="car" delay="4"/>
			<enemy name="car" delay="8"/>
			<enemy name="car" delay="16"/>
			<enemy name="car" delay="20"/>
			<enemy name="car" delay="24"/>
		</wave>
	</group>
</level>;
            var _loc_20:* = <level eye=""always"" money=""20000"" maxTower=""3"" bg=""2"" maxUpgrade=""1"" upgradeTwo=""false"" threeStarHealth=""80"" twiStarHealth=""60"" preStartMoney=""1000"">
n	t
n<!-- 
n	tПушки
n	tстолбец - 0 лев, 1 центр, 2 прав
n	tстрока -  0 подвал, 1 первый, 2 второй, ...
n	tиндексы апгрейдов 
n	t1 - upgr2, 
n	t2 - upgr3_1, 
n	t3 - upgr4_1, 
n	t4 - upgr3_2, 
n	t5 - upgr4_2
n	t
n	tзначения для глаза(eye)  off, normal, always
n	t-->
n	t
n	t<settings towerLevel=""3"" towerHealth=""90"" globalUpgrades=""1"" maxCannons=""1"" machinegun=""false"" heavygun=""false"" lightning=""false"" saws=""false"" score=""36000"">
n	t    <!--
n	t	t<cannon name=""machinegun"" upgr=""1"" col=""0"" row=""2""/>
n	t	t<cannon name=""heavygun"" upgr=""0"" col=""2"" row=""1""/>
n	t	t-->
n	t</settings>
n
n	t<group pause=""5"">
n	t	t<wave pause=""0"" lifeTime=""100"" side=""left"" img=""1"">
n	t	t	t<enemy name=""aerostat"" delay=""1""/>
n	t	t	t<enemy name=""aerostat"" delay=""10""/>
n	t	t	t<enemy name=""aerostat"" delay=""20""/>
n	t	t	t<enemy name=""aerostat"" delay=""30""/>
n	t	t	t<enemy name=""aerostat"" delay=""40""/>
n	t	t	t<enemy name=""aerostat"" delay=""50""/>
n	t	t	t<enemy name=""aerostat"" delay=""60""/>
n	t	t	t
n	t	t	t<enemy name=""airplane"" delay=""30""/>
n	t	t	t<enemy name=""airplane"" delay=""32""/>
n	t	t	t<enemy name=""airplane"" delay=""34""/>
n	t	t	t<enemy name=""airplane"" delay=""50""/>
n	t	t	t<enemy name=""airplane"" delay=""55""/>
n	t	t	t
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""6""/>
n	t	t	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit1-line-3"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""6""/>
n	t	t	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit1-line-3"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""12""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit1"" delay=""17""/>
n	t	t	t<enemy name=""unit1"" delay=""18""/>
n	t	t	t<enemy name=""unit1"" delay=""19""/>
n	t	t	t<enemy name=""unit1-line-3"" delay=""20""/>
n	t	t	t<enemy name=""unit1"" delay=""21""/>
n	t	t	t<enemy name=""unit1"" delay=""22""/>
n	t	t	t<enemy name=""unit1"" delay=""23""/>
n	t	t	t<enemy name=""unit1"" delay=""24""/>
n	t	t	t<enemy name=""unit1"" delay=""25""/>
n	t	t	t<enemy name=""unit1"" delay=""26""/>
n	t	t	t<enemy name=""unit1"" delay=""27""/>
n	t	t	t<enemy name=""unit1"" delay=""28""/>
n	t	t	t<enemy name=""unit1"" delay=""29""/>
n	t	t	t<enemy name=""unit1-line-3"" delay=""30""/>
n	t	t	t<enemy name=""unit1"" delay=""31""/>
n	t	t	t<enemy name=""unit1"" delay=""32""/>
n	t	t	t<enemy name=""unit1"" delay=""33""/>
n	t	t	t<enemy name=""unit1"" delay=""34""/>
n	t	t	t<enemy name=""unit1"" delay=""35""/>
n	t	t	t<enemy name=""unit1"" delay=""36""/>
n	t	t	t<enemy name=""unit1"" delay=""37""/>
n	t	t	t<enemy name=""unit1"" delay=""38""/>
n	t	t	t<enemy name=""unit1"" delay=""39""/>
n	t	t	t<enemy name=""unit1-line-3"" delay=""50""/>
n	t	t	t<enemy name=""unit1-line-3"" delay=""51""/>
n	t	t	t
n	t	t	t<enemy name=""unit2"" delay=""30""/>
n	t	t	t<enemy name=""unit2"" delay=""32""/>
n	t	t	t<enemy name=""unit2"" delay=""34""/>
n	t	t	t<enemy name=""unit2"" delay=""36""/>
n	t	t	t<enemy name=""unit2"" delay=""38""/>
n	t	t	t<enemy name=""unit2"" delay=""40""/>
n	t	t	t<enemy name=""unit2"" delay=""42""/>
n	t	t	t<enemy name=""unit2"" delay=""44""/>
n	t	t	t<enemy name=""unit2"" delay=""46""/>
n	t	t	t<enemy name=""unit2"" delay=""48""/>
n	t	t	t<enemy name=""unit2"" delay=""50""/>
n	t	t	t<enemy name=""unit2"" delay=""51""/>
n	t	t	t<enemy name=""unit2"" delay=""52""/>
n	t	t	t<enemy name=""unit2"" delay=""53""/>
n	t	t	t<enemy name=""unit2"" delay=""54""/>
n	t	t	t<enemy name=""unit2"" delay=""55""/>
n	t	t	t<enemy name=""unit2"" delay=""56""/>
n	t	t	t<enemy name=""unit2"" delay=""57""/>
n	t	t	t<enemy name=""unit2"" delay=""58""/>
n	t	t	t<enemy name=""unit2"" delay=""59""/>
n	t	t	t
n	t	t	t<enemy name=""car"" delay=""10""/>
n	t	t	t<enemy name=""car"" delay=""20""/>
n	t	t	t<enemy name=""car"" delay=""30""/>
n	t	t	t<enemy name=""car"" delay=""35""/>
n	t	t	t<enemy name=""car"" delay=""40""/>
n	t	t	t<enemy name=""car"" delay=""45""/>
n	t	t	t<enemy name=""car"" delay=""50""/>
n	t	t	t
n	t	t	t<enemy name=""tank1"" delay=""45""/>
n	t	t	t<enemy name=""tank1"" delay=""55""/>
n	t	t	t<enemy name=""tank1"" delay=""60""/>
n	t	t	t<enemy name=""tank1"" delay=""65""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""100"" side=""right"" img=""1"">
n            <enemy name=""aerostat"" delay=""1""/>
n	t	t	t<enemy name=""aerostat"" delay=""10""/>
n	t	t	t<enemy name=""aerostat"" delay=""20""/>
n	t	t	t<enemy name=""aerostat"" delay=""30""/>
n	t	t	t<enemy name=""aerostat"" delay=""40""/>
n	t	t	t<enemy name=""aerostat"" delay=""50""/>
n	t	t	t<enemy name=""aerostat"" delay=""60""/>
n	t	t	t
n	t	t	t<enemy name=""airplane"" delay=""30""/>
n	t	t	t<enemy name=""airplane"" delay=""32""/>
n	t	t	t<enemy name=""airplane"" delay=""34""/>
n	t	t	t<enemy name=""airplane"" delay=""50""/>
n	t	t	t<enemy name=""airplane"" delay=""55""/>
n	t	t	t
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""6""/>
n	t	t	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit1-line-3"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""6""/>
n	t	t	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit1-line-3"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""12""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit1"" delay=""17""/>
n	t	t	t<enemy name=""unit1"" delay=""18""/>
n	t	t	t<enemy name=""unit1"" delay=""19""/>
n	t	t	t<enemy name=""unit1-line-3"" delay=""20""/>
n	t	t	t<enemy name=""unit1"" delay=""21""/>
n	t	t	t<enemy name=""unit1"" delay=""22""/>
n	t	t	t<enemy name=""unit1"" delay=""23""/>
n	t	t	t<enemy name=""unit1"" delay=""24""/>
n	t	t	t<enemy name=""unit1"" delay=""25""/>
n	t	t	t<enemy name=""unit1"" delay=""26""/>
n	t	t	t<enemy name=""unit1"" delay=""27""/>
n	t	t	t<enemy name=""unit1"" delay=""28""/>
n	t	t	t<enemy name=""unit1"" delay=""29""/>
n	t	t	t<enemy name=""unit1-line-3"" delay=""30""/>
n	t	t	t<enemy name=""unit1"" delay=""31""/>
n	t	t	t<enemy name=""unit1"" delay=""32""/>
n	t	t	t<enemy name=""unit1"" delay=""33""/>
n	t	t	t<enemy name=""unit1"" delay=""34""/>
n	t	t	t<enemy name=""unit1"" delay=""35""/>
n	t	t	t<enemy name=""unit1"" delay=""36""/>
n	t	t	t<enemy name=""unit1"" delay=""37""/>
n	t	t	t<enemy name=""unit1"" delay=""38""/>
n	t	t	t<enemy name=""unit1"" delay=""39""/>
n	t	t	t<enemy name=""unit1-line-3"" delay=""50""/>
n	t	t	t<enemy name=""unit1-line-3"" delay=""51""/>
n	t	t	t
n	t	t	t<enemy name=""unit2"" delay=""30""/>
n	t	t	t<enemy name=""unit2"" delay=""32""/>
n	t	t	t<enemy name=""unit2"" delay=""34""/>
n	t	t	t<enemy name=""unit2"" delay=""36""/>
n	t	t	t<enemy name=""unit2"" delay=""38""/>
n	t	t	t<enemy name=""unit2"" delay=""40""/>
n	t	t	t<enemy name=""unit2"" delay=""42""/>
n	t	t	t<enemy name=""unit2"" delay=""44""/>
n	t	t	t<enemy name=""unit2"" delay=""46""/>
n	t	t	t<enemy name=""unit2"" delay=""48""/>
n	t	t	t<enemy name=""unit2"" delay=""50""/>
n	t	t	t<enemy name=""unit2"" delay=""51""/>
n	t	t	t<enemy name=""unit2"" delay=""52""/>
n	t	t	t<enemy name=""unit2"" delay=""53""/>
n	t	t	t<enemy name=""unit2"" delay=""54""/>
n	t	t	t<enemy name=""unit2"" delay=""55""/>
n	t	t	t<enemy name=""unit2"" delay=""56""/>
n	t	t	t<enemy name=""unit2"" delay=""57""/>
n	t	t	t<enemy name=""unit2"" delay=""58""/>
n	t	t	t<enemy name=""unit2"" delay=""59""/>
n	t	t	t
n	t	t	t<enemy name=""aerostat"" delay=""5""/>
n	t	t	t<enemy name=""aerostat"" delay=""15""/>
n	t	t	t<enemy name=""aerostat"" delay=""25""/>
n	t	t	t<enemy name=""aerostat"" delay=""35""/>
n	t	t	t<enemy name=""aerostat"" delay=""45""/>
n	t	t	t<enemy name=""aerostat"" delay=""55""/>
n	t	t	t<enemy name=""aerostat"" delay=""60""/>
n	t	t	t
n	t	t	t<enemy name=""tank1"" delay=""45""/>
n	t	t	t<enemy name=""tank1"" delay=""55""/>
n	t	t	t<enemy name=""tank1"" delay=""60""/>
n	t	t	t<enemy name=""tank1"" delay=""65""/>
n	t	t</wave>
n	t</group>
n</level>")("<level eye="always" money="20000" maxTower="3" bg="2" maxUpgrade="1" upgradeTwo="false" threeStarHealth="80" twiStarHealth="60" preStartMoney="1000">
	
<!-- 
	Пушки
	столбец - 0 лев, 1 центр, 2 прав
	строка -  0 подвал, 1 первый, 2 второй, ...
	индексы апгрейдов 
	1 - upgr2, 
	2 - upgr3_1, 
	3 - upgr4_1, 
	4 - upgr3_2, 
	5 - upgr4_2
	
	значения для глаза(eye)  off, normal, always
	-->
	
	<settings towerLevel="3" towerHealth="90" globalUpgrades="1" maxCannons="1" machinegun="false" heavygun="false" lightning="false" saws="false" score="36000">
	    <!--
		<cannon name="machinegun" upgr="1" col="0" row="2"/>
		<cannon name="heavygun" upgr="0" col="2" row="1"/>
		-->
	</settings>

	<group pause="5">
		<wave pause="0" lifeTime="100" side="left" img="1">
			<enemy name="aerostat" delay="1"/>
			<enemy name="aerostat" delay="10"/>
			<enemy name="aerostat" delay="20"/>
			<enemy name="aerostat" delay="30"/>
			<enemy name="aerostat" delay="40"/>
			<enemy name="aerostat" delay="50"/>
			<enemy name="aerostat" delay="60"/>
			
			<enemy name="airplane" delay="30"/>
			<enemy name="airplane" delay="32"/>
			<enemy name="airplane" delay="34"/>
			<enemy name="airplane" delay="50"/>
			<enemy name="airplane" delay="55"/>
			
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit1" delay="6"/>
			<enemy name="unit1" delay="7"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit1-line-3" delay="10"/>
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit1" delay="6"/>
			<enemy name="unit1" delay="7"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit1-line-3" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="12"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit1" delay="17"/>
			<enemy name="unit1" delay="18"/>
			<enemy name="unit1" delay="19"/>
			<enemy name="unit1-line-3" delay="20"/>
			<enemy name="unit1" delay="21"/>
			<enemy name="unit1" delay="22"/>
			<enemy name="unit1" delay="23"/>
			<enemy name="unit1" delay="24"/>
			<enemy name="unit1" delay="25"/>
			<enemy name="unit1" delay="26"/>
			<enemy name="unit1" delay="27"/>
			<enemy name="unit1" delay="28"/>
			<enemy name="unit1" delay="29"/>
			<enemy name="unit1-line-3" delay="30"/>
			<enemy name="unit1" delay="31"/>
			<enemy name="unit1" delay="32"/>
			<enemy name="unit1" delay="33"/>
			<enemy name="unit1" delay="34"/>
			<enemy name="unit1" delay="35"/>
			<enemy name="unit1" delay="36"/>
			<enemy name="unit1" delay="37"/>
			<enemy name="unit1" delay="38"/>
			<enemy name="unit1" delay="39"/>
			<enemy name="unit1-line-3" delay="50"/>
			<enemy name="unit1-line-3" delay="51"/>
			
			<enemy name="unit2" delay="30"/>
			<enemy name="unit2" delay="32"/>
			<enemy name="unit2" delay="34"/>
			<enemy name="unit2" delay="36"/>
			<enemy name="unit2" delay="38"/>
			<enemy name="unit2" delay="40"/>
			<enemy name="unit2" delay="42"/>
			<enemy name="unit2" delay="44"/>
			<enemy name="unit2" delay="46"/>
			<enemy name="unit2" delay="48"/>
			<enemy name="unit2" delay="50"/>
			<enemy name="unit2" delay="51"/>
			<enemy name="unit2" delay="52"/>
			<enemy name="unit2" delay="53"/>
			<enemy name="unit2" delay="54"/>
			<enemy name="unit2" delay="55"/>
			<enemy name="unit2" delay="56"/>
			<enemy name="unit2" delay="57"/>
			<enemy name="unit2" delay="58"/>
			<enemy name="unit2" delay="59"/>
			
			<enemy name="car" delay="10"/>
			<enemy name="car" delay="20"/>
			<enemy name="car" delay="30"/>
			<enemy name="car" delay="35"/>
			<enemy name="car" delay="40"/>
			<enemy name="car" delay="45"/>
			<enemy name="car" delay="50"/>
			
			<enemy name="tank1" delay="45"/>
			<enemy name="tank1" delay="55"/>
			<enemy name="tank1" delay="60"/>
			<enemy name="tank1" delay="65"/>
		</wave>
		<wave pause="0" lifeTime="100" side="right" img="1">
            <enemy name="aerostat" delay="1"/>
			<enemy name="aerostat" delay="10"/>
			<enemy name="aerostat" delay="20"/>
			<enemy name="aerostat" delay="30"/>
			<enemy name="aerostat" delay="40"/>
			<enemy name="aerostat" delay="50"/>
			<enemy name="aerostat" delay="60"/>
			
			<enemy name="airplane" delay="30"/>
			<enemy name="airplane" delay="32"/>
			<enemy name="airplane" delay="34"/>
			<enemy name="airplane" delay="50"/>
			<enemy name="airplane" delay="55"/>
			
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit1" delay="6"/>
			<enemy name="unit1" delay="7"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit1-line-3" delay="10"/>
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit1" delay="6"/>
			<enemy name="unit1" delay="7"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit1-line-3" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="12"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit1" delay="17"/>
			<enemy name="unit1" delay="18"/>
			<enemy name="unit1" delay="19"/>
			<enemy name="unit1-line-3" delay="20"/>
			<enemy name="unit1" delay="21"/>
			<enemy name="unit1" delay="22"/>
			<enemy name="unit1" delay="23"/>
			<enemy name="unit1" delay="24"/>
			<enemy name="unit1" delay="25"/>
			<enemy name="unit1" delay="26"/>
			<enemy name="unit1" delay="27"/>
			<enemy name="unit1" delay="28"/>
			<enemy name="unit1" delay="29"/>
			<enemy name="unit1-line-3" delay="30"/>
			<enemy name="unit1" delay="31"/>
			<enemy name="unit1" delay="32"/>
			<enemy name="unit1" delay="33"/>
			<enemy name="unit1" delay="34"/>
			<enemy name="unit1" delay="35"/>
			<enemy name="unit1" delay="36"/>
			<enemy name="unit1" delay="37"/>
			<enemy name="unit1" delay="38"/>
			<enemy name="unit1" delay="39"/>
			<enemy name="unit1-line-3" delay="50"/>
			<enemy name="unit1-line-3" delay="51"/>
			
			<enemy name="unit2" delay="30"/>
			<enemy name="unit2" delay="32"/>
			<enemy name="unit2" delay="34"/>
			<enemy name="unit2" delay="36"/>
			<enemy name="unit2" delay="38"/>
			<enemy name="unit2" delay="40"/>
			<enemy name="unit2" delay="42"/>
			<enemy name="unit2" delay="44"/>
			<enemy name="unit2" delay="46"/>
			<enemy name="unit2" delay="48"/>
			<enemy name="unit2" delay="50"/>
			<enemy name="unit2" delay="51"/>
			<enemy name="unit2" delay="52"/>
			<enemy name="unit2" delay="53"/>
			<enemy name="unit2" delay="54"/>
			<enemy name="unit2" delay="55"/>
			<enemy name="unit2" delay="56"/>
			<enemy name="unit2" delay="57"/>
			<enemy name="unit2" delay="58"/>
			<enemy name="unit2" delay="59"/>
			
			<enemy name="aerostat" delay="5"/>
			<enemy name="aerostat" delay="15"/>
			<enemy name="aerostat" delay="25"/>
			<enemy name="aerostat" delay="35"/>
			<enemy name="aerostat" delay="45"/>
			<enemy name="aerostat" delay="55"/>
			<enemy name="aerostat" delay="60"/>
			
			<enemy name="tank1" delay="45"/>
			<enemy name="tank1" delay="55"/>
			<enemy name="tank1" delay="60"/>
			<enemy name="tank1" delay="65"/>
		</wave>
	</group>
</level>;
            var _loc_21:* = <level eye=""normal"" money=""8000"" maxTower=""4"" bg=""2"" maxUpgrade=""2"" upgradeTwo=""false"" threeStarHealth=""80"" twiStarHealth=""60"" preStartMoney=""2000"">
n	t
n<!-- 
n	tПушки
n	tстолбец - 0 лев, 1 центр, 2 прав
n	tстрока -  0 подвал, 1 первый, 2 второй, ...
n	tиндексы апгрейдов 
n	t1 - upgr2, 
n	t2 - upgr3_1, 
n	t3 - upgr4_1, 
n	t4 - upgr3_2, 
n	t5 - upgr4_2
n	t
n	tзначения для глаза(eye)  off, normal, always
n	t-->
n	t
n	t<settings towerLevel=""3"" towerHealth=""50"" globalUpgrades=""2"" maxCannons=""8"" machinegun=""true"" heavygun=""true"" lightning=""true"" saws=""true"" score=""38000"">
n	t    <!--
n	t	t<cannon name=""machinegun"" upgr=""1"" col=""0"" row=""2""/>
n	t	t<cannon name=""heavygun"" upgr=""0"" col=""2"" row=""1""/>
n	t	t-->
n	t	t<cannon name=""heavygun"" upgr=""1"" col=""0"" row=""3""/>
n	t	t<cannon name=""heavygun"" upgr=""1"" col=""2"" row=""3""/>
n	t</settings>
n	t
n	t<group pause=""5"">
n	t	t<wave pause=""0"" lifeTime=""200"" side=""left"" img=""1"">
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t
n	t	t	t<enemy name=""airplane"" delay=""10""/>
n	t	t	t<enemy name=""airplane"" delay=""15""/>
n	t	t	t<enemy name=""airplane"" delay=""20""/>
n	t	t	t
n	t	t	t<enemy name=""aerostat"" delay=""10""/>
n	t	t	t<enemy name=""aerostat"" delay=""15""/>
n	t	t	t<enemy name=""aerostat"" delay=""20""/>
n	t	t	t<enemy name=""aerostat"" delay=""25""/>
n	t	t	t
n	t	t	t<enemy name=""unit1"" delay=""20""/>
n	t	t	t<enemy name=""unit1"" delay=""22""/>
n	t	t	t<enemy name=""unit1"" delay=""23""/>
n	t	t	t<enemy name=""unit1"" delay=""24""/>
n	t	t	t<enemy name=""unit1"" delay=""28""/>
n	t	t	t<enemy name=""unit1"" delay=""20.5""/>
n	t	t	t<enemy name=""unit1"" delay=""22.5""/>
n	t	t	t<enemy name=""unit1"" delay=""23.5""/>
n	t	t	t<enemy name=""unit1"" delay=""24.5""/>
n	t	t	t<enemy name=""unit1"" delay=""28.5""/>
n	t	t	t
n	t	t	t<enemy name=""wheel"" delay=""30""/>
n	t	t	t<enemy name=""wheel"" delay=""32""/>
n	t	t	t<enemy name=""wheel"" delay=""34""/>
n	t	t	t<enemy name=""wheel"" delay=""36""/>
n	t	t	t
n	t	t	t<enemy name=""airplane"" delay=""40""/>
n	t	t	t<enemy name=""airplane"" delay=""43""/>
n	t	t	t<enemy name=""airplane"" delay=""46""/>
n	t	t	t<enemy name=""airplane"" delay=""49""/>
n	t	t	t<enemy name=""airplane"" delay=""52""/>
n	t	t	t
n	t	t	t<enemy name=""unit1"" delay=""46""/>
n	t	t    <enemy name=""unit2"" delay=""47""/>
n	t	t	t<enemy name=""unit2"" delay=""47""/>
n	t	t	t<enemy name=""unit2"" delay=""52""/>
n	t	t	t<enemy name=""unit2"" delay=""52""/>
n	t	t	t<enemy name=""unit2"" delay=""53""/>
n	t	t	t<enemy name=""unit2"" delay=""53""/>
n	t	t	t<enemy name=""unit2"" delay=""54""/>
n	t	t	t<enemy name=""unit2"" delay=""54""/>
n	t	t	t<enemy name=""unit2"" delay=""55""/>
n	t	t	t<enemy name=""unit2"" delay=""55""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""56""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""57""/>
n	t	t	t
n	t	t	t<enemy name=""heli"" delay=""60""/>
n	t	t	t<enemy name=""heli"" delay=""65""/>
n	t	t	t<enemy name=""heli"" delay=""70""/>
n	t	t	t
n	t	t	t<enemy name=""aerostat"" delay=""80""/>
n	t	t	t<enemy name=""aerostat"" delay=""85""/>
n	t	t	t<enemy name=""aerostat"" delay=""90""/>
n	t	t	t<enemy name=""aerostat"" delay=""95""/>
n	t	t	t<enemy name=""aerostat"" delay=""100""/>
n	t	t	t<enemy name=""airplane"" delay=""80""/>
n	t	t	t<enemy name=""airplane"" delay=""85""/>
n	t	t	t<enemy name=""airplane"" delay=""90""/>
n	t	t	t<enemy name=""heli"" delay=""90""/>
n	t	t	t<enemy name=""heli"" delay=""95""/>
n	t	t	t<enemy name=""heli"" delay=""100""/>
n	t	t	t
n	t	t	t<enemy name=""tank1"" delay=""110""/>
n	t	t	t<enemy name=""unit2-line-2"" delay=""117""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""118""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""119""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""120""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""121""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""122""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""123""/>
n	t	t	t<enemy name=""airplane"" delay=""114""/>
n	t	t	t
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""200"" side=""right"" img=""1"">
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t
n	t	t	t<enemy name=""airplane"" delay=""10""/>
n	t	t	t<enemy name=""airplane"" delay=""15""/>
n	t	t	t<enemy name=""airplane"" delay=""20""/>
n	t	t	t
n	t	t	t<enemy name=""aerostat"" delay=""10""/>
n	t	t	t<enemy name=""aerostat"" delay=""15""/>
n	t	t	t<enemy name=""aerostat"" delay=""20""/>
n	t	t	t<enemy name=""aerostat"" delay=""25""/>
n	t	t	t
n	t	t	t<enemy name=""unit1"" delay=""20""/>
n	t	t	t<enemy name=""unit1"" delay=""22""/>
n	t	t	t<enemy name=""unit1"" delay=""23""/>
n	t	t	t<enemy name=""unit1"" delay=""24""/>
n	t	t	t<enemy name=""unit1"" delay=""28""/>
n	t	t	t<enemy name=""unit1"" delay=""20.5""/>
n	t	t	t<enemy name=""unit1"" delay=""22.5""/>
n	t	t	t<enemy name=""unit1"" delay=""23.5""/>
n	t	t	t<enemy name=""unit1"" delay=""24.5""/>
n	t	t	t<enemy name=""unit1"" delay=""28.5""/>
n	t	t	t
n	t	t	t<enemy name=""wheel"" delay=""30""/>
n	t	t	t<enemy name=""wheel"" delay=""32""/>
n	t	t	t<enemy name=""wheel"" delay=""34""/>
n	t	t	t<enemy name=""wheel"" delay=""36""/>
n	t	t	t
n	t	t	t<enemy name=""airplane"" delay=""40""/>
n	t	t	t<enemy name=""airplane"" delay=""43""/>
n	t	t	t<enemy name=""airplane"" delay=""46""/>
n	t	t	t<enemy name=""airplane"" delay=""49""/>
n	t	t	t<enemy name=""airplane"" delay=""52""/>
n	t	t	t
n	t	t	t<enemy name=""unit1"" delay=""46""/>
n	t	t    <enemy name=""unit2"" delay=""47""/>
n	t	t	t<enemy name=""unit2"" delay=""47""/>
n	t	t	t<enemy name=""unit2"" delay=""52""/>
n	t	t	t<enemy name=""unit2"" delay=""52""/>
n	t	t	t<enemy name=""unit2"" delay=""53""/>
n	t	t	t<enemy name=""unit2"" delay=""53""/>
n	t	t	t<enemy name=""unit2"" delay=""54""/>
n	t	t	t<enemy name=""unit2"" delay=""54""/>
n	t	t	t<enemy name=""unit2"" delay=""55""/>
n	t	t	t<enemy name=""unit2"" delay=""55""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""56""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""57""/>
n	t	t	t
n	t	t	t<enemy name=""heli"" delay=""60""/>
n	t	t	t<enemy name=""heli"" delay=""65""/>
n	t	t	t<enemy name=""heli"" delay=""70""/>
n	t	t	t
n	t	t	t<enemy name=""aerostat"" delay=""80""/>
n	t	t	t<enemy name=""aerostat"" delay=""85""/>
n	t	t	t<enemy name=""aerostat"" delay=""90""/>
n	t	t	t<enemy name=""aerostat"" delay=""95""/>
n	t	t	t<enemy name=""aerostat"" delay=""100""/>
n	t	t	t<enemy name=""airplane"" delay=""80""/>
n	t	t	t<enemy name=""airplane"" delay=""85""/>
n	t	t	t<enemy name=""airplane"" delay=""90""/>
n	t	t	t<enemy name=""heli"" delay=""90""/>
n	t	t	t<enemy name=""heli"" delay=""95""/>
n	t	t	t<enemy name=""heli"" delay=""100""/>
n	t	t	t
n	t	t	t<enemy name=""tank1"" delay=""110""/>
n	t	t	t<enemy name=""unit2-line-2"" delay=""117""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""118""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""119""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""120""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""121""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""122""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""123""/>
n	t	t	t<enemy name=""airplane"" delay=""114""/>
n	t	t</wave>
n	t</group>
n	t
n</level>")("<level eye="normal" money="8000" maxTower="4" bg="2" maxUpgrade="2" upgradeTwo="false" threeStarHealth="80" twiStarHealth="60" preStartMoney="2000">
	
<!-- 
	Пушки
	столбец - 0 лев, 1 центр, 2 прав
	строка -  0 подвал, 1 первый, 2 второй, ...
	индексы апгрейдов 
	1 - upgr2, 
	2 - upgr3_1, 
	3 - upgr4_1, 
	4 - upgr3_2, 
	5 - upgr4_2
	
	значения для глаза(eye)  off, normal, always
	-->
	
	<settings towerLevel="3" towerHealth="50" globalUpgrades="2" maxCannons="8" machinegun="true" heavygun="true" lightning="true" saws="true" score="38000">
	    <!--
		<cannon name="machinegun" upgr="1" col="0" row="2"/>
		<cannon name="heavygun" upgr="0" col="2" row="1"/>
		-->
		<cannon name="heavygun" upgr="1" col="0" row="3"/>
		<cannon name="heavygun" upgr="1" col="2" row="3"/>
	</settings>
	
	<group pause="5">
		<wave pause="0" lifeTime="200" side="left" img="1">
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit1" delay="7"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="9"/>
			
			<enemy name="airplane" delay="10"/>
			<enemy name="airplane" delay="15"/>
			<enemy name="airplane" delay="20"/>
			
			<enemy name="aerostat" delay="10"/>
			<enemy name="aerostat" delay="15"/>
			<enemy name="aerostat" delay="20"/>
			<enemy name="aerostat" delay="25"/>
			
			<enemy name="unit1" delay="20"/>
			<enemy name="unit1" delay="22"/>
			<enemy name="unit1" delay="23"/>
			<enemy name="unit1" delay="24"/>
			<enemy name="unit1" delay="28"/>
			<enemy name="unit1" delay="20.5"/>
			<enemy name="unit1" delay="22.5"/>
			<enemy name="unit1" delay="23.5"/>
			<enemy name="unit1" delay="24.5"/>
			<enemy name="unit1" delay="28.5"/>
			
			<enemy name="wheel" delay="30"/>
			<enemy name="wheel" delay="32"/>
			<enemy name="wheel" delay="34"/>
			<enemy name="wheel" delay="36"/>
			
			<enemy name="airplane" delay="40"/>
			<enemy name="airplane" delay="43"/>
			<enemy name="airplane" delay="46"/>
			<enemy name="airplane" delay="49"/>
			<enemy name="airplane" delay="52"/>
			
			<enemy name="unit1" delay="46"/>
		    <enemy name="unit2" delay="47"/>
			<enemy name="unit2" delay="47"/>
			<enemy name="unit2" delay="52"/>
			<enemy name="unit2" delay="52"/>
			<enemy name="unit2" delay="53"/>
			<enemy name="unit2" delay="53"/>
			<enemy name="unit2" delay="54"/>
			<enemy name="unit2" delay="54"/>
			<enemy name="unit2" delay="55"/>
			<enemy name="unit2" delay="55"/>
			<enemy name="unit2-line-3" delay="56"/>
			<enemy name="unit2-line-3" delay="57"/>
			
			<enemy name="heli" delay="60"/>
			<enemy name="heli" delay="65"/>
			<enemy name="heli" delay="70"/>
			
			<enemy name="aerostat" delay="80"/>
			<enemy name="aerostat" delay="85"/>
			<enemy name="aerostat" delay="90"/>
			<enemy name="aerostat" delay="95"/>
			<enemy name="aerostat" delay="100"/>
			<enemy name="airplane" delay="80"/>
			<enemy name="airplane" delay="85"/>
			<enemy name="airplane" delay="90"/>
			<enemy name="heli" delay="90"/>
			<enemy name="heli" delay="95"/>
			<enemy name="heli" delay="100"/>
			
			<enemy name="tank1" delay="110"/>
			<enemy name="unit2-line-2" delay="117"/>
			<enemy name="unit2-line-3" delay="118"/>
			<enemy name="unit2-line-3" delay="119"/>
			<enemy name="unit2-line-3" delay="120"/>
			<enemy name="unit2-line-3" delay="121"/>
			<enemy name="unit2-line-3" delay="122"/>
			<enemy name="unit2-line-3" delay="123"/>
			<enemy name="airplane" delay="114"/>
			
		</wave>
		<wave pause="0" lifeTime="200" side="right" img="1">
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit1" delay="7"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="9"/>
			
			<enemy name="airplane" delay="10"/>
			<enemy name="airplane" delay="15"/>
			<enemy name="airplane" delay="20"/>
			
			<enemy name="aerostat" delay="10"/>
			<enemy name="aerostat" delay="15"/>
			<enemy name="aerostat" delay="20"/>
			<enemy name="aerostat" delay="25"/>
			
			<enemy name="unit1" delay="20"/>
			<enemy name="unit1" delay="22"/>
			<enemy name="unit1" delay="23"/>
			<enemy name="unit1" delay="24"/>
			<enemy name="unit1" delay="28"/>
			<enemy name="unit1" delay="20.5"/>
			<enemy name="unit1" delay="22.5"/>
			<enemy name="unit1" delay="23.5"/>
			<enemy name="unit1" delay="24.5"/>
			<enemy name="unit1" delay="28.5"/>
			
			<enemy name="wheel" delay="30"/>
			<enemy name="wheel" delay="32"/>
			<enemy name="wheel" delay="34"/>
			<enemy name="wheel" delay="36"/>
			
			<enemy name="airplane" delay="40"/>
			<enemy name="airplane" delay="43"/>
			<enemy name="airplane" delay="46"/>
			<enemy name="airplane" delay="49"/>
			<enemy name="airplane" delay="52"/>
			
			<enemy name="unit1" delay="46"/>
		    <enemy name="unit2" delay="47"/>
			<enemy name="unit2" delay="47"/>
			<enemy name="unit2" delay="52"/>
			<enemy name="unit2" delay="52"/>
			<enemy name="unit2" delay="53"/>
			<enemy name="unit2" delay="53"/>
			<enemy name="unit2" delay="54"/>
			<enemy name="unit2" delay="54"/>
			<enemy name="unit2" delay="55"/>
			<enemy name="unit2" delay="55"/>
			<enemy name="unit2-line-3" delay="56"/>
			<enemy name="unit2-line-3" delay="57"/>
			
			<enemy name="heli" delay="60"/>
			<enemy name="heli" delay="65"/>
			<enemy name="heli" delay="70"/>
			
			<enemy name="aerostat" delay="80"/>
			<enemy name="aerostat" delay="85"/>
			<enemy name="aerostat" delay="90"/>
			<enemy name="aerostat" delay="95"/>
			<enemy name="aerostat" delay="100"/>
			<enemy name="airplane" delay="80"/>
			<enemy name="airplane" delay="85"/>
			<enemy name="airplane" delay="90"/>
			<enemy name="heli" delay="90"/>
			<enemy name="heli" delay="95"/>
			<enemy name="heli" delay="100"/>
			
			<enemy name="tank1" delay="110"/>
			<enemy name="unit2-line-2" delay="117"/>
			<enemy name="unit2-line-3" delay="118"/>
			<enemy name="unit2-line-3" delay="119"/>
			<enemy name="unit2-line-3" delay="120"/>
			<enemy name="unit2-line-3" delay="121"/>
			<enemy name="unit2-line-3" delay="122"/>
			<enemy name="unit2-line-3" delay="123"/>
			<enemy name="airplane" delay="114"/>
		</wave>
	</group>
	
</level>;
            var _loc_22:* = <level eye=""normal"" money=""26000"" maxTower=""4"" bg=""2"" maxUpgrade=""2"" upgradeTwo=""false"" threeStarHealth=""80"" twiStarHealth=""60"" preStartMoney=""2000"">
n	t
n<!-- 
n	tПушки
n	tстолбец - 0 лев, 1 центр, 2 прав
n	tстрока -  0 подвал, 1 первый, 2 второй, ...
n	tиндексы апгрейдов 
n	t1 - upgr2, 
n	t2 - upgr3_1, 
n	t3 - upgr4_1, 
n	t4 - upgr3_2, 
n	t5 - upgr4_2
n	t
n	tзначения для глаза(eye)  off, normal, always
n	t-->
n	t
n	t<settings towerLevel=""3"" towerHealth=""130"" globalUpgrades=""2"" maxCannons=""8"" machinegun=""true"" heavygun=""false"" lightning=""false"" saws=""false"" score=""40000"">
n	t    <!--
n	t	t<cannon name=""machinegun"" upgr=""1"" col=""0"" row=""2""/>
n	t	t<cannon name=""heavygun"" upgr=""0"" col=""2"" row=""1""/>
n	t	t-->
n	t	t<cannon name=""saw"" upgr=""2"" col=""2"" row=""3""/>
n	t</settings>
n	t<group pause=""5"">
n	t	t<wave pause=""0"" lifeTime=""300"" side=""left"" img=""1"">
n	t	t	t<enemy name=""unit1-line-2"" delay=""1""/>
n	t	t	t<enemy name=""unit1-line-2"" delay=""2""/>
n	t	t	t<enemy name=""unit1-line-2"" delay=""3""/>
n	t	t	t<enemy name=""unit1-line-2"" delay=""4""/>
n	t	t	t<enemy name=""unit1-line-2"" delay=""5""/>
n	t	t	t<enemy name=""unit1-line-2"" delay=""6""/>
n	t	t	t<enemy name=""unit1-line-2"" delay=""7""/>
n	t	t	t<enemy name=""unit1-line-2"" delay=""8""/>
n	t	t	t<enemy name=""unit1-line-2"" delay=""9""/>
n	t	t	t<enemy name=""unit1-line-2"" delay=""10""/>
n
n	t	t	t<enemy name=""parashut"" delay=""8""/>
n	t	t	t<enemy name=""parashut"" delay=""9""/>
n	t	t	t<enemy name=""parashut"" delay=""10""/>
n	t	t	t<enemy name=""parashut"" delay=""11""/>
n	t	t	t<enemy name=""parashut"" delay=""12""/>
n	t	t	t<enemy name=""parashut"" delay=""13""/>
n	t	t	t<enemy name=""parashut"" delay=""14""/>
n	t	t	t<enemy name=""parashut"" delay=""15""/>
n	t	t	t
n	t	t	t<enemy name=""unit2"" delay=""20""/>
n	t	t	t<enemy name=""unit2"" delay=""22""/>
n	t	t	t<enemy name=""unit2"" delay=""23""/>
n	t	t	t
n	t	t	t<enemy name=""wheel"" delay=""25""/>
n	t	t	t<enemy name=""wheel"" delay=""27""/>
n	t	t    <enemy name=""wheel"" delay=""29""/>
n	t	t	t<enemy name=""wheel"" delay=""31""/>
n	t	t	t
n	t	t	t<enemy name=""tank1"" delay=""35""/>
n	t	t	t<enemy name=""tank1"" delay=""40""/>
n	t	t	t
n	t	t	t<enemy name=""car"" delay=""50""/>
n	t	t	t<enemy name=""car"" delay=""55""/>
n	t	t	t<enemy name=""car"" delay=""60""/>
n	t	t	t
n	t	t	t<enemy name=""heli"" delay=""60""/>
n	t	t	t
n	t	t	t<enemy name=""parashut"" delay=""70""/>
n	t	t	t<enemy name=""parashut"" delay=""70.5""/>
n	t	t	t<enemy name=""parashut"" delay=""71""/>
n	t	t	t<enemy name=""parashut"" delay=""71.5""/>
n	t	t	t<enemy name=""parashut"" delay=""72""/>
n	t	t	t<enemy name=""parashut"" delay=""72.5""/>
n	t	t	t<enemy name=""parashut"" delay=""73""/>
n	t	t	t<enemy name=""parashut"" delay=""73.5""/>
n	t	t	t<enemy name=""parashut"" delay=""74""/>
n	t	t	t<enemy name=""parashut"" delay=""74.5""/>
n	t	t	t<enemy name=""parashut"" delay=""75""/>
n	t	t	t<enemy name=""parashut"" delay=""75.5""/>
n	t	t	t<enemy name=""parashut"" delay=""76""/>
n	t	t	t<enemy name=""parashut"" delay=""76.5""/>
n	t	t	t<enemy name=""parashut"" delay=""77""/>
n	t	t	t<enemy name=""parashut"" delay=""77.5""/>
n	t	t	t<enemy name=""parashut"" delay=""78""/>
n	t	t	t<enemy name=""parashut"" delay=""78.5""/>
n	t	t	t<enemy name=""parashut"" delay=""79""/>
n	t	t	t<enemy name=""parashut"" delay=""79.5""/>
n	t	t	t<enemy name=""parashut"" delay=""80""/>
n	t	t	t<enemy name=""parashut"" delay=""80.5""/>
n	t	t	t<enemy name=""parashut"" delay=""80""/>
n	t	t	t<enemy name=""parashut"" delay=""80.5""/>
n	t	t	t<enemy name=""parashut"" delay=""81""/>
n	t	t	t<enemy name=""parashut"" delay=""81.5""/>
n	t	t	t<enemy name=""parashut"" delay=""82""/>
n	t	t	t<enemy name=""parashut"" delay=""82.5""/>
n	t	t	t<enemy name=""parashut"" delay=""83""/>
n	t	t	t<enemy name=""parashut"" delay=""83.5""/>
n	t	t	t<enemy name=""parashut"" delay=""84""/>
n	t	t	t<enemy name=""parashut"" delay=""84.5""/>
n	t	t	t<enemy name=""parashut"" delay=""85""/>
n	t	t	t<enemy name=""parashut"" delay=""85.5""/>
n	t	t	t<enemy name=""parashut"" delay=""86""/>
n	t	t	t<enemy name=""parashut"" delay=""86.5""/>
n	t	t	t<enemy name=""parashut"" delay=""87""/>
n	t	t	t<enemy name=""parashut"" delay=""87.5""/>
n	t	t	t
n	t	t	t<enemy name=""unit2-line-2"" delay=""70""/>
n	t	t	t<enemy name=""unit2-line-2"" delay=""72""/>
n	t	t	t<enemy name=""unit2-line-2"" delay=""74""/>
n	t	t	t<enemy name=""unit2-line-2"" delay=""76""/>
n	t	t	t<enemy name=""unit2-line-2"" delay=""78""/>
n	t	t	t<enemy name=""unit2-line-2"" delay=""80""/>
n	t	t	t<enemy name=""unit2-line-2"" delay=""82""/>
n	t	t	t
n	t	t	t<enemy name=""tank1"" delay=""100""/>
n	t	t	t<enemy name=""tank1"" delay=""110""/>
n	t	t	t<enemy name=""tank1"" delay=""120""/>
n	t	t	t<enemy name=""tank1"" delay=""130""/>
n	t	t	t<enemy name=""tank1"" delay=""140""/>
n	t	t	t<enemy name=""tank1"" delay=""150""/>
n	t	t	t
n	t	t	t<enemy name=""aerostat"" delay=""110""/>
n	t	t	t<enemy name=""aerostat"" delay=""120""/>
n	t	t	t<enemy name=""aerostat"" delay=""130""/>
n	t	t	t<enemy name=""aerostat"" delay=""140""/>
n	t	t	t
n	t	t	t<enemy name=""unit1"" delay=""102""/>
n	t	t	t<enemy name=""unit1"" delay=""112""/>
n	t	t	t<enemy name=""unit1"" delay=""122""/>
n	t	t	t<enemy name=""unit1"" delay=""132""/>
n	t	t	t<enemy name=""unit1"" delay=""142""/>
n	t	t	t<enemy name=""parashut"" delay=""115""/>
n	t	t	t<enemy name=""parashut"" delay=""125""/>
n	t	t	t<enemy name=""parashut"" delay=""135""/>
n	t	t	t<enemy name=""parashut"" delay=""145""/>
n	t	t	t<enemy name=""parashut"" delay=""155""/>
n	t	t	t
n	t	t	t<enemy name=""heli"" delay=""155""/>
n	t	t	t<enemy name=""heli"" delay=""160""/>
n	t	t	t<enemy name=""heli"" delay=""165""/>
n	t	t	t
n	t	t	t<enemy name=""tank3"" delay=""165""/>
n	t	t	t
n	t	t	t<enemy name=""unit1"" delay=""200""/>
n	t	t	t<enemy name=""unit1"" delay=""201""/>
n	t	t	t<enemy name=""unit1"" delay=""202""/>
n	t	t	t<enemy name=""unit1"" delay=""203""/>
n	t	t	t<enemy name=""unit1"" delay=""204""/>
n	t	t	t<enemy name=""unit1"" delay=""205""/>
n	t	t	t<enemy name=""unit1"" delay=""206""/>
n	t	t	t<enemy name=""unit1"" delay=""207""/>
n	t	t	t<enemy name=""unit1"" delay=""208""/>
n	t	t	t<enemy name=""unit1"" delay=""209""/>
n	t	t	t<enemy name=""unit1"" delay=""210""/>
n	t	t	t<enemy name=""unit1"" delay=""211""/>
n	t	t	t<enemy name=""unit1"" delay=""212""/>
n	t	t	t<enemy name=""unit1"" delay=""213""/>
n	t	t	t<enemy name=""unit1"" delay=""214""/>
n	t	t	t<enemy name=""unit1"" delay=""215""/>
n	t	t	t<enemy name=""unit1"" delay=""216""/>
n	t	t	t<enemy name=""unit1"" delay=""217""/>
n	t	t	t<enemy name=""unit1"" delay=""218""/>
n	t	t	t<enemy name=""unit1"" delay=""219""/>
n	t	t	t<enemy name=""unit1"" delay=""220""/>
n	t	t	t<enemy name=""unit1"" delay=""210""/>
n	t	t	t<enemy name=""unit1"" delay=""211""/>
n	t	t	t<enemy name=""unit1"" delay=""212""/>
n	t	t	t<enemy name=""unit1"" delay=""213""/>
n	t	t	t<enemy name=""unit1"" delay=""214""/>
n	t	t	t<enemy name=""unit1"" delay=""215""/>
n	t	t	t<enemy name=""unit1"" delay=""216""/>
n	t	t	t<enemy name=""unit1"" delay=""217""/>
n	t	t	t<enemy name=""unit1"" delay=""218""/>
n	t	t	t<enemy name=""unit1"" delay=""219""/>
n	t	t	t<enemy name=""unit1"" delay=""220""/>
n	t	t	t
n	t	t	t<enemy name=""unit2-line-2"" delay=""220""/>
n	t	t	t<enemy name=""unit2-line-2"" delay=""222""/>
n	t	t	t<enemy name=""unit2-line-2"" delay=""224""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""226""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""228""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""230""/>
n	t	t	t
n	t	t	t<enemy name=""parashut"" delay=""210""/>
n	t	t	t<enemy name=""parashut"" delay=""212""/>
n	t	t	t<enemy name=""parashut"" delay=""214""/>
n	t	t	t<enemy name=""parashut"" delay=""216""/>
n	t	t	t<enemy name=""parashut"" delay=""218""/>
n	t	t	t<enemy name=""parashut"" delay=""220""/>
n	t	t	t<enemy name=""parashut"" delay=""221""/>
n	t	t	t<enemy name=""parashut"" delay=""222""/>
n	t	t	t<enemy name=""parashut"" delay=""223""/>
n	t	t	t<enemy name=""parashut"" delay=""224""/>
n	t	t	t<enemy name=""parashut"" delay=""225""/>
n	t	t	t<enemy name=""parashut"" delay=""226""/>
n	t	t	t<enemy name=""parashut"" delay=""227""/>
n	t	t	t<enemy name=""parashut"" delay=""228""/>
n	t	t	t<enemy name=""parashut"" delay=""229""/>
n	t	t	t<enemy name=""parashut"" delay=""230""/>
n	t	t	t<enemy name=""parashut"" delay=""231""/>
n	t	t	t<enemy name=""parashut"" delay=""232""/>
n	t	t	t<enemy name=""parashut"" delay=""233""/>
n	t	t	t<enemy name=""parashut"" delay=""234""/>
n	t	t	t<enemy name=""parashut"" delay=""235""/>
n	t	t	t<enemy name=""parashut"" delay=""236""/>
n	t	t	t<enemy name=""parashut"" delay=""237""/>
n	t	t	t<enemy name=""parashut"" delay=""238""/>
n	t	t	t<enemy name=""parashut"" delay=""239""/>
n	t	t	t<enemy name=""parashut"" delay=""230""/>
n	t	t	t<enemy name=""parashut"" delay=""231""/>
n	t	t	t<enemy name=""parashut"" delay=""232""/>
n	t	t	t<enemy name=""parashut"" delay=""233""/>
n	t	t	t<enemy name=""parashut"" delay=""234""/>
n	t	t	t<enemy name=""parashut"" delay=""235""/>
n	t	t	t<enemy name=""parashut"" delay=""236""/>
n	t	t	t<enemy name=""parashut"" delay=""237""/>
n	t	t	t<enemy name=""parashut"" delay=""238""/>
n	t	t	t<enemy name=""parashut"" delay=""239""/>
n	t	t	t
n	t	t	t<enemy name=""tank1"" delay=""240""/>
n	t	t	t
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""300"" side=""right"" img=""1"">
n	t	t	t<enemy name=""unit1-line-2"" delay=""1""/>
n	t	t	t<enemy name=""unit1-line-2"" delay=""2""/>
n	t	t	t<enemy name=""unit1-line-2"" delay=""3""/>
n	t	t	t<enemy name=""unit1-line-2"" delay=""4""/>
n	t	t	t<enemy name=""unit1-line-2"" delay=""5""/>
n	t	t	t<enemy name=""unit1-line-2"" delay=""6""/>
n	t	t	t<enemy name=""unit1-line-2"" delay=""7""/>
n	t	t	t<enemy name=""unit1-line-2"" delay=""8""/>
n	t	t	t<enemy name=""unit1-line-2"" delay=""9""/>
n	t	t	t<enemy name=""unit1-line-2"" delay=""10""/>
n
n	t	t	t<enemy name=""parashut"" delay=""8""/>
n	t	t	t<enemy name=""parashut"" delay=""9""/>
n	t	t	t<enemy name=""parashut"" delay=""10""/>
n	t	t	t<enemy name=""parashut"" delay=""11""/>
n	t	t	t<enemy name=""parashut"" delay=""12""/>
n	t	t	t<enemy name=""parashut"" delay=""13""/>
n	t	t	t<enemy name=""parashut"" delay=""14""/>
n	t	t	t<enemy name=""parashut"" delay=""15""/>
n	t	t	t
n	t	t	t<enemy name=""unit2"" delay=""20""/>
n	t	t	t<enemy name=""unit2"" delay=""22""/>
n	t	t	t<enemy name=""unit2"" delay=""23""/>
n	t	t	t
n	t	t	t<enemy name=""wheel"" delay=""25""/>
n	t	t	t<enemy name=""wheel"" delay=""27""/>
n	t	t    <enemy name=""wheel"" delay=""29""/>
n	t	t	t<enemy name=""wheel"" delay=""31""/>
n	t	t	t
n	t	t	t<enemy name=""aerostat"" delay=""35""/>
n	t	t	t<enemy name=""aerostat"" delay=""40""/>
n	t	t	t<enemy name=""aerostat"" delay=""45""/>
n	t	t	t
n	t	t	t<enemy name=""car"" delay=""50""/>
n	t	t	t<enemy name=""car"" delay=""55""/>
n	t	t	t<enemy name=""car"" delay=""60""/>
n	t	t	t
n	t	t	t<enemy name=""heli"" delay=""60""/>
n	t	t	t
n	t	t	t<enemy name=""parashut"" delay=""70""/>
n	t	t	t<enemy name=""parashut"" delay=""70.5""/>
n	t	t	t<enemy name=""parashut"" delay=""71""/>
n	t	t	t<enemy name=""parashut"" delay=""71.5""/>
n	t	t	t<enemy name=""parashut"" delay=""72""/>
n	t	t	t<enemy name=""parashut"" delay=""72.5""/>
n	t	t	t<enemy name=""parashut"" delay=""73""/>
n	t	t	t<enemy name=""parashut"" delay=""73.5""/>
n	t	t	t<enemy name=""parashut"" delay=""74""/>
n	t	t	t<enemy name=""parashut"" delay=""74.5""/>
n	t	t	t<enemy name=""parashut"" delay=""75""/>
n	t	t	t<enemy name=""parashut"" delay=""75.5""/>
n	t	t	t<enemy name=""parashut"" delay=""76""/>
n	t	t	t<enemy name=""parashut"" delay=""76.5""/>
n	t	t	t<enemy name=""parashut"" delay=""77""/>
n	t	t	t<enemy name=""parashut"" delay=""77.5""/>
n	t	t	t<enemy name=""parashut"" delay=""78""/>
n	t	t	t<enemy name=""parashut"" delay=""78.5""/>
n	t	t	t<enemy name=""parashut"" delay=""79""/>
n	t	t	t<enemy name=""parashut"" delay=""79.5""/>
n	t	t	t<enemy name=""parashut"" delay=""80""/>
n	t	t	t<enemy name=""parashut"" delay=""80.5""/>
n	t	t	t<enemy name=""parashut"" delay=""80""/>
n	t	t	t<enemy name=""parashut"" delay=""80.5""/>
n	t	t	t<enemy name=""parashut"" delay=""81""/>
n	t	t	t<enemy name=""parashut"" delay=""81.5""/>
n	t	t	t<enemy name=""parashut"" delay=""82""/>
n	t	t	t<enemy name=""parashut"" delay=""82.5""/>
n	t	t	t<enemy name=""parashut"" delay=""83""/>
n	t	t	t<enemy name=""parashut"" delay=""83.5""/>
n	t	t	t<enemy name=""parashut"" delay=""84""/>
n	t	t	t<enemy name=""parashut"" delay=""84.5""/>
n	t	t	t<enemy name=""parashut"" delay=""85""/>
n	t	t	t<enemy name=""parashut"" delay=""85.5""/>
n	t	t	t<enemy name=""parashut"" delay=""86""/>
n	t	t	t<enemy name=""parashut"" delay=""86.5""/>
n	t	t	t<enemy name=""parashut"" delay=""87""/>
n	t	t	t<enemy name=""parashut"" delay=""87.5""/>
n	t	t	t
n	t	t	t<enemy name=""unit2-line-2"" delay=""70""/>
n	t	t	t<enemy name=""unit2-line-2"" delay=""72""/>
n	t	t	t<enemy name=""unit2-line-2"" delay=""74""/>
n	t	t	t<enemy name=""unit2-line-2"" delay=""76""/>
n	t	t	t<enemy name=""unit2-line-2"" delay=""78""/>
n	t	t	t<enemy name=""unit2-line-2"" delay=""80""/>
n	t	t	t<enemy name=""unit2-line-2"" delay=""82""/>
n	t	t	t
n	t	t	t<enemy name=""tank1"" delay=""105""/>
n	t	t	t<enemy name=""tank1"" delay=""115""/>
n	t	t	t<enemy name=""tank1"" delay=""125""/>
n	t	t	t<enemy name=""tank1"" delay=""135""/>
n	t	t	t<enemy name=""tank1"" delay=""145""/>
n	t	t	t<enemy name=""tank1"" delay=""155""/>
n	t	t	t
n	t	t	t<enemy name=""aerostat"" delay=""110""/>
n	t	t	t<enemy name=""aerostat"" delay=""120""/>
n	t	t	t<enemy name=""aerostat"" delay=""130""/>
n	t	t	t<enemy name=""aerostat"" delay=""140""/>
n	t	t	t
n	t	t	t<enemy name=""unit1"" delay=""108""/>
n	t	t	t<enemy name=""unit1"" delay=""118""/>
n	t	t	t<enemy name=""unit1"" delay=""128""/>
n	t	t	t<enemy name=""unit1"" delay=""138""/>
n	t	t	t<enemy name=""unit1"" delay=""148""/>
n	t	t	t<enemy name=""parashut"" delay=""115""/>
n	t	t	t<enemy name=""parashut"" delay=""125""/>
n	t	t	t<enemy name=""parashut"" delay=""135""/>
n	t	t	t<enemy name=""parashut"" delay=""145""/>
n	t	t	t<enemy name=""parashut"" delay=""155""/>
n	t	t	t
n	t	t	t<enemy name=""heli"" delay=""155""/>
n	t	t	t<enemy name=""heli"" delay=""160""/>
n	t	t	t<enemy name=""heli"" delay=""165""/>
n	t	t	t
n	t	t	t<enemy name=""tank3"" delay=""165""/>
n	t	t	t<enemy name=""tank3"" delay=""175""/>
n	t	t	t
n	t	t	t<enemy name=""unit1"" delay=""200""/>
n	t	t	t<enemy name=""unit1"" delay=""201""/>
n	t	t	t<enemy name=""unit1"" delay=""202""/>
n	t	t	t<enemy name=""unit1"" delay=""203""/>
n	t	t	t<enemy name=""unit1"" delay=""204""/>
n	t	t	t<enemy name=""unit1"" delay=""205""/>
n	t	t	t<enemy name=""unit1"" delay=""206""/>
n	t	t	t<enemy name=""unit1"" delay=""207""/>
n	t	t	t<enemy name=""unit1"" delay=""208""/>
n	t	t	t<enemy name=""unit1"" delay=""209""/>
n	t	t	t<enemy name=""unit1"" delay=""210""/>
n	t	t	t<enemy name=""unit1"" delay=""211""/>
n	t	t	t<enemy name=""unit1"" delay=""212""/>
n	t	t	t<enemy name=""unit1"" delay=""213""/>
n	t	t	t<enemy name=""unit1"" delay=""214""/>
n	t	t	t<enemy name=""unit1"" delay=""215""/>
n	t	t	t<enemy name=""unit1"" delay=""216""/>
n	t	t	t<enemy name=""unit1"" delay=""217""/>
n	t	t	t<enemy name=""unit1"" delay=""218""/>
n	t	t	t<enemy name=""unit1"" delay=""219""/>
n	t	t	t<enemy name=""unit1"" delay=""220""/>
n	t	t	t<enemy name=""unit1"" delay=""210""/>
n	t	t	t<enemy name=""unit1"" delay=""211""/>
n	t	t	t<enemy name=""unit1"" delay=""212""/>
n	t	t	t<enemy name=""unit1"" delay=""213""/>
n	t	t	t<enemy name=""unit1"" delay=""214""/>
n	t	t	t<enemy name=""unit1"" delay=""215""/>
n	t	t	t<enemy name=""unit1"" delay=""216""/>
n	t	t	t<enemy name=""unit1"" delay=""217""/>
n	t	t	t<enemy name=""unit1"" delay=""218""/>
n	t	t	t<enemy name=""unit1"" delay=""219""/>
n	t	t	t<enemy name=""unit1"" delay=""220""/>
n	t	t	t
n	t	t	t<enemy name=""unit2-line-2"" delay=""220""/>
n	t	t	t<enemy name=""unit2-line-2"" delay=""222""/>
n	t	t	t<enemy name=""unit2-line-2"" delay=""224""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""226""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""228""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""230""/>
n	t	t	t
n	t	t	t<enemy name=""parashut"" delay=""210""/>
n	t	t	t<enemy name=""parashut"" delay=""212""/>
n	t	t	t<enemy name=""parashut"" delay=""214""/>
n	t	t	t<enemy name=""parashut"" delay=""216""/>
n	t	t	t<enemy name=""parashut"" delay=""218""/>
n	t	t	t<enemy name=""parashut"" delay=""220""/>
n	t	t	t<enemy name=""parashut"" delay=""221""/>
n	t	t	t<enemy name=""parashut"" delay=""222""/>
n	t	t	t<enemy name=""parashut"" delay=""223""/>
n	t	t	t<enemy name=""parashut"" delay=""224""/>
n	t	t	t<enemy name=""parashut"" delay=""225""/>
n	t	t	t<enemy name=""parashut"" delay=""226""/>
n	t	t	t<enemy name=""parashut"" delay=""227""/>
n	t	t	t<enemy name=""parashut"" delay=""228""/>
n	t	t	t<enemy name=""parashut"" delay=""229""/>
n	t	t	t<enemy name=""parashut"" delay=""230""/>
n	t	t	t<enemy name=""parashut"" delay=""231""/>
n	t	t	t<enemy name=""parashut"" delay=""232""/>
n	t	t	t<enemy name=""parashut"" delay=""233""/>
n	t	t	t<enemy name=""parashut"" delay=""234""/>
n	t	t	t<enemy name=""parashut"" delay=""235""/>
n	t	t	t<enemy name=""parashut"" delay=""236""/>
n	t	t	t<enemy name=""parashut"" delay=""237""/>
n	t	t	t<enemy name=""parashut"" delay=""238""/>
n	t	t	t<enemy name=""parashut"" delay=""239""/>
n	t	t	t<enemy name=""parashut"" delay=""230""/>
n	t	t	t<enemy name=""parashut"" delay=""231""/>
n	t	t	t<enemy name=""parashut"" delay=""232""/>
n	t	t	t<enemy name=""parashut"" delay=""233""/>
n	t	t	t<enemy name=""parashut"" delay=""234""/>
n	t	t	t<enemy name=""parashut"" delay=""235""/>
n	t	t	t<enemy name=""parashut"" delay=""236""/>
n	t	t	t<enemy name=""parashut"" delay=""237""/>
n	t	t	t<enemy name=""parashut"" delay=""238""/>
n	t	t	t<enemy name=""parashut"" delay=""239""/>
n	t	t	t
n	t	t	t<enemy name=""tank1"" delay=""240""/>
n	t	t</wave>
n	t</group>
n</level>")("<level eye="normal" money="26000" maxTower="4" bg="2" maxUpgrade="2" upgradeTwo="false" threeStarHealth="80" twiStarHealth="60" preStartMoney="2000">
	
<!-- 
	Пушки
	столбец - 0 лев, 1 центр, 2 прав
	строка -  0 подвал, 1 первый, 2 второй, ...
	индексы апгрейдов 
	1 - upgr2, 
	2 - upgr3_1, 
	3 - upgr4_1, 
	4 - upgr3_2, 
	5 - upgr4_2
	
	значения для глаза(eye)  off, normal, always
	-->
	
	<settings towerLevel="3" towerHealth="130" globalUpgrades="2" maxCannons="8" machinegun="true" heavygun="false" lightning="false" saws="false" score="40000">
	    <!--
		<cannon name="machinegun" upgr="1" col="0" row="2"/>
		<cannon name="heavygun" upgr="0" col="2" row="1"/>
		-->
		<cannon name="saw" upgr="2" col="2" row="3"/>
	</settings>
	<group pause="5">
		<wave pause="0" lifeTime="300" side="left" img="1">
			<enemy name="unit1-line-2" delay="1"/>
			<enemy name="unit1-line-2" delay="2"/>
			<enemy name="unit1-line-2" delay="3"/>
			<enemy name="unit1-line-2" delay="4"/>
			<enemy name="unit1-line-2" delay="5"/>
			<enemy name="unit1-line-2" delay="6"/>
			<enemy name="unit1-line-2" delay="7"/>
			<enemy name="unit1-line-2" delay="8"/>
			<enemy name="unit1-line-2" delay="9"/>
			<enemy name="unit1-line-2" delay="10"/>

			<enemy name="parashut" delay="8"/>
			<enemy name="parashut" delay="9"/>
			<enemy name="parashut" delay="10"/>
			<enemy name="parashut" delay="11"/>
			<enemy name="parashut" delay="12"/>
			<enemy name="parashut" delay="13"/>
			<enemy name="parashut" delay="14"/>
			<enemy name="parashut" delay="15"/>
			
			<enemy name="unit2" delay="20"/>
			<enemy name="unit2" delay="22"/>
			<enemy name="unit2" delay="23"/>
			
			<enemy name="wheel" delay="25"/>
			<enemy name="wheel" delay="27"/>
		    <enemy name="wheel" delay="29"/>
			<enemy name="wheel" delay="31"/>
			
			<enemy name="tank1" delay="35"/>
			<enemy name="tank1" delay="40"/>
			
			<enemy name="car" delay="50"/>
			<enemy name="car" delay="55"/>
			<enemy name="car" delay="60"/>
			
			<enemy name="heli" delay="60"/>
			
			<enemy name="parashut" delay="70"/>
			<enemy name="parashut" delay="70.5"/>
			<enemy name="parashut" delay="71"/>
			<enemy name="parashut" delay="71.5"/>
			<enemy name="parashut" delay="72"/>
			<enemy name="parashut" delay="72.5"/>
			<enemy name="parashut" delay="73"/>
			<enemy name="parashut" delay="73.5"/>
			<enemy name="parashut" delay="74"/>
			<enemy name="parashut" delay="74.5"/>
			<enemy name="parashut" delay="75"/>
			<enemy name="parashut" delay="75.5"/>
			<enemy name="parashut" delay="76"/>
			<enemy name="parashut" delay="76.5"/>
			<enemy name="parashut" delay="77"/>
			<enemy name="parashut" delay="77.5"/>
			<enemy name="parashut" delay="78"/>
			<enemy name="parashut" delay="78.5"/>
			<enemy name="parashut" delay="79"/>
			<enemy name="parashut" delay="79.5"/>
			<enemy name="parashut" delay="80"/>
			<enemy name="parashut" delay="80.5"/>
			<enemy name="parashut" delay="80"/>
			<enemy name="parashut" delay="80.5"/>
			<enemy name="parashut" delay="81"/>
			<enemy name="parashut" delay="81.5"/>
			<enemy name="parashut" delay="82"/>
			<enemy name="parashut" delay="82.5"/>
			<enemy name="parashut" delay="83"/>
			<enemy name="parashut" delay="83.5"/>
			<enemy name="parashut" delay="84"/>
			<enemy name="parashut" delay="84.5"/>
			<enemy name="parashut" delay="85"/>
			<enemy name="parashut" delay="85.5"/>
			<enemy name="parashut" delay="86"/>
			<enemy name="parashut" delay="86.5"/>
			<enemy name="parashut" delay="87"/>
			<enemy name="parashut" delay="87.5"/>
			
			<enemy name="unit2-line-2" delay="70"/>
			<enemy name="unit2-line-2" delay="72"/>
			<enemy name="unit2-line-2" delay="74"/>
			<enemy name="unit2-line-2" delay="76"/>
			<enemy name="unit2-line-2" delay="78"/>
			<enemy name="unit2-line-2" delay="80"/>
			<enemy name="unit2-line-2" delay="82"/>
			
			<enemy name="tank1" delay="100"/>
			<enemy name="tank1" delay="110"/>
			<enemy name="tank1" delay="120"/>
			<enemy name="tank1" delay="130"/>
			<enemy name="tank1" delay="140"/>
			<enemy name="tank1" delay="150"/>
			
			<enemy name="aerostat" delay="110"/>
			<enemy name="aerostat" delay="120"/>
			<enemy name="aerostat" delay="130"/>
			<enemy name="aerostat" delay="140"/>
			
			<enemy name="unit1" delay="102"/>
			<enemy name="unit1" delay="112"/>
			<enemy name="unit1" delay="122"/>
			<enemy name="unit1" delay="132"/>
			<enemy name="unit1" delay="142"/>
			<enemy name="parashut" delay="115"/>
			<enemy name="parashut" delay="125"/>
			<enemy name="parashut" delay="135"/>
			<enemy name="parashut" delay="145"/>
			<enemy name="parashut" delay="155"/>
			
			<enemy name="heli" delay="155"/>
			<enemy name="heli" delay="160"/>
			<enemy name="heli" delay="165"/>
			
			<enemy name="tank3" delay="165"/>
			
			<enemy name="unit1" delay="200"/>
			<enemy name="unit1" delay="201"/>
			<enemy name="unit1" delay="202"/>
			<enemy name="unit1" delay="203"/>
			<enemy name="unit1" delay="204"/>
			<enemy name="unit1" delay="205"/>
			<enemy name="unit1" delay="206"/>
			<enemy name="unit1" delay="207"/>
			<enemy name="unit1" delay="208"/>
			<enemy name="unit1" delay="209"/>
			<enemy name="unit1" delay="210"/>
			<enemy name="unit1" delay="211"/>
			<enemy name="unit1" delay="212"/>
			<enemy name="unit1" delay="213"/>
			<enemy name="unit1" delay="214"/>
			<enemy name="unit1" delay="215"/>
			<enemy name="unit1" delay="216"/>
			<enemy name="unit1" delay="217"/>
			<enemy name="unit1" delay="218"/>
			<enemy name="unit1" delay="219"/>
			<enemy name="unit1" delay="220"/>
			<enemy name="unit1" delay="210"/>
			<enemy name="unit1" delay="211"/>
			<enemy name="unit1" delay="212"/>
			<enemy name="unit1" delay="213"/>
			<enemy name="unit1" delay="214"/>
			<enemy name="unit1" delay="215"/>
			<enemy name="unit1" delay="216"/>
			<enemy name="unit1" delay="217"/>
			<enemy name="unit1" delay="218"/>
			<enemy name="unit1" delay="219"/>
			<enemy name="unit1" delay="220"/>
			
			<enemy name="unit2-line-2" delay="220"/>
			<enemy name="unit2-line-2" delay="222"/>
			<enemy name="unit2-line-2" delay="224"/>
			<enemy name="unit2-line-3" delay="226"/>
			<enemy name="unit2-line-3" delay="228"/>
			<enemy name="unit2-line-3" delay="230"/>
			
			<enemy name="parashut" delay="210"/>
			<enemy name="parashut" delay="212"/>
			<enemy name="parashut" delay="214"/>
			<enemy name="parashut" delay="216"/>
			<enemy name="parashut" delay="218"/>
			<enemy name="parashut" delay="220"/>
			<enemy name="parashut" delay="221"/>
			<enemy name="parashut" delay="222"/>
			<enemy name="parashut" delay="223"/>
			<enemy name="parashut" delay="224"/>
			<enemy name="parashut" delay="225"/>
			<enemy name="parashut" delay="226"/>
			<enemy name="parashut" delay="227"/>
			<enemy name="parashut" delay="228"/>
			<enemy name="parashut" delay="229"/>
			<enemy name="parashut" delay="230"/>
			<enemy name="parashut" delay="231"/>
			<enemy name="parashut" delay="232"/>
			<enemy name="parashut" delay="233"/>
			<enemy name="parashut" delay="234"/>
			<enemy name="parashut" delay="235"/>
			<enemy name="parashut" delay="236"/>
			<enemy name="parashut" delay="237"/>
			<enemy name="parashut" delay="238"/>
			<enemy name="parashut" delay="239"/>
			<enemy name="parashut" delay="230"/>
			<enemy name="parashut" delay="231"/>
			<enemy name="parashut" delay="232"/>
			<enemy name="parashut" delay="233"/>
			<enemy name="parashut" delay="234"/>
			<enemy name="parashut" delay="235"/>
			<enemy name="parashut" delay="236"/>
			<enemy name="parashut" delay="237"/>
			<enemy name="parashut" delay="238"/>
			<enemy name="parashut" delay="239"/>
			
			<enemy name="tank1" delay="240"/>
			
		</wave>
		<wave pause="0" lifeTime="300" side="right" img="1">
			<enemy name="unit1-line-2" delay="1"/>
			<enemy name="unit1-line-2" delay="2"/>
			<enemy name="unit1-line-2" delay="3"/>
			<enemy name="unit1-line-2" delay="4"/>
			<enemy name="unit1-line-2" delay="5"/>
			<enemy name="unit1-line-2" delay="6"/>
			<enemy name="unit1-line-2" delay="7"/>
			<enemy name="unit1-line-2" delay="8"/>
			<enemy name="unit1-line-2" delay="9"/>
			<enemy name="unit1-line-2" delay="10"/>

			<enemy name="parashut" delay="8"/>
			<enemy name="parashut" delay="9"/>
			<enemy name="parashut" delay="10"/>
			<enemy name="parashut" delay="11"/>
			<enemy name="parashut" delay="12"/>
			<enemy name="parashut" delay="13"/>
			<enemy name="parashut" delay="14"/>
			<enemy name="parashut" delay="15"/>
			
			<enemy name="unit2" delay="20"/>
			<enemy name="unit2" delay="22"/>
			<enemy name="unit2" delay="23"/>
			
			<enemy name="wheel" delay="25"/>
			<enemy name="wheel" delay="27"/>
		    <enemy name="wheel" delay="29"/>
			<enemy name="wheel" delay="31"/>
			
			<enemy name="aerostat" delay="35"/>
			<enemy name="aerostat" delay="40"/>
			<enemy name="aerostat" delay="45"/>
			
			<enemy name="car" delay="50"/>
			<enemy name="car" delay="55"/>
			<enemy name="car" delay="60"/>
			
			<enemy name="heli" delay="60"/>
			
			<enemy name="parashut" delay="70"/>
			<enemy name="parashut" delay="70.5"/>
			<enemy name="parashut" delay="71"/>
			<enemy name="parashut" delay="71.5"/>
			<enemy name="parashut" delay="72"/>
			<enemy name="parashut" delay="72.5"/>
			<enemy name="parashut" delay="73"/>
			<enemy name="parashut" delay="73.5"/>
			<enemy name="parashut" delay="74"/>
			<enemy name="parashut" delay="74.5"/>
			<enemy name="parashut" delay="75"/>
			<enemy name="parashut" delay="75.5"/>
			<enemy name="parashut" delay="76"/>
			<enemy name="parashut" delay="76.5"/>
			<enemy name="parashut" delay="77"/>
			<enemy name="parashut" delay="77.5"/>
			<enemy name="parashut" delay="78"/>
			<enemy name="parashut" delay="78.5"/>
			<enemy name="parashut" delay="79"/>
			<enemy name="parashut" delay="79.5"/>
			<enemy name="parashut" delay="80"/>
			<enemy name="parashut" delay="80.5"/>
			<enemy name="parashut" delay="80"/>
			<enemy name="parashut" delay="80.5"/>
			<enemy name="parashut" delay="81"/>
			<enemy name="parashut" delay="81.5"/>
			<enemy name="parashut" delay="82"/>
			<enemy name="parashut" delay="82.5"/>
			<enemy name="parashut" delay="83"/>
			<enemy name="parashut" delay="83.5"/>
			<enemy name="parashut" delay="84"/>
			<enemy name="parashut" delay="84.5"/>
			<enemy name="parashut" delay="85"/>
			<enemy name="parashut" delay="85.5"/>
			<enemy name="parashut" delay="86"/>
			<enemy name="parashut" delay="86.5"/>
			<enemy name="parashut" delay="87"/>
			<enemy name="parashut" delay="87.5"/>
			
			<enemy name="unit2-line-2" delay="70"/>
			<enemy name="unit2-line-2" delay="72"/>
			<enemy name="unit2-line-2" delay="74"/>
			<enemy name="unit2-line-2" delay="76"/>
			<enemy name="unit2-line-2" delay="78"/>
			<enemy name="unit2-line-2" delay="80"/>
			<enemy name="unit2-line-2" delay="82"/>
			
			<enemy name="tank1" delay="105"/>
			<enemy name="tank1" delay="115"/>
			<enemy name="tank1" delay="125"/>
			<enemy name="tank1" delay="135"/>
			<enemy name="tank1" delay="145"/>
			<enemy name="tank1" delay="155"/>
			
			<enemy name="aerostat" delay="110"/>
			<enemy name="aerostat" delay="120"/>
			<enemy name="aerostat" delay="130"/>
			<enemy name="aerostat" delay="140"/>
			
			<enemy name="unit1" delay="108"/>
			<enemy name="unit1" delay="118"/>
			<enemy name="unit1" delay="128"/>
			<enemy name="unit1" delay="138"/>
			<enemy name="unit1" delay="148"/>
			<enemy name="parashut" delay="115"/>
			<enemy name="parashut" delay="125"/>
			<enemy name="parashut" delay="135"/>
			<enemy name="parashut" delay="145"/>
			<enemy name="parashut" delay="155"/>
			
			<enemy name="heli" delay="155"/>
			<enemy name="heli" delay="160"/>
			<enemy name="heli" delay="165"/>
			
			<enemy name="tank3" delay="165"/>
			<enemy name="tank3" delay="175"/>
			
			<enemy name="unit1" delay="200"/>
			<enemy name="unit1" delay="201"/>
			<enemy name="unit1" delay="202"/>
			<enemy name="unit1" delay="203"/>
			<enemy name="unit1" delay="204"/>
			<enemy name="unit1" delay="205"/>
			<enemy name="unit1" delay="206"/>
			<enemy name="unit1" delay="207"/>
			<enemy name="unit1" delay="208"/>
			<enemy name="unit1" delay="209"/>
			<enemy name="unit1" delay="210"/>
			<enemy name="unit1" delay="211"/>
			<enemy name="unit1" delay="212"/>
			<enemy name="unit1" delay="213"/>
			<enemy name="unit1" delay="214"/>
			<enemy name="unit1" delay="215"/>
			<enemy name="unit1" delay="216"/>
			<enemy name="unit1" delay="217"/>
			<enemy name="unit1" delay="218"/>
			<enemy name="unit1" delay="219"/>
			<enemy name="unit1" delay="220"/>
			<enemy name="unit1" delay="210"/>
			<enemy name="unit1" delay="211"/>
			<enemy name="unit1" delay="212"/>
			<enemy name="unit1" delay="213"/>
			<enemy name="unit1" delay="214"/>
			<enemy name="unit1" delay="215"/>
			<enemy name="unit1" delay="216"/>
			<enemy name="unit1" delay="217"/>
			<enemy name="unit1" delay="218"/>
			<enemy name="unit1" delay="219"/>
			<enemy name="unit1" delay="220"/>
			
			<enemy name="unit2-line-2" delay="220"/>
			<enemy name="unit2-line-2" delay="222"/>
			<enemy name="unit2-line-2" delay="224"/>
			<enemy name="unit2-line-3" delay="226"/>
			<enemy name="unit2-line-3" delay="228"/>
			<enemy name="unit2-line-3" delay="230"/>
			
			<enemy name="parashut" delay="210"/>
			<enemy name="parashut" delay="212"/>
			<enemy name="parashut" delay="214"/>
			<enemy name="parashut" delay="216"/>
			<enemy name="parashut" delay="218"/>
			<enemy name="parashut" delay="220"/>
			<enemy name="parashut" delay="221"/>
			<enemy name="parashut" delay="222"/>
			<enemy name="parashut" delay="223"/>
			<enemy name="parashut" delay="224"/>
			<enemy name="parashut" delay="225"/>
			<enemy name="parashut" delay="226"/>
			<enemy name="parashut" delay="227"/>
			<enemy name="parashut" delay="228"/>
			<enemy name="parashut" delay="229"/>
			<enemy name="parashut" delay="230"/>
			<enemy name="parashut" delay="231"/>
			<enemy name="parashut" delay="232"/>
			<enemy name="parashut" delay="233"/>
			<enemy name="parashut" delay="234"/>
			<enemy name="parashut" delay="235"/>
			<enemy name="parashut" delay="236"/>
			<enemy name="parashut" delay="237"/>
			<enemy name="parashut" delay="238"/>
			<enemy name="parashut" delay="239"/>
			<enemy name="parashut" delay="230"/>
			<enemy name="parashut" delay="231"/>
			<enemy name="parashut" delay="232"/>
			<enemy name="parashut" delay="233"/>
			<enemy name="parashut" delay="234"/>
			<enemy name="parashut" delay="235"/>
			<enemy name="parashut" delay="236"/>
			<enemy name="parashut" delay="237"/>
			<enemy name="parashut" delay="238"/>
			<enemy name="parashut" delay="239"/>
			
			<enemy name="tank1" delay="240"/>
		</wave>
	</group>
</level>;
            var _loc_23:* = <level eye=""normal"" money=""32000"" maxTower=""5"" bg=""3"" maxUpgrade=""2"" upgradeTwo=""false"" threeStarHealth=""80"" twiStarHealth=""60"" preStartMoney=""2000"">
n	t
n<!-- 
n	tПушки
n	tстолбец - 0 лев, 1 центр, 2 прав
n	tстрока -  0 подвал, 1 первый, 2 второй, ...
n	tиндексы апгрейдов 
n	t1 - upgr2, 
n	t2 - upgr3_1, 
n	t3 - upgr4_1, 
n	t4 - upgr3_2, 
n	t5 - upgr4_2
n	t
n	tзначения для глаза(eye)  off, normal, always
n	t-->
n	t
n	t<settings towerLevel=""5"" towerHealth=""100"" globalUpgrades=""2"" maxCannons=""10"" machinegun=""true"" heavygun=""true"" lightning=""true"" saws=""false"" score=""42000"">
n	t    <!--
n	t	t<cannon name=""machinegun"" upgr=""1"" col=""0"" row=""2""/>
n	t	t<cannon name=""heavygun"" upgr=""0"" col=""2"" row=""1""/>
n	t	t-->
n	t	t<cannon name=""heavygun"" upgr=""0"" col=""0"" row=""1""/>
n	t	t<cannon name=""heavygun"" upgr=""0"" col=""2"" row=""2""/>
n	t	t<cannon name=""heavygun"" upgr=""0"" col=""0"" row=""3""/>
n	t	t<cannon name=""heavygun"" upgr=""0"" col=""2"" row=""4""/>
n	t	t<cannon name=""heavygun"" upgr=""1"" col=""2"" row=""5""/>
n	t	t
n	t</settings>
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""40"" side=""left"" img=""1"">
n	t	t    <enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit2"" delay=""1""/>
n	t	t	t<enemy name=""unit2"" delay=""4""/>
n	t	t	t<enemy name=""unit2"" delay=""7""/>
n	t	t	t<enemy name=""unit2"" delay=""10""/>
n	t	t	t<enemy name=""unit2"" delay=""13""/>
n	t	t	t<enemy name=""unit2"" delay=""16""/>
n	t	t	t<enemy name=""tanket"" delay=""18""/>
n	t	t	t<enemy name=""tanket"" delay=""19""/>
n	t	t	t<enemy name=""tanket"" delay=""20""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""40"" side=""right"" img=""1"">
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit2"" delay=""1""/>
n	t	t	t<enemy name=""unit2"" delay=""4""/>
n	t	t	t<enemy name=""unit2"" delay=""7""/>
n	t	t	t<enemy name=""unit2"" delay=""10""/>
n	t	t	t<enemy name=""unit2"" delay=""13""/>
n	t	t	t<enemy name=""unit2"" delay=""16""/>
n	t	t	t<enemy name=""tanket"" delay=""18""/>
n	t	t	t<enemy name=""tanket"" delay=""19""/>
n	t	t	t<enemy name=""tanket"" delay=""20""/>
n	t	t</wave>
n	t</group>
n	t <group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""50"" side=""left"" img=""1"">
n	t	t	t<enemy name=""aerostat"" delay=""1""/>
n	t	t	t<enemy name=""aerostat"" delay=""4""/>
n	t	t	t<enemy name=""aerostat"" delay=""8""/>
n	t	t	t<enemy name=""aerostat"" delay=""12""/>
n	t	t	t<enemy name=""tanket"" delay=""1""/>
n	t	t	t<enemy name=""tanket"" delay=""4""/>
n	t	t	t<enemy name=""tanket"" delay=""8""/>
n    	t</wave>
n	t	t<wave pause=""0"" lifeTime=""50"" side=""right"" img=""1"">
n	t	t	t<enemy name=""aerostat"" delay=""1""/>
n	t	t	t<enemy name=""aerostat"" delay=""4""/>
n	t	t	t<enemy name=""aerostat"" delay=""8""/>
n	t	t	t<enemy name=""aerostat"" delay=""12""/>
n	t	t	t<enemy name=""tanket"" delay=""1""/>
n	t	t	t<enemy name=""tanket"" delay=""4""/>
n	t	t	t<enemy name=""tanket"" delay=""8""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""20"" side=""left"" img=""1"">
n	t	t   <enemy name=""walker1"" delay=""1""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""20"" side=""right"" img=""1"">
n	t	t   <enemy name=""walker1"" delay=""1""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""30"" side=""left"" img=""1"">
n	t	t	t<enemy name=""unit2-line-2"" delay=""0""/>
n	t	t	t<enemy name=""unit2-line-2"" delay=""2""/>
n	t	t	t<enemy name=""unit2-line-2"" delay=""4""/>
n	t	t	t<enemy name=""unit2-line-2"" delay=""8""/>
n	t	t	t<enemy name=""unit2-line-2"" delay=""10""/>
n	t	t	t<enemy name=""unit2-line-2"" delay=""12""/>
n	t	t	t<enemy name=""unit2-line-2"" delay=""14""/>
n	t	t	t<enemy name=""airplane"" delay=""1""/>
n    	t</wave>
n	t	t<wave pause=""0"" lifeTime=""30"" side=""right"" img=""1"">
n	t	t	t<enemy name=""unit2-line-2"" delay=""0""/>
n	t	t	t<enemy name=""unit2-line-2"" delay=""2""/>
n	t	t	t<enemy name=""unit2-line-2"" delay=""4""/>
n	t	t	t<enemy name=""unit2-line-2"" delay=""8""/>
n	t	t	t<enemy name=""unit2-line-2"" delay=""10""/>
n	t	t	t<enemy name=""unit2-line-2"" delay=""12""/>
n	t	t	t<enemy name=""unit2-line-2"" delay=""14""/>
n	t	t	t<enemy name=""airplane"" delay=""1""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""30"" side=""left"" img=""1"">
n	t	t	t<enemy name=""car"" delay=""0""/>
n	t	t	t<enemy name=""tanket"" delay=""2""/>
n	t	t	t<enemy name=""car"" delay=""4""/>
n	t	t	t<enemy name=""tanket"" delay=""8""/>
n	t	t	t<enemy name=""car"" delay=""10""/>
n	t	t	t<enemy name=""tanket"" delay=""12""/>
n	t	t	t<enemy name=""car"" delay=""14""/>
n	t	t	t<enemy name=""parashut"" delay=""8""/>
n	t	t	t<enemy name=""parashut"" delay=""10""/>
n    	t</wave>
n	t	t<wave pause=""0"" lifeTime=""30"" side=""right"" img=""1"">
n	t	t	t<enemy name=""car"" delay=""0""/>
n	t	t	t<enemy name=""tanket"" delay=""2""/>
n	t	t	t<enemy name=""car"" delay=""4""/>
n	t	t	t<enemy name=""tanket"" delay=""8""/>
n	t	t	t<enemy name=""car"" delay=""10""/>
n	t	t	t<enemy name=""tanket"" delay=""12""/>
n	t	t	t<enemy name=""car"" delay=""14""/>
n	t	t	t<enemy name=""parashut"" delay=""8""/>
n	t	t	t<enemy name=""parashut"" delay=""10""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""30"" side=""left"" img=""1"">
n	t	t    <enemy name=""aerostat"" delay=""1""/>
n	t	t	t<enemy name=""tank1"" delay=""10""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""1""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""2""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""3""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""4""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""5""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""6""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""7""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""8""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""9""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""10""/>
n     	t</wave>
n	t	t<wave pause=""0"" lifeTime=""30"" side=""right"" img=""1"">
n            <enemy name=""aerostat"" delay=""1""/>
n	t	t	t<enemy name=""tank1"" delay=""10""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""1""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""2""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""3""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""4""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""5""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""6""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""7""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""8""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""9""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""10""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""20"" side=""left"" img=""1"">
n	t	t   <enemy name=""heli"" delay=""0""/>
n	t	t   <enemy name=""heli"" delay=""2""/>
n	t	t   <enemy name=""heli"" delay=""4""/>
n	t	t   <enemy name=""heli"" delay=""6""/>
n	t	t   <enemy name=""heli"" delay=""8""/>
n	t	t   <enemy name=""heli"" delay=""10""/>
n	t	t   <enemy name=""parashut"" delay=""0""/>
n	t	t   <enemy name=""parashut"" delay=""5""/>
n	t	t   <enemy name=""parashut"" delay=""10""/>
n	t	t   <enemy name=""airplane"" delay=""1""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""20"" side=""right"" img=""1"">
n	t	t   <enemy name=""heli"" delay=""0""/>
n	t	t   <enemy name=""heli"" delay=""2""/>
n	t	t   <enemy name=""heli"" delay=""4""/>
n	t	t   <enemy name=""heli"" delay=""6""/>
n	t	t   <enemy name=""heli"" delay=""8""/>
n	t	t   <enemy name=""heli"" delay=""10""/>
n	t	t   <enemy name=""parashut"" delay=""0""/>
n	t	t   <enemy name=""parashut"" delay=""5""/>
n	t	t   <enemy name=""parashut"" delay=""10""/>
n	t	t   <enemy name=""airplane"" delay=""1""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""20"" side=""left"" img=""1"">
n	t	t   <enemy name=""walker1"" delay=""0""/>
n	t	t   <enemy name=""walker1"" delay=""8""/>
n	t	t   <enemy name=""walker1"" delay=""16""/>
n	t	t   <enemy name=""walker1"" delay=""24""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""20"" side=""right"" img=""1"">
n	t	t   <enemy name=""walker1"" delay=""0""/>
n	t	t   <enemy name=""walker1"" delay=""8""/>
n	t	t   <enemy name=""walker1"" delay=""16""/>
n	t	t   <enemy name=""walker1"" delay=""24""/>
n	t	t</wave>
n	t</group>
n	t
n</level>")("<level eye="normal" money="32000" maxTower="5" bg="3" maxUpgrade="2" upgradeTwo="false" threeStarHealth="80" twiStarHealth="60" preStartMoney="2000">
	
<!-- 
	Пушки
	столбец - 0 лев, 1 центр, 2 прав
	строка -  0 подвал, 1 первый, 2 второй, ...
	индексы апгрейдов 
	1 - upgr2, 
	2 - upgr3_1, 
	3 - upgr4_1, 
	4 - upgr3_2, 
	5 - upgr4_2
	
	значения для глаза(eye)  off, normal, always
	-->
	
	<settings towerLevel="5" towerHealth="100" globalUpgrades="2" maxCannons="10" machinegun="true" heavygun="true" lightning="true" saws="false" score="42000">
	    <!--
		<cannon name="machinegun" upgr="1" col="0" row="2"/>
		<cannon name="heavygun" upgr="0" col="2" row="1"/>
		-->
		<cannon name="heavygun" upgr="0" col="0" row="1"/>
		<cannon name="heavygun" upgr="0" col="2" row="2"/>
		<cannon name="heavygun" upgr="0" col="0" row="3"/>
		<cannon name="heavygun" upgr="0" col="2" row="4"/>
		<cannon name="heavygun" upgr="1" col="2" row="5"/>
		
	</settings>
	<group pause="0">
		<wave pause="0" lifeTime="40" side="left" img="1">
		    <enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit2" delay="1"/>
			<enemy name="unit2" delay="4"/>
			<enemy name="unit2" delay="7"/>
			<enemy name="unit2" delay="10"/>
			<enemy name="unit2" delay="13"/>
			<enemy name="unit2" delay="16"/>
			<enemy name="tanket" delay="18"/>
			<enemy name="tanket" delay="19"/>
			<enemy name="tanket" delay="20"/>
		</wave>
		<wave pause="0" lifeTime="40" side="right" img="1">
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit2" delay="1"/>
			<enemy name="unit2" delay="4"/>
			<enemy name="unit2" delay="7"/>
			<enemy name="unit2" delay="10"/>
			<enemy name="unit2" delay="13"/>
			<enemy name="unit2" delay="16"/>
			<enemy name="tanket" delay="18"/>
			<enemy name="tanket" delay="19"/>
			<enemy name="tanket" delay="20"/>
		</wave>
	</group>
	 <group pause="0">
		<wave pause="0" lifeTime="50" side="left" img="1">
			<enemy name="aerostat" delay="1"/>
			<enemy name="aerostat" delay="4"/>
			<enemy name="aerostat" delay="8"/>
			<enemy name="aerostat" delay="12"/>
			<enemy name="tanket" delay="1"/>
			<enemy name="tanket" delay="4"/>
			<enemy name="tanket" delay="8"/>
    	</wave>
		<wave pause="0" lifeTime="50" side="right" img="1">
			<enemy name="aerostat" delay="1"/>
			<enemy name="aerostat" delay="4"/>
			<enemy name="aerostat" delay="8"/>
			<enemy name="aerostat" delay="12"/>
			<enemy name="tanket" delay="1"/>
			<enemy name="tanket" delay="4"/>
			<enemy name="tanket" delay="8"/>
		</wave>
	</group>
	<group pause="0">
		<wave pause="0" lifeTime="20" side="left" img="1">
		   <enemy name="walker1" delay="1"/>
		</wave>
		<wave pause="0" lifeTime="20" side="right" img="1">
		   <enemy name="walker1" delay="1"/>
		</wave>
	</group>
	<group pause="0">
		<wave pause="0" lifeTime="30" side="left" img="1">
			<enemy name="unit2-line-2" delay="0"/>
			<enemy name="unit2-line-2" delay="2"/>
			<enemy name="unit2-line-2" delay="4"/>
			<enemy name="unit2-line-2" delay="8"/>
			<enemy name="unit2-line-2" delay="10"/>
			<enemy name="unit2-line-2" delay="12"/>
			<enemy name="unit2-line-2" delay="14"/>
			<enemy name="airplane" delay="1"/>
    	</wave>
		<wave pause="0" lifeTime="30" side="right" img="1">
			<enemy name="unit2-line-2" delay="0"/>
			<enemy name="unit2-line-2" delay="2"/>
			<enemy name="unit2-line-2" delay="4"/>
			<enemy name="unit2-line-2" delay="8"/>
			<enemy name="unit2-line-2" delay="10"/>
			<enemy name="unit2-line-2" delay="12"/>
			<enemy name="unit2-line-2" delay="14"/>
			<enemy name="airplane" delay="1"/>
		</wave>
	</group>
	<group pause="0">
		<wave pause="0" lifeTime="30" side="left" img="1">
			<enemy name="car" delay="0"/>
			<enemy name="tanket" delay="2"/>
			<enemy name="car" delay="4"/>
			<enemy name="tanket" delay="8"/>
			<enemy name="car" delay="10"/>
			<enemy name="tanket" delay="12"/>
			<enemy name="car" delay="14"/>
			<enemy name="parashut" delay="8"/>
			<enemy name="parashut" delay="10"/>
    	</wave>
		<wave pause="0" lifeTime="30" side="right" img="1">
			<enemy name="car" delay="0"/>
			<enemy name="tanket" delay="2"/>
			<enemy name="car" delay="4"/>
			<enemy name="tanket" delay="8"/>
			<enemy name="car" delay="10"/>
			<enemy name="tanket" delay="12"/>
			<enemy name="car" delay="14"/>
			<enemy name="parashut" delay="8"/>
			<enemy name="parashut" delay="10"/>
		</wave>
	</group>
	<group pause="0">
		<wave pause="0" lifeTime="30" side="left" img="1">
		    <enemy name="aerostat" delay="1"/>
			<enemy name="tank1" delay="10"/>
			<enemy name="unit1-line-4" delay="1"/>
			<enemy name="unit1-line-4" delay="2"/>
			<enemy name="unit1-line-4" delay="3"/>
			<enemy name="unit1-line-4" delay="4"/>
			<enemy name="unit1-line-4" delay="5"/>
			<enemy name="unit1-line-4" delay="6"/>
			<enemy name="unit1-line-4" delay="7"/>
			<enemy name="unit1-line-4" delay="8"/>
			<enemy name="unit1-line-4" delay="9"/>
			<enemy name="unit1-line-4" delay="10"/>
     	</wave>
		<wave pause="0" lifeTime="30" side="right" img="1">
            <enemy name="aerostat" delay="1"/>
			<enemy name="tank1" delay="10"/>
			<enemy name="unit1-line-4" delay="1"/>
			<enemy name="unit1-line-4" delay="2"/>
			<enemy name="unit1-line-4" delay="3"/>
			<enemy name="unit1-line-4" delay="4"/>
			<enemy name="unit1-line-4" delay="5"/>
			<enemy name="unit1-line-4" delay="6"/>
			<enemy name="unit1-line-4" delay="7"/>
			<enemy name="unit1-line-4" delay="8"/>
			<enemy name="unit1-line-4" delay="9"/>
			<enemy name="unit1-line-4" delay="10"/>
		</wave>
	</group>
	<group pause="0">
		<wave pause="0" lifeTime="20" side="left" img="1">
		   <enemy name="heli" delay="0"/>
		   <enemy name="heli" delay="2"/>
		   <enemy name="heli" delay="4"/>
		   <enemy name="heli" delay="6"/>
		   <enemy name="heli" delay="8"/>
		   <enemy name="heli" delay="10"/>
		   <enemy name="parashut" delay="0"/>
		   <enemy name="parashut" delay="5"/>
		   <enemy name="parashut" delay="10"/>
		   <enemy name="airplane" delay="1"/>
		</wave>
		<wave pause="0" lifeTime="20" side="right" img="1">
		   <enemy name="heli" delay="0"/>
		   <enemy name="heli" delay="2"/>
		   <enemy name="heli" delay="4"/>
		   <enemy name="heli" delay="6"/>
		   <enemy name="heli" delay="8"/>
		   <enemy name="heli" delay="10"/>
		   <enemy name="parashut" delay="0"/>
		   <enemy name="parashut" delay="5"/>
		   <enemy name="parashut" delay="10"/>
		   <enemy name="airplane" delay="1"/>
		</wave>
	</group>
	<group pause="0">
		<wave pause="0" lifeTime="20" side="left" img="1">
		   <enemy name="walker1" delay="0"/>
		   <enemy name="walker1" delay="8"/>
		   <enemy name="walker1" delay="16"/>
		   <enemy name="walker1" delay="24"/>
		</wave>
		<wave pause="0" lifeTime="20" side="right" img="1">
		   <enemy name="walker1" delay="0"/>
		   <enemy name="walker1" delay="8"/>
		   <enemy name="walker1" delay="16"/>
		   <enemy name="walker1" delay="24"/>
		</wave>
	</group>
	
</level>;
            var _loc_24:* = <level eye=""off"" money=""0"" maxTower=""3"" maxUpgrade=""2"" bg=""3"" upgradeTwo=""true"" threeStarHealth=""80"" twiStarHealth=""60"" preStartMoney=""2000"">
n	t
n<!-- 
n	tПушки
n	tстолбец - 0 лев, 1 центр, 2 прав
n	tстрока -  0 подвал, 1 первый, 2 второй, ...
n	tиндексы апгрейдов 
n	t1 - upgr2, 
n	t2 - upgr3_1, 
n	t3 - upgr4_1, 
n	t4 - upgr3_2, 
n	t5 - upgr4_2
n	t
n	tзначения для глаза(eye)  off, normal, always
n	t-->
n	t
n	t<settings towerLevel=""3"" towerHealth=""20"" globalUpgrades=""2"" maxCannons=""6"" machinegun=""true"" heavygun=""true"" lightning=""true"" saws=""true"" score=""44000"">
n	t    <!--
n	t	t<cannon name=""machinegun"" upgr=""1"" col=""0"" row=""2""/>
n	t	t<cannon name=""heavygun"" upgr=""0"" col=""2"" row=""1""/>
n	t	t-->
n	t	t<cannon name=""saw"" upgr=""4"" col=""0"" row=""3""/>
n	t	t<cannon name=""lightning"" upgr=""4"" col=""2"" row=""3""/>
n	t	t<cannon name=""saw"" upgr=""4"" col=""0"" row=""2""/>
n	t	t<cannon name=""lightning"" upgr=""4"" col=""2"" row=""2""/>
n	t	t<cannon name=""machinegun"" upgr=""4"" col=""0"" row=""1""/>
n	t	t<cannon name=""machinegun"" upgr=""4"" col=""2"" row=""1""/>
n	t	t
n	t</settings>
n	t <group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""30"" side=""left"" img=""1"">
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit2"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t<enemy name=""unit2"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit2"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit2"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit1"" delay=""17""/>
n	t	t	t<enemy name=""unit2"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit2"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit2"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit2"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t<enemy name=""unit2"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit2"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit2"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit1"" delay=""17""/>
n	t	t	t<enemy name=""unit2"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit2"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""car"" delay=""1""/>
n	t	t	t<enemy name=""car"" delay=""6""/>
n	t	t	t<enemy name=""car"" delay=""12""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""30"" side=""right"" img=""1"">
n	t	t	t<enemy name=""tank2"" delay=""1""/>
n	t	t	t<enemy name=""car"" delay=""1""/>
n	t	t	t<enemy name=""car"" delay=""6""/>
n	t	t	t<enemy name=""tank2"" delay=""4""/>
n	t	t	t<enemy name=""tank2"" delay=""7""/>
n	t	t	t<enemy name=""tank2"" delay=""10""/>
n	t	t	t<enemy name=""tank2"" delay=""13""/>
n	t	t	t<enemy name=""tank2"" delay=""16""/>
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n    	t</wave>
n	t</group>
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""30"" side=""right"" img=""1"">
n	t	t	t<enemy name=""parashut"" delay=""1""/>
n	t	t	t<enemy name=""parashut"" delay=""3""/>
n	t	t	t<enemy name=""parashut"" delay=""5""/>
n	t	t	t<enemy name=""parashut"" delay=""8""/>
n	t	t	t<enemy name=""parashut"" delay=""10""/>
n	t	t	t<enemy name=""parashut"" delay=""14""/>
n	t	t	t<enemy name=""parashut"" delay=""16""/>
n	t	t	t<enemy name=""parashut"" delay=""3""/>
n	t	t	t<enemy name=""parashut"" delay=""9""/>
n	t	t	t<enemy name=""parashut"" delay=""14""/>
n	t	t	t
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit2"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t<enemy name=""unit2"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""12""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit2"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""17""/>
n	t	t	t<enemy name=""unit2"" delay=""18""/>
n	t	t	t<enemy name=""unit1"" delay=""19""/>
n	t	t	t<enemy name=""unit1"" delay=""20""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""30"" side=""left"" img=""1"">
n	t	t    <enemy name=""walker1"" delay=""1""/>
n	t	t
n            <enemy name=""aerostat"" delay=""0""/>
n	t	t    <enemy name=""aerostat"" delay=""5""/>
n	t	t	t<enemy name=""aerostat"" delay=""10""/>
n	t	t	t<enemy name=""aerostat"" delay=""15""/>
n	t	t	t<enemy name=""aerostat"" delay=""20""/>
n	t	t	t
n	t	t	t<enemy name=""airplane"" delay=""2""/>
n	t	t	t<enemy name=""airplane"" delay=""8""/>
n	t	t	t<enemy name=""airplane"" delay=""18""/>
n	t	t	t
n	t	t	t<enemy name=""car"" delay=""1""/>
n	t	t	t<enemy name=""car"" delay=""5""/>
n	t	t	t<enemy name=""car"" delay=""15""/>
n	t	t	t<enemy name=""car"" delay=""20""/>
n	t	t	t
n	t	t	t<enemy name=""tanket"" delay=""2""/>	t	t	t
n	t	t	t<enemy name=""tanket"" delay=""8""/>	t	t	t
n	t	t	t<enemy name=""tanket"" delay=""18""/>	t
n    	t</wave>
n	t</group>
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""30"" side=""left"" img=""1"">
n	t    	t<enemy name=""walker1"" delay=""20""/>
n	t	t	t<enemy name=""tank1"" delay=""10""/>
n	t    	t<enemy name=""walker1"" delay=""60""/>
n	t	t	t<enemy name=""walker1"" delay=""80""/>
n	t	t	t<enemy name=""walker1"" delay=""90""/>
n	t	t	t
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t    <enemy name=""unit1"" delay=""2""/>
n	t	t    <enemy name=""unit1"" delay=""4""/>
n	t	t    <enemy name=""unit1"" delay=""6""/>
n	t	t    <enemy name=""unit1"" delay=""8""/>
n	t	t    <enemy name=""unit1"" delay=""10""/>
n	t	t    <enemy name=""unit1"" delay=""12""/>
n	t	t    <enemy name=""unit1"" delay=""14""/>
n	t	t    <enemy name=""unit1"" delay=""16""/>
n	t	t    <enemy name=""unit1"" delay=""18""/>
n	t	t    <enemy name=""unit1"" delay=""20""/>
n	t	t    <enemy name=""unit1"" delay=""22""/>
n	t	t    <enemy name=""unit1"" delay=""24""/>
n	t	t    <enemy name=""unit1"" delay=""26""/>
n	t	t    <enemy name=""unit1"" delay=""28""/>
n	t	t    <enemy name=""unit1"" delay=""30""/>
n	t	t	t
n	t	t	t<enemy name=""parashut"" delay=""30""/>
n	t	t	t<enemy name=""parashut"" delay=""32""/>
n	t	t    <enemy name=""parashut"" delay=""34""/>
n	t	t    <enemy name=""parashut"" delay=""36""/>
n	t	t	t
n	t	t	t<enemy name=""unit1-line-4"" delay=""42""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""43""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""44""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""45""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""46""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""47""/>
n	t	t	t<enemy name=""unit2"" delay=""35.5""/>
n	t	t	t<enemy name=""unit2"" delay=""37.5""/>
n	t	t	t<enemy name=""unit2"" delay=""38.5""/>
n	t	t	t
n	t	t	t<enemy name=""tanket"" delay=""30""/>
n	t	t	t<enemy name=""tanket"" delay=""50""/>
n	t	t	t<enemy name=""car"" delay=""70""/>
n	t	t	t
n	t	t	t<enemy name=""aerostat"" delay=""40""/>
n	t	t	t<enemy name=""aerostat"" delay=""20""/>
n	t	t	t<enemy name=""aerostat"" delay=""60""/>
n	t	t
n	t	t	t<enemy name=""parashut"" delay=""80""/>
n	t	t	t<enemy name=""parashut"" delay=""82""/>
n	t	t    <enemy name=""parashut"" delay=""84""/>
n	t	t    <enemy name=""parashut"" delay=""86""/>
n	t	t    <enemy name=""parashut"" delay=""88""/>
n	t	t    <enemy name=""parashut"" delay=""90""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""30"" side=""right"" img=""1"">
n	t	t    <enemy name=""tank3"" delay=""1""/>
n	t	t	t<enemy name=""tank3"" delay=""40""/>
n	t	t	t<enemy name=""tank3"" delay=""80""/>
n	t	t	t
n	t	t    <enemy name=""parashut"" delay=""10""/>
n	t	t	t<enemy name=""parashut"" delay=""11""/>
n	t	t    <enemy name=""parashut"" delay=""12""/>
n	t	t    <enemy name=""parashut"" delay=""13""/>
n	t	t    <enemy name=""parashut"" delay=""14""/>
n	t	t    <enemy name=""parashut"" delay=""15""/>
n	t	t    <enemy name=""parashut"" delay=""16""/>
n	t	t    <enemy name=""parashut"" delay=""17""/>
n	t	t    <enemy name=""parashut"" delay=""18""/>
n	t	t    <enemy name=""parashut"" delay=""19""/>
n	t	t    <enemy name=""parashut"" delay=""20""/>
n	t	t	t<enemy name=""parashut"" delay=""21""/>
n	t	t    <enemy name=""parashut"" delay=""22""/>
n	t	t    <enemy name=""parashut"" delay=""24""/>
n	t	t    <enemy name=""parashut"" delay=""26""/>
n	t	t    <enemy name=""parashut"" delay=""28""/>
n	t	t    <enemy name=""parashut"" delay=""30""/>
n	t	t	t
n	t	t	t<enemy name=""unit1-line-4"" delay=""22""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""23""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""24""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""25""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""26""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""27""/>
n	t	t	t<enemy name=""unit2"" delay=""15.5""/>
n	t	t	t<enemy name=""unit2"" delay=""16.5""/>
n	t	t	t<enemy name=""unit2"" delay=""17.5""/>
n	t	t	t
n	t	t	t<enemy name=""parashut"" delay=""22""/>
n	t	t    <enemy name=""parashut"" delay=""24""/>
n	t	t    <enemy name=""parashut"" delay=""26""/>
n	t	t    <enemy name=""parashut"" delay=""28""/>
n	t	t    <enemy name=""parashut"" delay=""30""/>
n	t	t    <enemy name=""parashut"" delay=""32""/>
n	t	t    <enemy name=""parashut"" delay=""34""/>
n	t	t    <enemy name=""parashut"" delay=""36""/>
n	t	t    <enemy name=""parashut"" delay=""38""/>
n	t	t    <enemy name=""parashut"" delay=""40""/>
n	t	t	t<enemy name=""parashut"" delay=""42""/>
n	t	t    <enemy name=""parashut"" delay=""44""/>
n	t	t    <enemy name=""parashut"" delay=""46""/>
n	t	t    <enemy name=""parashut"" delay=""48""/>
n	t	t    <enemy name=""parashut"" delay=""50""/>
n
n	t	t	t<enemy name=""unit1-line-4"" delay=""62""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""63""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""64""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""65""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""66""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""67""/>
n	t	t	t<enemy name=""unit2"" delay=""55.5""/>
n	t	t	t<enemy name=""unit2"" delay=""56.5""/>
n	t	t	t<enemy name=""unit2"" delay=""57.5""/>
n	t	t	t
n	t	t	t<enemy name=""tank2"" delay=""70""/>
n	t	t	t
n	t	t	t<enemy name=""parashut"" delay=""80""/>
n	t	t	t<enemy name=""parashut"" delay=""82""/>
n	t	t    <enemy name=""parashut"" delay=""84""/>
n	t	t    <enemy name=""parashut"" delay=""86""/>
n	t	t    <enemy name=""parashut"" delay=""88""/>
n	t	t    <enemy name=""parashut"" delay=""90""/>
n    	t</wave>
n	t</group>
n</level>")("<level eye="off" money="0" maxTower="3" maxUpgrade="2" bg="3" upgradeTwo="true" threeStarHealth="80" twiStarHealth="60" preStartMoney="2000">
	
<!-- 
	Пушки
	столбец - 0 лев, 1 центр, 2 прав
	строка -  0 подвал, 1 первый, 2 второй, ...
	индексы апгрейдов 
	1 - upgr2, 
	2 - upgr3_1, 
	3 - upgr4_1, 
	4 - upgr3_2, 
	5 - upgr4_2
	
	значения для глаза(eye)  off, normal, always
	-->
	
	<settings towerLevel="3" towerHealth="20" globalUpgrades="2" maxCannons="6" machinegun="true" heavygun="true" lightning="true" saws="true" score="44000">
	    <!--
		<cannon name="machinegun" upgr="1" col="0" row="2"/>
		<cannon name="heavygun" upgr="0" col="2" row="1"/>
		-->
		<cannon name="saw" upgr="4" col="0" row="3"/>
		<cannon name="lightning" upgr="4" col="2" row="3"/>
		<cannon name="saw" upgr="4" col="0" row="2"/>
		<cannon name="lightning" upgr="4" col="2" row="2"/>
		<cannon name="machinegun" upgr="4" col="0" row="1"/>
		<cannon name="machinegun" upgr="4" col="2" row="1"/>
		
	</settings>
	 <group pause="0">
		<wave pause="0" lifeTime="30" side="left" img="1">
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit2" delay="4"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit1" delay="7"/>
			<enemy name="unit2" delay="8"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit2" delay="11"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit2" delay="15"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit1" delay="17"/>
			<enemy name="unit2" delay="3"/>
			<enemy name="unit1" delay="7"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit2" delay="11"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit2" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit2" delay="4"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit1" delay="7"/>
			<enemy name="unit2" delay="8"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit2" delay="11"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit2" delay="15"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit1" delay="17"/>
			<enemy name="unit2" delay="3"/>
			<enemy name="unit1" delay="7"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit2" delay="11"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="car" delay="1"/>
			<enemy name="car" delay="6"/>
			<enemy name="car" delay="12"/>
		</wave>
		<wave pause="0" lifeTime="30" side="right" img="1">
			<enemy name="tank2" delay="1"/>
			<enemy name="car" delay="1"/>
			<enemy name="car" delay="6"/>
			<enemy name="tank2" delay="4"/>
			<enemy name="tank2" delay="7"/>
			<enemy name="tank2" delay="10"/>
			<enemy name="tank2" delay="13"/>
			<enemy name="tank2" delay="16"/>
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="15"/>
    	</wave>
	</group>
	<group pause="0">
		<wave pause="0" lifeTime="30" side="right" img="1">
			<enemy name="parashut" delay="1"/>
			<enemy name="parashut" delay="3"/>
			<enemy name="parashut" delay="5"/>
			<enemy name="parashut" delay="8"/>
			<enemy name="parashut" delay="10"/>
			<enemy name="parashut" delay="14"/>
			<enemy name="parashut" delay="16"/>
			<enemy name="parashut" delay="3"/>
			<enemy name="parashut" delay="9"/>
			<enemy name="parashut" delay="14"/>
			
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit2" delay="4"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit1" delay="7"/>
			<enemy name="unit2" delay="8"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="12"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit2" delay="14"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="17"/>
			<enemy name="unit2" delay="18"/>
			<enemy name="unit1" delay="19"/>
			<enemy name="unit1" delay="20"/>
		</wave>
		<wave pause="0" lifeTime="30" side="left" img="1">
		    <enemy name="walker1" delay="1"/>
		
            <enemy name="aerostat" delay="0"/>
		    <enemy name="aerostat" delay="5"/>
			<enemy name="aerostat" delay="10"/>
			<enemy name="aerostat" delay="15"/>
			<enemy name="aerostat" delay="20"/>
			
			<enemy name="airplane" delay="2"/>
			<enemy name="airplane" delay="8"/>
			<enemy name="airplane" delay="18"/>
			
			<enemy name="car" delay="1"/>
			<enemy name="car" delay="5"/>
			<enemy name="car" delay="15"/>
			<enemy name="car" delay="20"/>
			
			<enemy name="tanket" delay="2"/>			
			<enemy name="tanket" delay="8"/>			
			<enemy name="tanket" delay="18"/>	
    	</wave>
	</group>
	<group pause="0">
		<wave pause="0" lifeTime="30" side="left" img="1">
	    	<enemy name="walker1" delay="20"/>
			<enemy name="tank1" delay="10"/>
	    	<enemy name="walker1" delay="60"/>
			<enemy name="walker1" delay="80"/>
			<enemy name="walker1" delay="90"/>
			
			<enemy name="unit1" delay="1"/>
		    <enemy name="unit1" delay="2"/>
		    <enemy name="unit1" delay="4"/>
		    <enemy name="unit1" delay="6"/>
		    <enemy name="unit1" delay="8"/>
		    <enemy name="unit1" delay="10"/>
		    <enemy name="unit1" delay="12"/>
		    <enemy name="unit1" delay="14"/>
		    <enemy name="unit1" delay="16"/>
		    <enemy name="unit1" delay="18"/>
		    <enemy name="unit1" delay="20"/>
		    <enemy name="unit1" delay="22"/>
		    <enemy name="unit1" delay="24"/>
		    <enemy name="unit1" delay="26"/>
		    <enemy name="unit1" delay="28"/>
		    <enemy name="unit1" delay="30"/>
			
			<enemy name="parashut" delay="30"/>
			<enemy name="parashut" delay="32"/>
		    <enemy name="parashut" delay="34"/>
		    <enemy name="parashut" delay="36"/>
			
			<enemy name="unit1-line-4" delay="42"/>
			<enemy name="unit1-line-4" delay="43"/>
			<enemy name="unit1-line-4" delay="44"/>
			<enemy name="unit1-line-4" delay="45"/>
			<enemy name="unit1-line-4" delay="46"/>
			<enemy name="unit1-line-4" delay="47"/>
			<enemy name="unit2" delay="35.5"/>
			<enemy name="unit2" delay="37.5"/>
			<enemy name="unit2" delay="38.5"/>
			
			<enemy name="tanket" delay="30"/>
			<enemy name="tanket" delay="50"/>
			<enemy name="car" delay="70"/>
			
			<enemy name="aerostat" delay="40"/>
			<enemy name="aerostat" delay="20"/>
			<enemy name="aerostat" delay="60"/>
		
			<enemy name="parashut" delay="80"/>
			<enemy name="parashut" delay="82"/>
		    <enemy name="parashut" delay="84"/>
		    <enemy name="parashut" delay="86"/>
		    <enemy name="parashut" delay="88"/>
		    <enemy name="parashut" delay="90"/>
		</wave>
		<wave pause="0" lifeTime="30" side="right" img="1">
		    <enemy name="tank3" delay="1"/>
			<enemy name="tank3" delay="40"/>
			<enemy name="tank3" delay="80"/>
			
		    <enemy name="parashut" delay="10"/>
			<enemy name="parashut" delay="11"/>
		    <enemy name="parashut" delay="12"/>
		    <enemy name="parashut" delay="13"/>
		    <enemy name="parashut" delay="14"/>
		    <enemy name="parashut" delay="15"/>
		    <enemy name="parashut" delay="16"/>
		    <enemy name="parashut" delay="17"/>
		    <enemy name="parashut" delay="18"/>
		    <enemy name="parashut" delay="19"/>
		    <enemy name="parashut" delay="20"/>
			<enemy name="parashut" delay="21"/>
		    <enemy name="parashut" delay="22"/>
		    <enemy name="parashut" delay="24"/>
		    <enemy name="parashut" delay="26"/>
		    <enemy name="parashut" delay="28"/>
		    <enemy name="parashut" delay="30"/>
			
			<enemy name="unit1-line-4" delay="22"/>
			<enemy name="unit1-line-4" delay="23"/>
			<enemy name="unit1-line-4" delay="24"/>
			<enemy name="unit1-line-4" delay="25"/>
			<enemy name="unit1-line-4" delay="26"/>
			<enemy name="unit1-line-4" delay="27"/>
			<enemy name="unit2" delay="15.5"/>
			<enemy name="unit2" delay="16.5"/>
			<enemy name="unit2" delay="17.5"/>
			
			<enemy name="parashut" delay="22"/>
		    <enemy name="parashut" delay="24"/>
		    <enemy name="parashut" delay="26"/>
		    <enemy name="parashut" delay="28"/>
		    <enemy name="parashut" delay="30"/>
		    <enemy name="parashut" delay="32"/>
		    <enemy name="parashut" delay="34"/>
		    <enemy name="parashut" delay="36"/>
		    <enemy name="parashut" delay="38"/>
		    <enemy name="parashut" delay="40"/>
			<enemy name="parashut" delay="42"/>
		    <enemy name="parashut" delay="44"/>
		    <enemy name="parashut" delay="46"/>
		    <enemy name="parashut" delay="48"/>
		    <enemy name="parashut" delay="50"/>

			<enemy name="unit1-line-4" delay="62"/>
			<enemy name="unit1-line-4" delay="63"/>
			<enemy name="unit1-line-4" delay="64"/>
			<enemy name="unit1-line-4" delay="65"/>
			<enemy name="unit1-line-4" delay="66"/>
			<enemy name="unit1-line-4" delay="67"/>
			<enemy name="unit2" delay="55.5"/>
			<enemy name="unit2" delay="56.5"/>
			<enemy name="unit2" delay="57.5"/>
			
			<enemy name="tank2" delay="70"/>
			
			<enemy name="parashut" delay="80"/>
			<enemy name="parashut" delay="82"/>
		    <enemy name="parashut" delay="84"/>
		    <enemy name="parashut" delay="86"/>
		    <enemy name="parashut" delay="88"/>
		    <enemy name="parashut" delay="90"/>
    	</wave>
	</group>
</level>;
            var _loc_25:* = <level eye=""always"" money=""0"" maxTower=""5"" maxUpgrade=""2"" bg=""3"" upgradeTwo=""true"" threeStarHealth=""80"" twiStarHealth=""60"" preStartMoney=""2500"">
n	t
n<!-- 
n	tПушки
n	tстолбец - 0 лев, 1 центр, 2 прав
n	tстрока -  0 подвал, 1 первый, 2 второй, ...
n	tиндексы апгрейдов 
n	t1 - upgr2, 
n	t2 - upgr3_1, 
n	t3 - upgr4_1, 
n	t4 - upgr3_2, 
n	t5 - upgr4_2
n	t
n	tзначения для глаза(eye)  off, normal, always
n	t-->
n	t
n	t<settings towerLevel=""4"" towerHealth=""50"" globalUpgrades=""3"" maxCannons=""8"" machinegun=""false"" heavygun=""false"" lightning=""false"" saws=""false"" score=""46000"">
n	t    <!--
n	t	t<cannon name=""machinegun"" upgr=""1"" col=""0"" row=""2""/>
n	t	t<cannon name=""heavygun"" upgr=""0"" col=""2"" row=""1""/>
n	t	t-->
n	t	t<cannon name=""heavygun"" upgr=""4"" col=""0"" row=""3""/>
n	t	t<cannon name=""heavygun"" upgr=""4"" col=""2"" row=""3""/>
n	t	t<cannon name=""heavygun"" upgr=""4"" col=""2"" row=""1""/>
n	t	t<cannon name=""heavygun"" upgr=""4"" col=""0"" row=""1""/>
n	t</settings>
n	t
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""200"" side=""left"" img=""1"">
n	t	t	t<enemy name=""balloon"" delay=""1""/>
n	t	t	t<enemy name=""balloon"" delay=""5""/>
n	t	t	t<enemy name=""balloon"" delay=""10""/>
n	t	t	t<enemy name=""balloon"" delay=""15""/>
n	t	t	t<enemy name=""balloon"" delay=""20""/>
n	t	t	t<enemy name=""balloon"" delay=""30""/>
n	t	t	t<enemy name=""balloon"" delay=""35""/>
n	t	t	t<enemy name=""balloon"" delay=""40""/>
n	t	t	t<enemy name=""balloon"" delay=""50""/>
n	t	t	t<enemy name=""balloon"" delay=""55""/>
n	t	t	t<enemy name=""balloon"" delay=""60""/>
n	t	t	t<enemy name=""balloon"" delay=""70""/>
n	t	t	t<enemy name=""balloon"" delay=""75""/>
n	t	t	t<enemy name=""balloon"" delay=""80""/>
n	t	t	t<enemy name=""balloon"" delay=""85""/>
n	t	t	t<enemy name=""balloon"" delay=""90""/>
n	t	t	t
n	t	t	t<enemy name=""parashut"" delay=""20""/>
n	t	t	t<enemy name=""parashut"" delay=""22""/>
n	t	t	t<enemy name=""parashut"" delay=""24""/>
n	t	t	t<enemy name=""parashut"" delay=""26""/>
n	t	t	t<enemy name=""parashut"" delay=""28""/>
n	t	t	t<enemy name=""parashut"" delay=""30""/>
n	t	t	t<enemy name=""parashut"" delay=""32""/>
n	t	t	t<enemy name=""parashut"" delay=""34""/>
n	t	t	t<enemy name=""parashut"" delay=""36""/>
n	t	t	t<enemy name=""parashut"" delay=""38""/>
n	t	t	t<enemy name=""parashut"" delay=""40""/>
n	t	t	t<enemy name=""parashut"" delay=""42""/>
n	t	t	t<enemy name=""parashut"" delay=""44""/>
n	t	t	t<enemy name=""parashut"" delay=""46""/>
n	t	t	t<enemy name=""parashut"" delay=""48""/>
n	t	t	t<enemy name=""parashut"" delay=""50""/>
n	t	t	t<enemy name=""parashut"" delay=""52""/>
n	t	t	t<enemy name=""parashut"" delay=""54""/>
n	t	t	t<enemy name=""parashut"" delay=""56""/>
n	t	t	t<enemy name=""parashut"" delay=""58""/>
n	t	t	t<enemy name=""parashut"" delay=""60""/>
n	t	t	t<enemy name=""parashut"" delay=""62""/>
n	t	t	t<enemy name=""parashut"" delay=""64""/>
n	t	t	t<enemy name=""parashut"" delay=""66""/>
n	t	t	t<enemy name=""parashut"" delay=""68""/>
n	t	t	t<enemy name=""parashut"" delay=""70""/>
n	t	t	t
n	t	t	t<enemy name=""heli"" delay=""50""/>
n	t	t	t<enemy name=""heli"" delay=""60""/>
n	t	t	t<enemy name=""heli"" delay=""70""/>
n	t	t	t<enemy name=""heli"" delay=""80""/>
n	t	t	t<enemy name=""heli"" delay=""55""/>
n	t	t	t<enemy name=""heli"" delay=""65""/>
n	t	t	t<enemy name=""heli"" delay=""75""/>
n	t	t	t<enemy name=""heli"" delay=""85""/>
n	t	t	t
n	t	t	t<enemy name=""airplane"" delay=""20""/>
n	t	t	t<enemy name=""airplane"" delay=""30""/>
n	t	t	t<enemy name=""airplane"" delay=""40""/>
n	t	t	t<enemy name=""airplane"" delay=""50""/>
n	t	t	t<enemy name=""airplane"" delay=""60""/>
n	t	t	t<enemy name=""airplane"" delay=""70""/>
n	t	t	t<enemy name=""airplane"" delay=""80""/>
n	t	t	t
n	t	t	t<enemy name=""walker1"" delay=""1""/>
n	t	t
n	t	t  	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""6""/>
n	t	t	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t
n	t	t	t<enemy name=""tank2"" delay=""10""/>
n	t	t	t<enemy name=""tank2"" delay=""13""/>
n	t	t	t<enemy name=""tank2"" delay=""16""/>
n	t	t	t
n	t	t	t<enemy name=""tank3"" delay=""20""/>
n	t	t	t<enemy name=""unit2"" delay=""24""/>
n	t	t	t<enemy name=""unit2"" delay=""26""/>
n	t	t	t<enemy name=""unit2"" delay=""28""/>
n	t	t	t
n	t	t	t<enemy name=""tank3"" delay=""30""/>
n	t	t	t<enemy name=""unit2"" delay=""34""/>
n	t	t	t<enemy name=""unit2"" delay=""36""/>
n	t	t	t<enemy name=""unit2"" delay=""38""/>
n
n	t	t	t<enemy name=""tank3"" delay=""40""/>
n	t	t	t<enemy name=""unit2"" delay=""44""/>
n	t	t	t<enemy name=""unit2"" delay=""46""/>
n	t	t	t<enemy name=""unit2"" delay=""48""/>
n	t	t	t
n	t	t	t<enemy name=""walker1"" delay=""50""/>
n	t	t	t<enemy name=""tanket"" delay=""55""/>
n	t	t	t<enemy name=""tanket"" delay=""60""/>
n	t	t	t
n	t	t	t<enemy name=""walker1"" delay=""70""/>
n	t	t	t<enemy name=""tanket"" delay=""75""/>
n	t	t	t<enemy name=""tanket"" delay=""80""/>
n	t	t	t
n	t	t	t<enemy name=""unit1"" delay=""50""/>
n	t	t	t<enemy name=""unit1"" delay=""51""/>
n	t	t	t<enemy name=""unit1"" delay=""52""/>
n	t	t	t<enemy name=""unit1"" delay=""53""/>
n	t	t	t<enemy name=""unit1"" delay=""54""/>
n	t	t	t<enemy name=""unit1"" delay=""55""/>
n	t	t	t<enemy name=""unit1"" delay=""56""/>
n	t	t	t<enemy name=""unit1"" delay=""57""/>
n	t	t	t<enemy name=""unit1"" delay=""58""/>
n	t	t	t<enemy name=""unit1"" delay=""59""/>
n	t	t	t<enemy name=""unit1"" delay=""60""/>
n	t	t	t<enemy name=""unit1"" delay=""61""/>
n	t	t	t<enemy name=""unit1"" delay=""62""/>
n	t	t	t<enemy name=""unit1"" delay=""63""/>
n	t	t	t<enemy name=""unit1"" delay=""64""/>
n	t	t	t<enemy name=""unit1"" delay=""65""/>
n	t	t	t<enemy name=""unit1"" delay=""66""/>
n	t	t	t<enemy name=""unit1"" delay=""67""/>
n	t	t	t<enemy name=""unit1"" delay=""68""/>
n	t	t	t<enemy name=""unit1"" delay=""69""/>
n	t	t	t<enemy name=""unit1"" delay=""70""/>
n	t	t	t<enemy name=""unit1"" delay=""71""/>
n	t	t	t<enemy name=""unit1"" delay=""72""/>
n	t	t	t<enemy name=""unit1"" delay=""73""/>
n	t	t	t<enemy name=""unit1"" delay=""74""/>
n	t	t	t<enemy name=""unit1"" delay=""75""/>
n	t	t	t<enemy name=""unit1"" delay=""76""/>
n	t	t	t<enemy name=""unit1"" delay=""77""/>
n	t	t	t<enemy name=""unit1"" delay=""78""/>
n	t	t	t<enemy name=""unit1"" delay=""79""/>
n	t	t	t
n	t	t	t<enemy name=""tank3"" delay=""78""/>
n	t	t	t
n	t	t	t<enemy name=""airplane"" delay=""84""/>
n	t	t	t<enemy name=""airplane"" delay=""88""/>
n	t	t	t<enemy name=""airplane"" delay=""92""/>
n	t	t	t<enemy name=""airplane"" delay=""96""/>
n	t	t	t<enemy name=""airplane"" delay=""100""/>
n	t	t	t
n	t	t	t<enemy name=""walker1"" delay=""85""/>
n	t	t	t<enemy name=""walker1"" delay=""90""/>
n
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""200"" side=""right"" img=""1"">
n	t	t  	t<enemy name=""balloon"" delay=""1""/>
n	t	t	t<enemy name=""balloon"" delay=""5""/>
n	t	t	t<enemy name=""balloon"" delay=""10""/>
n	t	t	t<enemy name=""balloon"" delay=""15""/>
n	t	t	t<enemy name=""balloon"" delay=""20""/>
n	t	t	t<enemy name=""balloon"" delay=""30""/>
n	t	t	t<enemy name=""balloon"" delay=""35""/>
n	t	t	t<enemy name=""balloon"" delay=""40""/>
n	t	t	t<enemy name=""balloon"" delay=""50""/>
n	t	t	t<enemy name=""balloon"" delay=""55""/>
n	t	t	t<enemy name=""balloon"" delay=""60""/>
n	t	t	t<enemy name=""balloon"" delay=""70""/>
n	t	t	t<enemy name=""balloon"" delay=""75""/>
n	t	t	t<enemy name=""balloon"" delay=""80""/>
n	t	t	t<enemy name=""balloon"" delay=""85""/>
n	t	t	t<enemy name=""balloon"" delay=""90""/>
n	t	t	t
n	t	t	t<enemy name=""parashut"" delay=""20""/>
n	t	t	t<enemy name=""parashut"" delay=""22""/>
n	t	t	t<enemy name=""parashut"" delay=""24""/>
n	t	t	t<enemy name=""parashut"" delay=""26""/>
n	t	t	t<enemy name=""parashut"" delay=""28""/>
n	t	t	t<enemy name=""parashut"" delay=""30""/>
n	t	t	t<enemy name=""parashut"" delay=""32""/>
n	t	t	t<enemy name=""parashut"" delay=""34""/>
n	t	t	t<enemy name=""parashut"" delay=""36""/>
n	t	t	t<enemy name=""parashut"" delay=""38""/>
n	t	t	t<enemy name=""parashut"" delay=""40""/>
n	t	t	t<enemy name=""parashut"" delay=""42""/>
n	t	t	t<enemy name=""parashut"" delay=""44""/>
n	t	t	t<enemy name=""parashut"" delay=""46""/>
n	t	t	t<enemy name=""parashut"" delay=""48""/>
n	t	t	t<enemy name=""parashut"" delay=""50""/>
n	t	t	t<enemy name=""parashut"" delay=""52""/>
n	t	t	t<enemy name=""parashut"" delay=""54""/>
n	t	t	t<enemy name=""parashut"" delay=""56""/>
n	t	t	t<enemy name=""parashut"" delay=""58""/>
n	t	t	t<enemy name=""parashut"" delay=""60""/>
n	t	t	t<enemy name=""parashut"" delay=""62""/>
n	t	t	t<enemy name=""parashut"" delay=""64""/>
n	t	t	t<enemy name=""parashut"" delay=""66""/>
n	t	t	t<enemy name=""parashut"" delay=""68""/>
n	t	t	t<enemy name=""parashut"" delay=""70""/>
n	t	t	t<enemy name=""parashut"" delay=""72""/>
n	t	t	t<enemy name=""parashut"" delay=""74""/>
n	t	t	t<enemy name=""parashut"" delay=""76""/>
n	t	t	t<enemy name=""parashut"" delay=""78""/>
n	t	t	t<enemy name=""parashut"" delay=""80""/>
n	t	t	t
n	t	t	t<enemy name=""heli"" delay=""50""/>
n	t	t	t<enemy name=""heli"" delay=""60""/>
n	t	t	t<enemy name=""heli"" delay=""70""/>
n	t	t	t<enemy name=""heli"" delay=""80""/>
n	t	t	t
n	t	t	t<enemy name=""airplane"" delay=""20""/>
n	t	t	t<enemy name=""airplane"" delay=""30""/>
n	t	t	t<enemy name=""airplane"" delay=""40""/>
n	t	t	t<enemy name=""airplane"" delay=""50""/>
n	t	t	t<enemy name=""airplane"" delay=""60""/>
n	t	t	t<enemy name=""airplane"" delay=""70""/>
n	t	t	t<enemy name=""airplane"" delay=""80""/>
n	t	t	t
n	t	t	t<enemy name=""walker1"" delay=""1""/>
n	t	t
n	t	t  	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""6""/>
n	t	t	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t
n	t	t	t<enemy name=""unit2-line-3"" delay=""20""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""21""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""22""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""23""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""24""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""25""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""26""/>
n	t	t	t
n	t	t	t<enemy name=""walker1"" delay=""28""/>
n	t	t	t
n	t	t	t<enemy name=""unit2-line-3"" delay=""30""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""31""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""32""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""33""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""34""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""35""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""36""/>
n	t	t	t
n	t	t	t<enemy name=""walker1"" delay=""38""/>
n
n	t	t	t<enemy name=""unit2-line-3"" delay=""40""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""41""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""42""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""43""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""44""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""45""/>
n	t	t	t<enemy name=""unit1-line-3"" delay=""46""/>
n	t	t	t
n	t	t	t<enemy name=""walker1"" delay=""50""/>
n	t	t	t<enemy name=""unit2"" delay=""55""/>
n	t	t	t<enemy name=""unit2"" delay=""58""/>
n	t	t	t<enemy name=""unit2"" delay=""60""/>
n	t	t	t
n	t	t	t<enemy name=""walker1"" delay=""70""/>
n	t	t	t<enemy name=""unit2"" delay=""75""/>
n	t	t	t<enemy name=""unit2"" delay=""78""/>
n	t	t	t<enemy name=""unit2"" delay=""80""/>
n	t	t	t
n	t	t	t<enemy name=""unit1"" delay=""50""/>
n	t	t	t<enemy name=""unit1"" delay=""51""/>
n	t	t	t<enemy name=""unit1"" delay=""52""/>
n	t	t	t<enemy name=""unit1"" delay=""53""/>
n	t	t	t<enemy name=""unit1"" delay=""54""/>
n	t	t	t<enemy name=""unit1"" delay=""55""/>
n	t	t	t<enemy name=""unit1"" delay=""56""/>
n	t	t	t<enemy name=""unit1"" delay=""57""/>
n	t	t	t<enemy name=""unit1"" delay=""58""/>
n	t	t	t<enemy name=""unit1"" delay=""59""/>
n	t	t	t<enemy name=""unit1"" delay=""60""/>
n	t	t	t<enemy name=""unit1"" delay=""61""/>
n	t	t	t<enemy name=""unit1"" delay=""62""/>
n	t	t	t<enemy name=""unit1"" delay=""63""/>
n	t	t	t<enemy name=""unit1"" delay=""64""/>
n	t	t	t<enemy name=""unit1"" delay=""65""/>
n	t	t	t<enemy name=""unit1"" delay=""66""/>
n	t	t	t<enemy name=""unit1"" delay=""67""/>
n	t	t	t<enemy name=""unit1"" delay=""68""/>
n	t	t	t<enemy name=""unit1"" delay=""69""/>
n	t	t	t<enemy name=""unit1"" delay=""70""/>
n	t	t	t<enemy name=""unit1"" delay=""71""/>
n	t	t	t<enemy name=""unit1"" delay=""72""/>
n	t	t	t<enemy name=""unit1"" delay=""73""/>
n	t	t	t<enemy name=""unit1"" delay=""74""/>
n	t	t	t<enemy name=""unit1"" delay=""75""/>
n	t	t	t<enemy name=""unit1"" delay=""76""/>
n	t	t	t<enemy name=""unit1"" delay=""77""/>
n	t	t	t<enemy name=""unit1"" delay=""78""/>
n	t	t	t<enemy name=""unit1"" delay=""79""/>
n	t	t	t
n	t	t	t<enemy name=""tank3"" delay=""78""/>
n	t	t	t
n	t	t	t<enemy name=""airplane"" delay=""84""/>
n	t	t	t<enemy name=""airplane"" delay=""88""/>
n	t	t	t<enemy name=""airplane"" delay=""92""/>
n	t	t	t<enemy name=""airplane"" delay=""96""/>
n	t	t	t<enemy name=""airplane"" delay=""100""/>
n	t	t	t
n	t	t	t<enemy name=""walker1"" delay=""85""/>
n	t	t	t<enemy name=""walker1"" delay=""90""/>
n	t	t</wave>
n	t</group>
n</level>")("<level eye="always" money="0" maxTower="5" maxUpgrade="2" bg="3" upgradeTwo="true" threeStarHealth="80" twiStarHealth="60" preStartMoney="2500">
	
<!-- 
	Пушки
	столбец - 0 лев, 1 центр, 2 прав
	строка -  0 подвал, 1 первый, 2 второй, ...
	индексы апгрейдов 
	1 - upgr2, 
	2 - upgr3_1, 
	3 - upgr4_1, 
	4 - upgr3_2, 
	5 - upgr4_2
	
	значения для глаза(eye)  off, normal, always
	-->
	
	<settings towerLevel="4" towerHealth="50" globalUpgrades="3" maxCannons="8" machinegun="false" heavygun="false" lightning="false" saws="false" score="46000">
	    <!--
		<cannon name="machinegun" upgr="1" col="0" row="2"/>
		<cannon name="heavygun" upgr="0" col="2" row="1"/>
		-->
		<cannon name="heavygun" upgr="4" col="0" row="3"/>
		<cannon name="heavygun" upgr="4" col="2" row="3"/>
		<cannon name="heavygun" upgr="4" col="2" row="1"/>
		<cannon name="heavygun" upgr="4" col="0" row="1"/>
	</settings>
	
	<group pause="0">
		<wave pause="0" lifeTime="200" side="left" img="1">
			<enemy name="balloon" delay="1"/>
			<enemy name="balloon" delay="5"/>
			<enemy name="balloon" delay="10"/>
			<enemy name="balloon" delay="15"/>
			<enemy name="balloon" delay="20"/>
			<enemy name="balloon" delay="30"/>
			<enemy name="balloon" delay="35"/>
			<enemy name="balloon" delay="40"/>
			<enemy name="balloon" delay="50"/>
			<enemy name="balloon" delay="55"/>
			<enemy name="balloon" delay="60"/>
			<enemy name="balloon" delay="70"/>
			<enemy name="balloon" delay="75"/>
			<enemy name="balloon" delay="80"/>
			<enemy name="balloon" delay="85"/>
			<enemy name="balloon" delay="90"/>
			
			<enemy name="parashut" delay="20"/>
			<enemy name="parashut" delay="22"/>
			<enemy name="parashut" delay="24"/>
			<enemy name="parashut" delay="26"/>
			<enemy name="parashut" delay="28"/>
			<enemy name="parashut" delay="30"/>
			<enemy name="parashut" delay="32"/>
			<enemy name="parashut" delay="34"/>
			<enemy name="parashut" delay="36"/>
			<enemy name="parashut" delay="38"/>
			<enemy name="parashut" delay="40"/>
			<enemy name="parashut" delay="42"/>
			<enemy name="parashut" delay="44"/>
			<enemy name="parashut" delay="46"/>
			<enemy name="parashut" delay="48"/>
			<enemy name="parashut" delay="50"/>
			<enemy name="parashut" delay="52"/>
			<enemy name="parashut" delay="54"/>
			<enemy name="parashut" delay="56"/>
			<enemy name="parashut" delay="58"/>
			<enemy name="parashut" delay="60"/>
			<enemy name="parashut" delay="62"/>
			<enemy name="parashut" delay="64"/>
			<enemy name="parashut" delay="66"/>
			<enemy name="parashut" delay="68"/>
			<enemy name="parashut" delay="70"/>
			
			<enemy name="heli" delay="50"/>
			<enemy name="heli" delay="60"/>
			<enemy name="heli" delay="70"/>
			<enemy name="heli" delay="80"/>
			<enemy name="heli" delay="55"/>
			<enemy name="heli" delay="65"/>
			<enemy name="heli" delay="75"/>
			<enemy name="heli" delay="85"/>
			
			<enemy name="airplane" delay="20"/>
			<enemy name="airplane" delay="30"/>
			<enemy name="airplane" delay="40"/>
			<enemy name="airplane" delay="50"/>
			<enemy name="airplane" delay="60"/>
			<enemy name="airplane" delay="70"/>
			<enemy name="airplane" delay="80"/>
			
			<enemy name="walker1" delay="1"/>
		
		  	<enemy name="unit1" delay="5"/>
			<enemy name="unit1" delay="6"/>
			<enemy name="unit1" delay="7"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit1" delay="10"/>
			
			<enemy name="tank2" delay="10"/>
			<enemy name="tank2" delay="13"/>
			<enemy name="tank2" delay="16"/>
			
			<enemy name="tank3" delay="20"/>
			<enemy name="unit2" delay="24"/>
			<enemy name="unit2" delay="26"/>
			<enemy name="unit2" delay="28"/>
			
			<enemy name="tank3" delay="30"/>
			<enemy name="unit2" delay="34"/>
			<enemy name="unit2" delay="36"/>
			<enemy name="unit2" delay="38"/>

			<enemy name="tank3" delay="40"/>
			<enemy name="unit2" delay="44"/>
			<enemy name="unit2" delay="46"/>
			<enemy name="unit2" delay="48"/>
			
			<enemy name="walker1" delay="50"/>
			<enemy name="tanket" delay="55"/>
			<enemy name="tanket" delay="60"/>
			
			<enemy name="walker1" delay="70"/>
			<enemy name="tanket" delay="75"/>
			<enemy name="tanket" delay="80"/>
			
			<enemy name="unit1" delay="50"/>
			<enemy name="unit1" delay="51"/>
			<enemy name="unit1" delay="52"/>
			<enemy name="unit1" delay="53"/>
			<enemy name="unit1" delay="54"/>
			<enemy name="unit1" delay="55"/>
			<enemy name="unit1" delay="56"/>
			<enemy name="unit1" delay="57"/>
			<enemy name="unit1" delay="58"/>
			<enemy name="unit1" delay="59"/>
			<enemy name="unit1" delay="60"/>
			<enemy name="unit1" delay="61"/>
			<enemy name="unit1" delay="62"/>
			<enemy name="unit1" delay="63"/>
			<enemy name="unit1" delay="64"/>
			<enemy name="unit1" delay="65"/>
			<enemy name="unit1" delay="66"/>
			<enemy name="unit1" delay="67"/>
			<enemy name="unit1" delay="68"/>
			<enemy name="unit1" delay="69"/>
			<enemy name="unit1" delay="70"/>
			<enemy name="unit1" delay="71"/>
			<enemy name="unit1" delay="72"/>
			<enemy name="unit1" delay="73"/>
			<enemy name="unit1" delay="74"/>
			<enemy name="unit1" delay="75"/>
			<enemy name="unit1" delay="76"/>
			<enemy name="unit1" delay="77"/>
			<enemy name="unit1" delay="78"/>
			<enemy name="unit1" delay="79"/>
			
			<enemy name="tank3" delay="78"/>
			
			<enemy name="airplane" delay="84"/>
			<enemy name="airplane" delay="88"/>
			<enemy name="airplane" delay="92"/>
			<enemy name="airplane" delay="96"/>
			<enemy name="airplane" delay="100"/>
			
			<enemy name="walker1" delay="85"/>
			<enemy name="walker1" delay="90"/>

		</wave>
		<wave pause="0" lifeTime="200" side="right" img="1">
		  	<enemy name="balloon" delay="1"/>
			<enemy name="balloon" delay="5"/>
			<enemy name="balloon" delay="10"/>
			<enemy name="balloon" delay="15"/>
			<enemy name="balloon" delay="20"/>
			<enemy name="balloon" delay="30"/>
			<enemy name="balloon" delay="35"/>
			<enemy name="balloon" delay="40"/>
			<enemy name="balloon" delay="50"/>
			<enemy name="balloon" delay="55"/>
			<enemy name="balloon" delay="60"/>
			<enemy name="balloon" delay="70"/>
			<enemy name="balloon" delay="75"/>
			<enemy name="balloon" delay="80"/>
			<enemy name="balloon" delay="85"/>
			<enemy name="balloon" delay="90"/>
			
			<enemy name="parashut" delay="20"/>
			<enemy name="parashut" delay="22"/>
			<enemy name="parashut" delay="24"/>
			<enemy name="parashut" delay="26"/>
			<enemy name="parashut" delay="28"/>
			<enemy name="parashut" delay="30"/>
			<enemy name="parashut" delay="32"/>
			<enemy name="parashut" delay="34"/>
			<enemy name="parashut" delay="36"/>
			<enemy name="parashut" delay="38"/>
			<enemy name="parashut" delay="40"/>
			<enemy name="parashut" delay="42"/>
			<enemy name="parashut" delay="44"/>
			<enemy name="parashut" delay="46"/>
			<enemy name="parashut" delay="48"/>
			<enemy name="parashut" delay="50"/>
			<enemy name="parashut" delay="52"/>
			<enemy name="parashut" delay="54"/>
			<enemy name="parashut" delay="56"/>
			<enemy name="parashut" delay="58"/>
			<enemy name="parashut" delay="60"/>
			<enemy name="parashut" delay="62"/>
			<enemy name="parashut" delay="64"/>
			<enemy name="parashut" delay="66"/>
			<enemy name="parashut" delay="68"/>
			<enemy name="parashut" delay="70"/>
			<enemy name="parashut" delay="72"/>
			<enemy name="parashut" delay="74"/>
			<enemy name="parashut" delay="76"/>
			<enemy name="parashut" delay="78"/>
			<enemy name="parashut" delay="80"/>
			
			<enemy name="heli" delay="50"/>
			<enemy name="heli" delay="60"/>
			<enemy name="heli" delay="70"/>
			<enemy name="heli" delay="80"/>
			
			<enemy name="airplane" delay="20"/>
			<enemy name="airplane" delay="30"/>
			<enemy name="airplane" delay="40"/>
			<enemy name="airplane" delay="50"/>
			<enemy name="airplane" delay="60"/>
			<enemy name="airplane" delay="70"/>
			<enemy name="airplane" delay="80"/>
			
			<enemy name="walker1" delay="1"/>
		
		  	<enemy name="unit1" delay="5"/>
			<enemy name="unit1" delay="6"/>
			<enemy name="unit1" delay="7"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit1" delay="10"/>
			
			<enemy name="unit2-line-3" delay="20"/>
			<enemy name="unit2-line-3" delay="21"/>
			<enemy name="unit2-line-3" delay="22"/>
			<enemy name="unit2-line-3" delay="23"/>
			<enemy name="unit2-line-3" delay="24"/>
			<enemy name="unit2-line-3" delay="25"/>
			<enemy name="unit2-line-3" delay="26"/>
			
			<enemy name="walker1" delay="28"/>
			
			<enemy name="unit2-line-3" delay="30"/>
			<enemy name="unit2-line-3" delay="31"/>
			<enemy name="unit2-line-3" delay="32"/>
			<enemy name="unit2-line-3" delay="33"/>
			<enemy name="unit2-line-3" delay="34"/>
			<enemy name="unit2-line-3" delay="35"/>
			<enemy name="unit2-line-3" delay="36"/>
			
			<enemy name="walker1" delay="38"/>

			<enemy name="unit2-line-3" delay="40"/>
			<enemy name="unit2-line-3" delay="41"/>
			<enemy name="unit2-line-3" delay="42"/>
			<enemy name="unit2-line-3" delay="43"/>
			<enemy name="unit2-line-3" delay="44"/>
			<enemy name="unit2-line-3" delay="45"/>
			<enemy name="unit1-line-3" delay="46"/>
			
			<enemy name="walker1" delay="50"/>
			<enemy name="unit2" delay="55"/>
			<enemy name="unit2" delay="58"/>
			<enemy name="unit2" delay="60"/>
			
			<enemy name="walker1" delay="70"/>
			<enemy name="unit2" delay="75"/>
			<enemy name="unit2" delay="78"/>
			<enemy name="unit2" delay="80"/>
			
			<enemy name="unit1" delay="50"/>
			<enemy name="unit1" delay="51"/>
			<enemy name="unit1" delay="52"/>
			<enemy name="unit1" delay="53"/>
			<enemy name="unit1" delay="54"/>
			<enemy name="unit1" delay="55"/>
			<enemy name="unit1" delay="56"/>
			<enemy name="unit1" delay="57"/>
			<enemy name="unit1" delay="58"/>
			<enemy name="unit1" delay="59"/>
			<enemy name="unit1" delay="60"/>
			<enemy name="unit1" delay="61"/>
			<enemy name="unit1" delay="62"/>
			<enemy name="unit1" delay="63"/>
			<enemy name="unit1" delay="64"/>
			<enemy name="unit1" delay="65"/>
			<enemy name="unit1" delay="66"/>
			<enemy name="unit1" delay="67"/>
			<enemy name="unit1" delay="68"/>
			<enemy name="unit1" delay="69"/>
			<enemy name="unit1" delay="70"/>
			<enemy name="unit1" delay="71"/>
			<enemy name="unit1" delay="72"/>
			<enemy name="unit1" delay="73"/>
			<enemy name="unit1" delay="74"/>
			<enemy name="unit1" delay="75"/>
			<enemy name="unit1" delay="76"/>
			<enemy name="unit1" delay="77"/>
			<enemy name="unit1" delay="78"/>
			<enemy name="unit1" delay="79"/>
			
			<enemy name="tank3" delay="78"/>
			
			<enemy name="airplane" delay="84"/>
			<enemy name="airplane" delay="88"/>
			<enemy name="airplane" delay="92"/>
			<enemy name="airplane" delay="96"/>
			<enemy name="airplane" delay="100"/>
			
			<enemy name="walker1" delay="85"/>
			<enemy name="walker1" delay="90"/>
		</wave>
	</group>
</level>;
            var _loc_26:* = <level eye=""off"" money=""199000"" maxTower=""5"" maxUpgrade=""5"" bg=""4"" upgradeTwo=""true"" threeStarHealth=""80"" twiStarHealth=""60"" preStartMoney=""3000"">
n	t
n<!-- 
n	tПушки
n	tстолбец - 0 лев, 1 центр, 2 прав
n	tстрока -  0 подвал, 1 первый, 2 второй, ...
n	tиндексы апгрейдов 
n	t1 - upgr2, 
n	t2 - upgr3_1, 
n	t3 - upgr4_1, 
n	t4 - upgr3_2, 
n	t5 - upgr4_2
n	t
n	tзначения для глаза(eye)  off, normal, always
n	t-->
n	t
n	t<settings towerLevel=""5"" towerHealth=""100"" globalUpgrades=""3"" maxCannons=""10"" machinegun=""true"" heavygun=""true"" lightning=""false"" saws=""true"" score=""48000"">
n	t    <!--
n	t	t<cannon name=""machinegun"" upgr=""1"" col=""0"" row=""2""/>
n	t	t<cannon name=""heavygun"" upgr=""0"" col=""2"" row=""1""/>
n	t	t<cannon name=""saw"" upgr=""0"" col=""0"" row=""1""/>
n	t	t<cannon name=""saw"" upgr=""0"" col=""2"" row=""1""/>
n	t	t<cannon name=""saw"" upgr=""0"" col=""2"" row=""2""/>
n	t	t<cannon name=""saw"" upgr=""0"" col=""0"" row=""2""/>
n	t	t<cannon name=""saw"" upgr=""0"" col=""0"" row=""3""/>
n	t	t<cannon name=""saw"" upgr=""0"" col=""2"" row=""3""/>
n	t	t<cannon name=""heavygun"" upgr=""0"" col=""0"" row=""4""/>
n	t	t<cannon name=""heavygun"" upgr=""0"" col=""2"" row=""4""/>
n	t	t<cannon name=""heavygun"" upgr=""0"" col=""2"" row=""5""/>
n	t	t<cannon name=""heavygun"" upgr=""0"" col=""0"" row=""5""/>
n	t	t-->
n	t</settings>
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""300"" side=""left"" img=""1"">
n	t	t  	t<enemy name=""tank1"" delay=""0""/>
n	t	t  	t<enemy name=""unit1"" delay=""4""/>
n	t	t  	t<enemy name=""unit1"" delay=""5""/>
n	t	t  	t<enemy name=""unit1"" delay=""6""/>
n	t	t  	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t
n	t	t	t<enemy name=""tanket"" delay=""29""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""30""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""31""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""32""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""33""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""34""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""35""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""36""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""37""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""38""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""39""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""40""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""41""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""42""/>
n
n	t	t	t<enemy name=""unit1-line-4"" delay=""47""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""48""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""49""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""50""/>
n	t	t	t<enemy name=""wheel"" delay=""40""/>
n	t	t	t<enemy name=""wheel"" delay=""41""/>
n	t	t	t<enemy name=""wheel"" delay=""42""/>
n	t	t	t<enemy name=""wheel"" delay=""43""/>
n	t	t	t<enemy name=""wheel"" delay=""44""/>
n	t	t	t<enemy name=""wheel"" delay=""45""/>
n	t	t	t<enemy name=""wheel"" delay=""46""/>
n	t	t	t<enemy name=""wheel"" delay=""47""/>
n	t	t	t<enemy name=""wheel"" delay=""48""/>
n	t	t	t<enemy name=""wheel"" delay=""49""/>
n	t	t	t<enemy name=""wheel"" delay=""50""/>
n	t	t	t
n	t	t	t<enemy name=""tanket"" delay=""55""/>
n	t	t	t<enemy name=""car"" delay=""60""/>
n	t	t	t<enemy name=""tanket"" delay=""65""/>
n	t	t	t<enemy name=""unit2"" delay=""70""/>
n	t	t	t<enemy name=""tanket"" delay=""75""/>
n	t	t	t
n	t	t	t<enemy name=""airplane"" delay=""80""/>
n	t	t	t<enemy name=""airplane"" delay=""81""/>
n	t	t	t<enemy name=""airplane"" delay=""82""/>
n	t	t	t<enemy name=""airplane"" delay=""83""/>
n	t	t	t<enemy name=""airplane"" delay=""84""/>
n	t	t	t<enemy name=""airplane"" delay=""85""/>
n	t	t	t<enemy name=""airplane"" delay=""86""/>
n	t	t	t<enemy name=""airplane"" delay=""87""/>
n	t	t	t
n	t	t	t<enemy name=""parashut"" delay=""85""/>
n	t	t	t<enemy name=""parashut"" delay=""86""/>
n	t	t	t<enemy name=""parashut"" delay=""87""/>
n	t	t	t<enemy name=""parashut"" delay=""88""/>
n	t	t	t<enemy name=""parashut"" delay=""89""/>
n	t	t	t<enemy name=""parashut"" delay=""90""/>
n	t	t	t<enemy name=""parashut"" delay=""91""/>
n	t	t	t<enemy name=""parashut"" delay=""92""/>
n	t	t	t<enemy name=""parashut"" delay=""93""/>
n	t	t	t<enemy name=""parashut"" delay=""94""/>
n	t	t	t<enemy name=""parashut"" delay=""95""/>
n	t	t	t<enemy name=""parashut"" delay=""96""/>
n	t	t	t<enemy name=""parashut"" delay=""97""/>
n	t	t	t<enemy name=""parashut"" delay=""98""/>
n	t	t	t<enemy name=""parashut"" delay=""99""/>
n	t	t	t<enemy name=""parashut"" delay=""100""/>
n	t	t	t
n	t	t	t<enemy name=""airplane"" delay=""115""/>
n	t	t	t<enemy name=""airplane"" delay=""120""/>
n	t	t	t<enemy name=""heli"" delay=""115""/>
n	t	t	t<enemy name=""heli"" delay=""120""/>
n	t	t	t<enemy name=""heli"" delay=""124""/>
n	t	t	t<enemy name=""heli"" delay=""127""/>
n	t	t	t<enemy name=""parashut"" delay=""117""/>
n	t	t	t<enemy name=""parashut"" delay=""121""/>
n	t	t	t<enemy name=""parashut"" delay=""125""/>
n	t	t	t<enemy name=""parashut"" delay=""129""/>
n	t	t	t<enemy name=""car"" delay=""117""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""120""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""121""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""122""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""123""/>
n	t	t	t
n	t	t	t<enemy name=""tank2"" delay=""135""/>
n	t	t	t
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""300"" side=""right"" img=""1"">
n	t	t  	t<enemy name=""tank1"" delay=""0""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t  	t<enemy name=""unit1"" delay=""5""/>
n	t	t  	t<enemy name=""unit1"" delay=""6""/>
n	t	t  	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t
n	t	t	t<enemy name=""tanket"" delay=""29""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""30""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""31""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""32""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""33""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""34""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""35""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""36""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""37""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""38""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""39""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""40""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""41""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""42""/>
n
n	t	t	t<enemy name=""unit1-line-4"" delay=""47""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""48""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""49""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""50""/>
n	t	t	t<enemy name=""wheel"" delay=""40""/>
n	t	t	t<enemy name=""wheel"" delay=""41""/>
n	t	t	t<enemy name=""wheel"" delay=""42""/>
n	t	t	t<enemy name=""wheel"" delay=""43""/>
n	t	t	t<enemy name=""wheel"" delay=""44""/>
n	t	t	t<enemy name=""wheel"" delay=""45""/>
n	t	t	t<enemy name=""wheel"" delay=""46""/>
n	t	t	t<enemy name=""wheel"" delay=""47""/>
n	t	t	t<enemy name=""wheel"" delay=""48""/>
n	t	t	t<enemy name=""wheel"" delay=""49""/>
n	t	t	t<enemy name=""wheel"" delay=""50""/>
n	t	t	t
n	t	t	t<enemy name=""tanket"" delay=""55""/>
n	t	t	t<enemy name=""car"" delay=""60""/>
n	t	t	t<enemy name=""tanket"" delay=""65""/>
n	t	t	t<enemy name=""unit2"" delay=""70""/>
n	t	t	t<enemy name=""tanket"" delay=""75""/>
n	t	t	t
n	t	t	t<enemy name=""airplane"" delay=""80""/>
n	t	t	t<enemy name=""airplane"" delay=""81""/>
n	t	t	t<enemy name=""airplane"" delay=""82""/>
n	t	t	t<enemy name=""airplane"" delay=""83""/>
n	t	t	t<enemy name=""airplane"" delay=""84""/>
n	t	t	t<enemy name=""airplane"" delay=""85""/>
n	t	t	t<enemy name=""airplane"" delay=""86""/>
n	t	t	t<enemy name=""airplane"" delay=""87""/>
n	t	t	t
n	t	t	t<enemy name=""parashut"" delay=""85""/>
n	t	t	t<enemy name=""parashut"" delay=""86""/>
n	t	t	t<enemy name=""parashut"" delay=""87""/>
n	t	t	t<enemy name=""parashut"" delay=""88""/>
n	t	t	t<enemy name=""parashut"" delay=""89""/>
n	t	t	t<enemy name=""parashut"" delay=""90""/>
n	t	t	t<enemy name=""parashut"" delay=""91""/>
n	t	t	t<enemy name=""parashut"" delay=""92""/>
n	t	t	t<enemy name=""parashut"" delay=""93""/>
n	t	t	t<enemy name=""parashut"" delay=""94""/>
n	t	t	t<enemy name=""parashut"" delay=""95""/>
n	t	t	t<enemy name=""parashut"" delay=""96""/>
n	t	t	t<enemy name=""parashut"" delay=""97""/>
n	t	t	t<enemy name=""parashut"" delay=""98""/>
n	t	t	t<enemy name=""parashut"" delay=""99""/>
n	t	t	t<enemy name=""parashut"" delay=""100""/>
n	t	t	t
n	t	t	t<enemy name=""airplane"" delay=""115""/>
n	t	t	t<enemy name=""airplane"" delay=""120""/>
n	t	t	t<enemy name=""heli"" delay=""115""/>
n	t	t	t<enemy name=""heli"" delay=""120""/>
n	t	t	t<enemy name=""heli"" delay=""124""/>
n	t	t	t<enemy name=""heli"" delay=""127""/>
n	t	t	t<enemy name=""parashut"" delay=""117""/>
n	t	t	t<enemy name=""parashut"" delay=""121""/>
n	t	t	t<enemy name=""parashut"" delay=""125""/>
n	t	t	t<enemy name=""parashut"" delay=""129""/>
n	t	t	t<enemy name=""car"" delay=""117""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""120""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""121""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""122""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""123""/>
n	t	t	t
n	t	t	t<enemy name=""tank2"" delay=""135""/>
n	t	t</wave>
n	t</group>
n</level>")("<level eye="off" money="199000" maxTower="5" maxUpgrade="5" bg="4" upgradeTwo="true" threeStarHealth="80" twiStarHealth="60" preStartMoney="3000">
	
<!-- 
	Пушки
	столбец - 0 лев, 1 центр, 2 прав
	строка -  0 подвал, 1 первый, 2 второй, ...
	индексы апгрейдов 
	1 - upgr2, 
	2 - upgr3_1, 
	3 - upgr4_1, 
	4 - upgr3_2, 
	5 - upgr4_2
	
	значения для глаза(eye)  off, normal, always
	-->
	
	<settings towerLevel="5" towerHealth="100" globalUpgrades="3" maxCannons="10" machinegun="true" heavygun="true" lightning="false" saws="true" score="48000">
	    <!--
		<cannon name="machinegun" upgr="1" col="0" row="2"/>
		<cannon name="heavygun" upgr="0" col="2" row="1"/>
		<cannon name="saw" upgr="0" col="0" row="1"/>
		<cannon name="saw" upgr="0" col="2" row="1"/>
		<cannon name="saw" upgr="0" col="2" row="2"/>
		<cannon name="saw" upgr="0" col="0" row="2"/>
		<cannon name="saw" upgr="0" col="0" row="3"/>
		<cannon name="saw" upgr="0" col="2" row="3"/>
		<cannon name="heavygun" upgr="0" col="0" row="4"/>
		<cannon name="heavygun" upgr="0" col="2" row="4"/>
		<cannon name="heavygun" upgr="0" col="2" row="5"/>
		<cannon name="heavygun" upgr="0" col="0" row="5"/>
		-->
	</settings>
	<group pause="0">
		<wave pause="0" lifeTime="300" side="left" img="1">
		  	<enemy name="tank1" delay="0"/>
		  	<enemy name="unit1" delay="4"/>
		  	<enemy name="unit1" delay="5"/>
		  	<enemy name="unit1" delay="6"/>
		  	<enemy name="unit1" delay="7"/>
			
			<enemy name="tanket" delay="29"/>
			<enemy name="unit2-line-3" delay="30"/>
			<enemy name="unit2-line-3" delay="31"/>
			<enemy name="unit2-line-3" delay="32"/>
			<enemy name="unit2-line-3" delay="33"/>
			<enemy name="unit2-line-3" delay="34"/>
			<enemy name="unit2-line-3" delay="35"/>
			<enemy name="unit2-line-3" delay="36"/>
			<enemy name="unit2-line-3" delay="37"/>
			<enemy name="unit2-line-3" delay="38"/>
			<enemy name="unit2-line-3" delay="39"/>
			<enemy name="unit2-line-3" delay="40"/>
			<enemy name="unit2-line-3" delay="41"/>
			<enemy name="unit2-line-3" delay="42"/>

			<enemy name="unit1-line-4" delay="47"/>
			<enemy name="unit1-line-4" delay="48"/>
			<enemy name="unit1-line-4" delay="49"/>
			<enemy name="unit1-line-4" delay="50"/>
			<enemy name="wheel" delay="40"/>
			<enemy name="wheel" delay="41"/>
			<enemy name="wheel" delay="42"/>
			<enemy name="wheel" delay="43"/>
			<enemy name="wheel" delay="44"/>
			<enemy name="wheel" delay="45"/>
			<enemy name="wheel" delay="46"/>
			<enemy name="wheel" delay="47"/>
			<enemy name="wheel" delay="48"/>
			<enemy name="wheel" delay="49"/>
			<enemy name="wheel" delay="50"/>
			
			<enemy name="tanket" delay="55"/>
			<enemy name="car" delay="60"/>
			<enemy name="tanket" delay="65"/>
			<enemy name="unit2" delay="70"/>
			<enemy name="tanket" delay="75"/>
			
			<enemy name="airplane" delay="80"/>
			<enemy name="airplane" delay="81"/>
			<enemy name="airplane" delay="82"/>
			<enemy name="airplane" delay="83"/>
			<enemy name="airplane" delay="84"/>
			<enemy name="airplane" delay="85"/>
			<enemy name="airplane" delay="86"/>
			<enemy name="airplane" delay="87"/>
			
			<enemy name="parashut" delay="85"/>
			<enemy name="parashut" delay="86"/>
			<enemy name="parashut" delay="87"/>
			<enemy name="parashut" delay="88"/>
			<enemy name="parashut" delay="89"/>
			<enemy name="parashut" delay="90"/>
			<enemy name="parashut" delay="91"/>
			<enemy name="parashut" delay="92"/>
			<enemy name="parashut" delay="93"/>
			<enemy name="parashut" delay="94"/>
			<enemy name="parashut" delay="95"/>
			<enemy name="parashut" delay="96"/>
			<enemy name="parashut" delay="97"/>
			<enemy name="parashut" delay="98"/>
			<enemy name="parashut" delay="99"/>
			<enemy name="parashut" delay="100"/>
			
			<enemy name="airplane" delay="115"/>
			<enemy name="airplane" delay="120"/>
			<enemy name="heli" delay="115"/>
			<enemy name="heli" delay="120"/>
			<enemy name="heli" delay="124"/>
			<enemy name="heli" delay="127"/>
			<enemy name="parashut" delay="117"/>
			<enemy name="parashut" delay="121"/>
			<enemy name="parashut" delay="125"/>
			<enemy name="parashut" delay="129"/>
			<enemy name="car" delay="117"/>
			<enemy name="unit1-line-4" delay="120"/>
			<enemy name="unit1-line-4" delay="121"/>
			<enemy name="unit1-line-4" delay="122"/>
			<enemy name="unit1-line-4" delay="123"/>
			
			<enemy name="tank2" delay="135"/>
			
		</wave>
		<wave pause="0" lifeTime="300" side="right" img="1">
		  	<enemy name="tank1" delay="0"/>
			<enemy name="unit1" delay="4"/>
		  	<enemy name="unit1" delay="5"/>
		  	<enemy name="unit1" delay="6"/>
		  	<enemy name="unit1" delay="7"/>
			
			<enemy name="tanket" delay="29"/>
			<enemy name="unit2-line-3" delay="30"/>
			<enemy name="unit2-line-3" delay="31"/>
			<enemy name="unit2-line-3" delay="32"/>
			<enemy name="unit2-line-3" delay="33"/>
			<enemy name="unit2-line-3" delay="34"/>
			<enemy name="unit2-line-3" delay="35"/>
			<enemy name="unit2-line-3" delay="36"/>
			<enemy name="unit2-line-3" delay="37"/>
			<enemy name="unit2-line-3" delay="38"/>
			<enemy name="unit2-line-3" delay="39"/>
			<enemy name="unit2-line-3" delay="40"/>
			<enemy name="unit2-line-3" delay="41"/>
			<enemy name="unit2-line-3" delay="42"/>

			<enemy name="unit1-line-4" delay="47"/>
			<enemy name="unit1-line-4" delay="48"/>
			<enemy name="unit1-line-4" delay="49"/>
			<enemy name="unit1-line-4" delay="50"/>
			<enemy name="wheel" delay="40"/>
			<enemy name="wheel" delay="41"/>
			<enemy name="wheel" delay="42"/>
			<enemy name="wheel" delay="43"/>
			<enemy name="wheel" delay="44"/>
			<enemy name="wheel" delay="45"/>
			<enemy name="wheel" delay="46"/>
			<enemy name="wheel" delay="47"/>
			<enemy name="wheel" delay="48"/>
			<enemy name="wheel" delay="49"/>
			<enemy name="wheel" delay="50"/>
			
			<enemy name="tanket" delay="55"/>
			<enemy name="car" delay="60"/>
			<enemy name="tanket" delay="65"/>
			<enemy name="unit2" delay="70"/>
			<enemy name="tanket" delay="75"/>
			
			<enemy name="airplane" delay="80"/>
			<enemy name="airplane" delay="81"/>
			<enemy name="airplane" delay="82"/>
			<enemy name="airplane" delay="83"/>
			<enemy name="airplane" delay="84"/>
			<enemy name="airplane" delay="85"/>
			<enemy name="airplane" delay="86"/>
			<enemy name="airplane" delay="87"/>
			
			<enemy name="parashut" delay="85"/>
			<enemy name="parashut" delay="86"/>
			<enemy name="parashut" delay="87"/>
			<enemy name="parashut" delay="88"/>
			<enemy name="parashut" delay="89"/>
			<enemy name="parashut" delay="90"/>
			<enemy name="parashut" delay="91"/>
			<enemy name="parashut" delay="92"/>
			<enemy name="parashut" delay="93"/>
			<enemy name="parashut" delay="94"/>
			<enemy name="parashut" delay="95"/>
			<enemy name="parashut" delay="96"/>
			<enemy name="parashut" delay="97"/>
			<enemy name="parashut" delay="98"/>
			<enemy name="parashut" delay="99"/>
			<enemy name="parashut" delay="100"/>
			
			<enemy name="airplane" delay="115"/>
			<enemy name="airplane" delay="120"/>
			<enemy name="heli" delay="115"/>
			<enemy name="heli" delay="120"/>
			<enemy name="heli" delay="124"/>
			<enemy name="heli" delay="127"/>
			<enemy name="parashut" delay="117"/>
			<enemy name="parashut" delay="121"/>
			<enemy name="parashut" delay="125"/>
			<enemy name="parashut" delay="129"/>
			<enemy name="car" delay="117"/>
			<enemy name="unit1-line-4" delay="120"/>
			<enemy name="unit1-line-4" delay="121"/>
			<enemy name="unit1-line-4" delay="122"/>
			<enemy name="unit1-line-4" delay="123"/>
			
			<enemy name="tank2" delay="135"/>
		</wave>
	</group>
</level>;
            var _loc_27:* = <level eye=""off"" money=""41000"" maxTower=""5"" maxUpgrade=""5"" bg=""4"" upgradeTwo=""true"" threeStarHealth=""80"" twiStarHealth=""60"" preStartMoney=""3000"">
n	t<!-- 
n	tПушки
n	tстолбец - 0 лев, 1 центр, 2 прав
n	tстрока -  0 подвал, 1 первый, 2 второй, ...
n	tиндексы апгрейдов 
n	t1 - upgr2, 
n	t2 - upgr3_1, 
n	t3 - upgr4_1, 
n	t4 - upgr3_2, 
n	t5 - upgr4_2
n	t
n	tзначения для глаза(eye)  off, normal, always
n	t-->
n	t
n	t<settings towerLevel=""3"" towerHealth=""100"" globalUpgrades=""4"" maxCannons=""10"" machinegun=""true"" heavygun=""false"" lightning=""true"" saws=""true"" score=""50000"">
n	t    <!--
n	t	t<cannon name=""machinegun"" upgr=""1"" col=""0"" row=""2""/>
n	t	t<cannon name=""heavygun"" upgr=""0"" col=""2"" row=""1""/>
n	t	t<cannon name=""saw"" upgr=""0"" col=""0"" row=""1""/>
n	t	t<cannon name=""saw"" upgr=""0"" col=""2"" row=""1""/>
n	t	t<cannon name=""saw"" upgr=""0"" col=""2"" row=""2""/>
n	t	t<cannon name=""saw"" upgr=""0"" col=""0"" row=""2""/>
n	t	t<cannon name=""saw"" upgr=""0"" col=""0"" row=""3""/>
n	t	t<cannon name=""saw"" upgr=""0"" col=""2"" row=""3""/>
n	t	t-->
n	t	t<cannon name=""lightning"" upgr=""5"" col=""2"" row=""2""/>
n	t	t<cannon name=""lightning"" upgr=""5"" col=""0"" row=""2""/>
n	t</settings>
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""50"" side=""left"" img=""1"">
n	t	t	t<enemy name=""balloon"" delay=""1""/>
n	t	t	t<enemy name=""balloon"" delay=""5""/>
n	t	t	t<enemy name=""balloon"" delay=""10""/>
n	t	t	t<enemy name=""balloon"" delay=""15""/>
n	t	t	t<enemy name=""parashut"" delay=""5""/>
n	t	t	t<enemy name=""parashut"" delay=""9""/>
n	t	t	t<enemy name=""parashut"" delay=""12""/>
n	t	t	t<enemy name=""parashut"" delay=""15""/>
n	t	t	t<enemy name=""parashut"" delay=""20""/>
n	t	t	t
n	t	t	t<enemy name=""walker1"" delay=""10""/>
n	t	t	t
n	t	t	t<enemy name=""unit1-line-4"" delay=""27""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""27.5""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""30""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""30.5""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""33""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""33.5""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""36""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""36.5""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""39""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""39.5""/>
n	t	t	t
n	t	t	t<enemy name=""walker1"" delay=""40""/>
n	t	t	t<enemy name=""balloon"" delay=""50""/>
n	t	t	t
n	t	t	t<enemy name=""parashut"" delay=""41""/>
n	t	t	t<enemy name=""parashut"" delay=""43""/>
n	t	t	t<enemy name=""parashut"" delay=""45""/>
n	t	t	t<enemy name=""parashut"" delay=""50""/>
n	t	t	t
n	t	t	t<enemy name=""unit2"" delay=""42""/>
n	t	t	t<enemy name=""unit2"" delay=""44""/>
n	t	t	t<enemy name=""unit2"" delay=""46""/>
n	t	t	t<enemy name=""unit2"" delay=""48""/>
n	t	t	t<enemy name=""unit2"" delay=""50""/>
n	t	t	t
n	t	t	t<enemy name=""car-line-2"" delay=""65""/>
n	t	t	t<enemy name=""car-line-2"" delay=""70""/>
n	t	t	t<enemy name=""car-line-2"" delay=""75""/>
n	t	t	t<enemy name=""car-line-2"" delay=""80""/>
n	t	t	t
n	t	t	t<enemy name=""unit2"" delay=""82""/>
n	t	t	t<enemy name=""unit2"" delay=""84""/>
n	t	t	t<enemy name=""unit2"" delay=""86""/>
n	t	t	t<enemy name=""unit2"" delay=""88""/>
n	t	t	t<enemy name=""unit2"" delay=""90""/>
n	t	t	t
n	t	t	t<enemy name=""balloon"" delay=""80""/>
n	t	t	t<enemy name=""balloon"" delay=""84""/>
n	t	t	t<enemy name=""balloon"" delay=""88""/>
n	t	t	t<enemy name=""balloon"" delay=""92""/>
n	t	t	t
n	t	t	t<enemy name=""parashut"" delay=""100""/>
n	t	t	t<enemy name=""parashut"" delay=""105""/>
n	t	t	t<enemy name=""parashut"" delay=""95""/>
n	t	t	t
n	t	t	t<enemy name=""unit2"" delay=""100""/>
n	t	t	t
n	t	t	t<enemy name=""walker2"" delay=""110""/>
n	t	t	t<enemy name=""unit2"" delay=""116""/>
n	t	t	t<enemy name=""unit2"" delay=""118""/>
n	t	t	t<enemy name=""unit2"" delay=""119""/>
n	t	t	t
n	t	t	t<enemy name=""heli"" delay=""140""/>
n	t	t	t<enemy name=""heli"" delay=""144""/>
n	t	t	t<enemy name=""heli"" delay=""148""/>
n	t	t	t<enemy name=""heli"" delay=""152""/>
n	t	t	t<enemy name=""heli"" delay=""156""/>
n	t	t	t
n	t	t	t<enemy name=""wheel"" delay=""140""/>
n	t	t	t<enemy name=""wheel"" delay=""142""/>
n	t	t	t<enemy name=""wheel"" delay=""145""/>
n	t	t	t<enemy name=""wheel"" delay=""147""/>
n	t	t	t<enemy name=""wheel"" delay=""150""/>
n	t	t	t<enemy name=""wheel"" delay=""152""/>
n	t	t	t<enemy name=""wheel"" delay=""155""/>
n	t	t	t<enemy name=""wheel"" delay=""157""/>
n	t	t	t
n	t	t	t<enemy name=""unit1-line-4"" delay=""160""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""160.5""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""163""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""163.5""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""166""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""166.5""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""169""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""169.5""/>
n	t	t	t
n	t	t	t<enemy name=""tanket"" delay=""170""/>
n	t	t	t<enemy name=""tanket"" delay=""172""/>
n	t	t	t<enemy name=""tanket"" delay=""174""/>
n	t	t	t<enemy name=""tanket"" delay=""176""/>
n	t	t	t<enemy name=""tanket"" delay=""178""/>
n	t	t	t<enemy name=""tanket"" delay=""180""/>
n	t	t	t<enemy name=""tanket"" delay=""182""/>
n	t	t	t<enemy name=""tanket"" delay=""184""/>
n	t	t	t<enemy name=""tanket"" delay=""186""/>
n	t	t	t<enemy name=""tanket"" delay=""188""/>
n	t	t	t<enemy name=""tanket"" delay=""190""/>
n	t	t	t
n	t	t	t<enemy name=""balloon"" delay=""170""/>
n	t	t	t<enemy name=""balloon"" delay=""174""/>
n	t	t	t<enemy name=""balloon"" delay=""178""/>
n	t	t	t<enemy name=""balloon"" delay=""182""/>
n	t	t	t<enemy name=""balloon"" delay=""184""/>
n	t	t	t<enemy name=""balloon"" delay=""186""/>
n	t	t	t
n	t	t	t<enemy name=""walker2"" delay=""190""/>
n	t	t	t<enemy name=""parashut"" delay=""180""/>
n	t	t	t<enemy name=""parashut"" delay=""184""/>
n	t	t	t<enemy name=""parashut"" delay=""188""/>
n	t	t	t<enemy name=""parashut"" delay=""190""/>
n	t	t	t<enemy name=""parashut"" delay=""192""/>
n	t	t	t<enemy name=""parashut"" delay=""194""/>
n	t	t	t<enemy name=""parashut"" delay=""195""/>
n	t	t	t<enemy name=""parashut"" delay=""196""/>
n	t	t	t<enemy name=""parashut"" delay=""197""/>
n	t	t	t<enemy name=""parashut"" delay=""198""/>
n	t	t	t<enemy name=""parashut"" delay=""199""/>
n	t	t	t<enemy name=""parashut"" delay=""200""/>
n	t	t	t<enemy name=""parashut"" delay=""201""/>
n	t	t	t<enemy name=""parashut"" delay=""202""/>
n	t	t	t<enemy name=""parashut"" delay=""203""/>
n	t	t	t<enemy name=""parashut"" delay=""204""/>
n	t	t	t<enemy name=""parashut"" delay=""205""/>
n	t	t	t<enemy name=""parashut"" delay=""206""/>
n	t	t	t<enemy name=""parashut"" delay=""207""/>
n	t	t	t<enemy name=""parashut"" delay=""208""/>
n	t	t	t
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""50"" side=""right"" img=""1"">
n	t	t	t<enemy name=""balloon"" delay=""1""/>
n	t	t	t<enemy name=""balloon"" delay=""5""/>
n	t	t	t<enemy name=""balloon"" delay=""10""/>
n	t	t	t<enemy name=""balloon"" delay=""15""/>
n	t	t	t<enemy name=""parashut"" delay=""5""/>
n	t	t	t<enemy name=""parashut"" delay=""9""/>
n	t	t	t<enemy name=""parashut"" delay=""12""/>
n	t	t	t<enemy name=""parashut"" delay=""15""/>
n	t	t	t<enemy name=""parashut"" delay=""20""/>
n	t	t	t
n	t	t	t<enemy name=""walker1"" delay=""10""/>
n	t	t	t
n	t	t	t<enemy name=""unit1-line-4"" delay=""27""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""27.5""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""30""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""30.5""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""33""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""33.5""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""36""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""36.5""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""39""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""39.5""/>
n	t	t	t
n	t	t	t<enemy name=""walker1"" delay=""40""/>
n	t	t	t<enemy name=""balloon"" delay=""50""/>
n	t	t	t
n	t	t	t<enemy name=""parashut"" delay=""41""/>
n	t	t	t<enemy name=""parashut"" delay=""43""/>
n	t	t	t<enemy name=""parashut"" delay=""45""/>
n	t	t	t<enemy name=""parashut"" delay=""50""/>
n	t	t	t
n	t	t	t<enemy name=""unit2"" delay=""42""/>
n	t	t	t<enemy name=""unit2"" delay=""44""/>
n	t	t	t<enemy name=""unit2"" delay=""46""/>
n	t	t	t<enemy name=""unit2"" delay=""48""/>
n	t	t	t<enemy name=""unit2"" delay=""50""/>
n	t	t	t
n	t	t	t<enemy name=""walker1"" delay=""60""/>
n	t	t	t<enemy name=""unit2"" delay=""62""/>
n	t	t	t<enemy name=""unit2"" delay=""64""/>
n	t	t	t<enemy name=""walker1"" delay=""67""/>
n	t	t	t<enemy name=""unit2"" delay=""66""/>
n	t	t	t<enemy name=""unit2"" delay=""69""/>
n	t	t	t
n	t	t	t<enemy name=""walker2"" delay=""80""/>
n	t	t	t<enemy name=""unit2"" delay=""76""/>
n	t	t	t<enemy name=""unit2"" delay=""84""/>
n	t	t	t<enemy name=""unit2"" delay=""86""/>
n	t	t	t
n	t	t	t<enemy name=""car-line-2"" delay=""110""/>
n	t	t	t<enemy name=""car-line-2"" delay=""115""/>
n	t	t	t<enemy name=""car-line-2"" delay=""120""/>
n	t	t	t<enemy name=""car-line-2"" delay=""125""/>
n	t	t	t
n	t	t	t<enemy name=""heli"" delay=""140""/>
n	t	t	t<enemy name=""heli"" delay=""144""/>
n	t	t	t<enemy name=""heli"" delay=""148""/>
n	t	t	t<enemy name=""heli"" delay=""152""/>
n	t	t	t<enemy name=""heli"" delay=""156""/>
n	t	t	t
n	t	t	t<enemy name=""tank1-line-2"" delay=""140""/>
n	t	t	t<enemy name=""tank1-line-2"" delay=""145""/>
n	t	t	t<enemy name=""tank1-line-2"" delay=""150""/>
n	t	t	t<enemy name=""tank1-line-2"" delay=""155""/>
n	t	t	t
n	t	t	t<enemy name=""unit1-line-4"" delay=""160""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""160.5""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""163""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""163.5""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""166""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""166.5""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""169""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""169.5""/>
n	t	t	t
n	t	t	t<enemy name=""tanket"" delay=""170""/>
n	t	t	t<enemy name=""tanket"" delay=""172""/>
n	t	t	t<enemy name=""tanket"" delay=""174""/>
n	t	t	t<enemy name=""tanket"" delay=""176""/>
n	t	t	t<enemy name=""tanket"" delay=""178""/>
n	t	t	t<enemy name=""tanket"" delay=""180""/>
n	t	t	t<enemy name=""tanket"" delay=""182""/>
n	t	t	t<enemy name=""tanket"" delay=""184""/>
n	t	t	t<enemy name=""tanket"" delay=""186""/>
n	t	t	t<enemy name=""tanket"" delay=""188""/>
n	t	t	t<enemy name=""tanket"" delay=""190""/>
n	t	t	t
n	t	t	t<enemy name=""balloon"" delay=""170""/>
n	t	t	t<enemy name=""balloon"" delay=""174""/>
n	t	t	t<enemy name=""balloon"" delay=""178""/>
n	t	t	t<enemy name=""balloon"" delay=""182""/>
n	t	t	t<enemy name=""balloon"" delay=""184""/>
n	t	t	t<enemy name=""balloon"" delay=""186""/>
n	t	t	t
n	t	t	t<enemy name=""walker2"" delay=""190""/>
n	t	t	t<enemy name=""parashut"" delay=""180""/>
n	t	t	t<enemy name=""parashut"" delay=""184""/>
n	t	t	t<enemy name=""parashut"" delay=""188""/>
n	t	t	t<enemy name=""parashut"" delay=""190""/>
n	t	t	t<enemy name=""parashut"" delay=""192""/>
n	t	t	t<enemy name=""parashut"" delay=""194""/>
n	t	t	t<enemy name=""parashut"" delay=""195""/>
n	t	t	t<enemy name=""parashut"" delay=""196""/>
n	t	t	t<enemy name=""parashut"" delay=""197""/>
n	t	t	t<enemy name=""parashut"" delay=""198""/>
n	t	t	t<enemy name=""parashut"" delay=""199""/>
n	t	t	t<enemy name=""parashut"" delay=""200""/>
n	t	t	t<enemy name=""parashut"" delay=""201""/>
n	t	t	t<enemy name=""parashut"" delay=""202""/>
n	t	t	t<enemy name=""parashut"" delay=""203""/>
n	t	t	t<enemy name=""parashut"" delay=""204""/>
n	t	t	t<enemy name=""parashut"" delay=""205""/>
n	t	t	t<enemy name=""parashut"" delay=""206""/>
n	t	t	t<enemy name=""parashut"" delay=""207""/>
n	t	t	t<enemy name=""parashut"" delay=""208""/>
n	t	t</wave>
n	t</group>
n</level>")("<level eye="off" money="41000" maxTower="5" maxUpgrade="5" bg="4" upgradeTwo="true" threeStarHealth="80" twiStarHealth="60" preStartMoney="3000">
	<!-- 
	Пушки
	столбец - 0 лев, 1 центр, 2 прав
	строка -  0 подвал, 1 первый, 2 второй, ...
	индексы апгрейдов 
	1 - upgr2, 
	2 - upgr3_1, 
	3 - upgr4_1, 
	4 - upgr3_2, 
	5 - upgr4_2
	
	значения для глаза(eye)  off, normal, always
	-->
	
	<settings towerLevel="3" towerHealth="100" globalUpgrades="4" maxCannons="10" machinegun="true" heavygun="false" lightning="true" saws="true" score="50000">
	    <!--
		<cannon name="machinegun" upgr="1" col="0" row="2"/>
		<cannon name="heavygun" upgr="0" col="2" row="1"/>
		<cannon name="saw" upgr="0" col="0" row="1"/>
		<cannon name="saw" upgr="0" col="2" row="1"/>
		<cannon name="saw" upgr="0" col="2" row="2"/>
		<cannon name="saw" upgr="0" col="0" row="2"/>
		<cannon name="saw" upgr="0" col="0" row="3"/>
		<cannon name="saw" upgr="0" col="2" row="3"/>
		-->
		<cannon name="lightning" upgr="5" col="2" row="2"/>
		<cannon name="lightning" upgr="5" col="0" row="2"/>
	</settings>
	<group pause="0">
		<wave pause="0" lifeTime="50" side="left" img="1">
			<enemy name="balloon" delay="1"/>
			<enemy name="balloon" delay="5"/>
			<enemy name="balloon" delay="10"/>
			<enemy name="balloon" delay="15"/>
			<enemy name="parashut" delay="5"/>
			<enemy name="parashut" delay="9"/>
			<enemy name="parashut" delay="12"/>
			<enemy name="parashut" delay="15"/>
			<enemy name="parashut" delay="20"/>
			
			<enemy name="walker1" delay="10"/>
			
			<enemy name="unit1-line-4" delay="27"/>
			<enemy name="unit1-line-4" delay="27.5"/>
			<enemy name="unit1-line-4" delay="30"/>
			<enemy name="unit1-line-4" delay="30.5"/>
			<enemy name="unit1-line-4" delay="33"/>
			<enemy name="unit1-line-4" delay="33.5"/>
			<enemy name="unit1-line-4" delay="36"/>
			<enemy name="unit1-line-4" delay="36.5"/>
			<enemy name="unit1-line-4" delay="39"/>
			<enemy name="unit1-line-4" delay="39.5"/>
			
			<enemy name="walker1" delay="40"/>
			<enemy name="balloon" delay="50"/>
			
			<enemy name="parashut" delay="41"/>
			<enemy name="parashut" delay="43"/>
			<enemy name="parashut" delay="45"/>
			<enemy name="parashut" delay="50"/>
			
			<enemy name="unit2" delay="42"/>
			<enemy name="unit2" delay="44"/>
			<enemy name="unit2" delay="46"/>
			<enemy name="unit2" delay="48"/>
			<enemy name="unit2" delay="50"/>
			
			<enemy name="car-line-2" delay="65"/>
			<enemy name="car-line-2" delay="70"/>
			<enemy name="car-line-2" delay="75"/>
			<enemy name="car-line-2" delay="80"/>
			
			<enemy name="unit2" delay="82"/>
			<enemy name="unit2" delay="84"/>
			<enemy name="unit2" delay="86"/>
			<enemy name="unit2" delay="88"/>
			<enemy name="unit2" delay="90"/>
			
			<enemy name="balloon" delay="80"/>
			<enemy name="balloon" delay="84"/>
			<enemy name="balloon" delay="88"/>
			<enemy name="balloon" delay="92"/>
			
			<enemy name="parashut" delay="100"/>
			<enemy name="parashut" delay="105"/>
			<enemy name="parashut" delay="95"/>
			
			<enemy name="unit2" delay="100"/>
			
			<enemy name="walker2" delay="110"/>
			<enemy name="unit2" delay="116"/>
			<enemy name="unit2" delay="118"/>
			<enemy name="unit2" delay="119"/>
			
			<enemy name="heli" delay="140"/>
			<enemy name="heli" delay="144"/>
			<enemy name="heli" delay="148"/>
			<enemy name="heli" delay="152"/>
			<enemy name="heli" delay="156"/>
			
			<enemy name="wheel" delay="140"/>
			<enemy name="wheel" delay="142"/>
			<enemy name="wheel" delay="145"/>
			<enemy name="wheel" delay="147"/>
			<enemy name="wheel" delay="150"/>
			<enemy name="wheel" delay="152"/>
			<enemy name="wheel" delay="155"/>
			<enemy name="wheel" delay="157"/>
			
			<enemy name="unit1-line-4" delay="160"/>
			<enemy name="unit1-line-4" delay="160.5"/>
			<enemy name="unit1-line-4" delay="163"/>
			<enemy name="unit1-line-4" delay="163.5"/>
			<enemy name="unit1-line-4" delay="166"/>
			<enemy name="unit1-line-4" delay="166.5"/>
			<enemy name="unit1-line-4" delay="169"/>
			<enemy name="unit1-line-4" delay="169.5"/>
			
			<enemy name="tanket" delay="170"/>
			<enemy name="tanket" delay="172"/>
			<enemy name="tanket" delay="174"/>
			<enemy name="tanket" delay="176"/>
			<enemy name="tanket" delay="178"/>
			<enemy name="tanket" delay="180"/>
			<enemy name="tanket" delay="182"/>
			<enemy name="tanket" delay="184"/>
			<enemy name="tanket" delay="186"/>
			<enemy name="tanket" delay="188"/>
			<enemy name="tanket" delay="190"/>
			
			<enemy name="balloon" delay="170"/>
			<enemy name="balloon" delay="174"/>
			<enemy name="balloon" delay="178"/>
			<enemy name="balloon" delay="182"/>
			<enemy name="balloon" delay="184"/>
			<enemy name="balloon" delay="186"/>
			
			<enemy name="walker2" delay="190"/>
			<enemy name="parashut" delay="180"/>
			<enemy name="parashut" delay="184"/>
			<enemy name="parashut" delay="188"/>
			<enemy name="parashut" delay="190"/>
			<enemy name="parashut" delay="192"/>
			<enemy name="parashut" delay="194"/>
			<enemy name="parashut" delay="195"/>
			<enemy name="parashut" delay="196"/>
			<enemy name="parashut" delay="197"/>
			<enemy name="parashut" delay="198"/>
			<enemy name="parashut" delay="199"/>
			<enemy name="parashut" delay="200"/>
			<enemy name="parashut" delay="201"/>
			<enemy name="parashut" delay="202"/>
			<enemy name="parashut" delay="203"/>
			<enemy name="parashut" delay="204"/>
			<enemy name="parashut" delay="205"/>
			<enemy name="parashut" delay="206"/>
			<enemy name="parashut" delay="207"/>
			<enemy name="parashut" delay="208"/>
			
		</wave>
		<wave pause="0" lifeTime="50" side="right" img="1">
			<enemy name="balloon" delay="1"/>
			<enemy name="balloon" delay="5"/>
			<enemy name="balloon" delay="10"/>
			<enemy name="balloon" delay="15"/>
			<enemy name="parashut" delay="5"/>
			<enemy name="parashut" delay="9"/>
			<enemy name="parashut" delay="12"/>
			<enemy name="parashut" delay="15"/>
			<enemy name="parashut" delay="20"/>
			
			<enemy name="walker1" delay="10"/>
			
			<enemy name="unit1-line-4" delay="27"/>
			<enemy name="unit1-line-4" delay="27.5"/>
			<enemy name="unit1-line-4" delay="30"/>
			<enemy name="unit1-line-4" delay="30.5"/>
			<enemy name="unit1-line-4" delay="33"/>
			<enemy name="unit1-line-4" delay="33.5"/>
			<enemy name="unit1-line-4" delay="36"/>
			<enemy name="unit1-line-4" delay="36.5"/>
			<enemy name="unit1-line-4" delay="39"/>
			<enemy name="unit1-line-4" delay="39.5"/>
			
			<enemy name="walker1" delay="40"/>
			<enemy name="balloon" delay="50"/>
			
			<enemy name="parashut" delay="41"/>
			<enemy name="parashut" delay="43"/>
			<enemy name="parashut" delay="45"/>
			<enemy name="parashut" delay="50"/>
			
			<enemy name="unit2" delay="42"/>
			<enemy name="unit2" delay="44"/>
			<enemy name="unit2" delay="46"/>
			<enemy name="unit2" delay="48"/>
			<enemy name="unit2" delay="50"/>
			
			<enemy name="walker1" delay="60"/>
			<enemy name="unit2" delay="62"/>
			<enemy name="unit2" delay="64"/>
			<enemy name="walker1" delay="67"/>
			<enemy name="unit2" delay="66"/>
			<enemy name="unit2" delay="69"/>
			
			<enemy name="walker2" delay="80"/>
			<enemy name="unit2" delay="76"/>
			<enemy name="unit2" delay="84"/>
			<enemy name="unit2" delay="86"/>
			
			<enemy name="car-line-2" delay="110"/>
			<enemy name="car-line-2" delay="115"/>
			<enemy name="car-line-2" delay="120"/>
			<enemy name="car-line-2" delay="125"/>
			
			<enemy name="heli" delay="140"/>
			<enemy name="heli" delay="144"/>
			<enemy name="heli" delay="148"/>
			<enemy name="heli" delay="152"/>
			<enemy name="heli" delay="156"/>
			
			<enemy name="tank1-line-2" delay="140"/>
			<enemy name="tank1-line-2" delay="145"/>
			<enemy name="tank1-line-2" delay="150"/>
			<enemy name="tank1-line-2" delay="155"/>
			
			<enemy name="unit1-line-4" delay="160"/>
			<enemy name="unit1-line-4" delay="160.5"/>
			<enemy name="unit1-line-4" delay="163"/>
			<enemy name="unit1-line-4" delay="163.5"/>
			<enemy name="unit1-line-4" delay="166"/>
			<enemy name="unit1-line-4" delay="166.5"/>
			<enemy name="unit1-line-4" delay="169"/>
			<enemy name="unit1-line-4" delay="169.5"/>
			
			<enemy name="tanket" delay="170"/>
			<enemy name="tanket" delay="172"/>
			<enemy name="tanket" delay="174"/>
			<enemy name="tanket" delay="176"/>
			<enemy name="tanket" delay="178"/>
			<enemy name="tanket" delay="180"/>
			<enemy name="tanket" delay="182"/>
			<enemy name="tanket" delay="184"/>
			<enemy name="tanket" delay="186"/>
			<enemy name="tanket" delay="188"/>
			<enemy name="tanket" delay="190"/>
			
			<enemy name="balloon" delay="170"/>
			<enemy name="balloon" delay="174"/>
			<enemy name="balloon" delay="178"/>
			<enemy name="balloon" delay="182"/>
			<enemy name="balloon" delay="184"/>
			<enemy name="balloon" delay="186"/>
			
			<enemy name="walker2" delay="190"/>
			<enemy name="parashut" delay="180"/>
			<enemy name="parashut" delay="184"/>
			<enemy name="parashut" delay="188"/>
			<enemy name="parashut" delay="190"/>
			<enemy name="parashut" delay="192"/>
			<enemy name="parashut" delay="194"/>
			<enemy name="parashut" delay="195"/>
			<enemy name="parashut" delay="196"/>
			<enemy name="parashut" delay="197"/>
			<enemy name="parashut" delay="198"/>
			<enemy name="parashut" delay="199"/>
			<enemy name="parashut" delay="200"/>
			<enemy name="parashut" delay="201"/>
			<enemy name="parashut" delay="202"/>
			<enemy name="parashut" delay="203"/>
			<enemy name="parashut" delay="204"/>
			<enemy name="parashut" delay="205"/>
			<enemy name="parashut" delay="206"/>
			<enemy name="parashut" delay="207"/>
			<enemy name="parashut" delay="208"/>
		</wave>
	</group>
</level>;
            var _loc_28:* = <level eye=""normal"" money=""40000"" maxTower=""1"" maxUpgrade=""5"" bg=""4"" upgradeTwo=""true"" threeStarHealth=""80"" twiStarHealth=""60"" preStartMoney=""3000"">
n	t<!-- 
n	tПушки
n	tстолбец - 0 лев, 1 центр, 2 прав
n	tстрока -  0 подвал, 1 первый, 2 второй, ...
n	tиндексы апгрейдов 
n	t1 - upgr2, 
n	t2 - upgr3_1, 
n	t3 - upgr4_1, 
n	t4 - upgr3_2, 
n	t5 - upgr4_2
n	t
n	tзначения для глаза(eye)  off, normal, always
n	t-->
n	t
n	t<settings towerLevel=""1"" towerHealth=""30"" globalUpgrades=""4"" maxCannons=""2"" machinegun=""true"" heavygun=""true"" lightning=""true"" saws=""true"" score=""52000"">
n	t    <!--
n	t	t<cannon name=""lightning"" upgr=""5"" col=""2"" row=""2""/>
n	t	t<cannon name=""lightning"" upgr=""5"" col=""0"" row=""2""/>
n	t	t-->
n	t	t<cannon name=""saw"" upgr=""3"" col=""2"" row=""1""/>
n	t	t<cannon name=""lightning"" upgr=""3"" col=""0"" row=""1""/>
n	t</settings>
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""50"" side=""left"" img=""1"">
n	t	t	t<enemy name=""car"" delay=""5""/>
n	t	t	t<enemy name=""tanket"" delay=""4""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""10""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""11""/>
n	t	t	t<enemy name=""car"" delay=""15""/>
n	t	t	t<enemy name=""tanket"" delay=""14""/>
n	t	t	t
n	t	t	t<enemy name=""unit2-line-3"" delay=""20""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""21""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""22""/>
n	t	t	t
n	t	t	t<enemy name=""wheel"" delay=""27""/>
n	t	t	t<enemy name=""wheel"" delay=""28""/>
n	t	t	t<enemy name=""wheel"" delay=""29""/>
n	t	t	t<enemy name=""wheel"" delay=""30""/>
n	t	t	t
n	t	t	t<enemy name=""walker1"" delay=""34""/>
n	t	t	t<enemy name=""unit1"" delay=""41""/>
n	t	t	t<enemy name=""unit1"" delay=""41.5""/>
n	t	t	t<enemy name=""unit1"" delay=""42""/>
n	t	t	t<enemy name=""unit1"" delay=""42.5""/>
n	t	t	t
n	t	t	t<enemy name=""unit1"" delay=""48""/>
n	t	t	t<enemy name=""unit1"" delay=""48.5""/>
n	t	t	t<enemy name=""unit1"" delay=""49""/>
n	t	t	t<enemy name=""unit1"" delay=""49.5""/>
n	t	t	t
n	t	t	t<enemy name=""parashut"" delay=""60""/>
n	t	t	t<enemy name=""parashut"" delay=""61""/>
n	t	t	t<enemy name=""parashut"" delay=""62""/>
n	t	t	t<enemy name=""parashut"" delay=""63""/>
n	t	t	t<enemy name=""parashut"" delay=""64""/>
n	t	t	t<enemy name=""parashut"" delay=""65""/>
n	t	t	t<enemy name=""parashut"" delay=""66""/>
n	t	t	t<enemy name=""parashut"" delay=""67""/>
n	t	t	t<enemy name=""parashut"" delay=""68""/>
n	t	t	t<enemy name=""parashut"" delay=""69""/>
n	t	t	t<enemy name=""parashut"" delay=""70""/>
n	t	t	t<enemy name=""parashut"" delay=""70.5""/>
n	t	t	t<enemy name=""parashut"" delay=""71""/>
n	t	t	t<enemy name=""parashut"" delay=""71.5""/>
n	t	t	t<enemy name=""parashut"" delay=""72""/>
n	t	t	t<enemy name=""parashut"" delay=""72.5""/>
n	t	t	t<enemy name=""parashut"" delay=""73""/>
n	t	t	t<enemy name=""parashut"" delay=""73.5""/>
n	t	t	t
n	t	t	t<enemy name=""tanket"" delay=""80""/>
n	t	t	t<enemy name=""tank1"" delay=""85""/>
n	t	t	t<enemy name=""tanket"" delay=""90""/>
n	t	t	t
n	t	t	t<enemy name=""walker1"" delay=""100""/>
n	t	t	t<enemy name=""walker1"" delay=""105""/>
n	t	t	t
n	t	t	t<enemy name=""unit1-line-4"" delay=""105""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""106""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""107""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""108""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""109""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""100""/>
n
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""50"" side=""right"" img=""1"">
n	t	t	t<enemy name=""unit1-line-4"" delay=""5""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""4""/>
n	t	t	t<enemy name=""car"" delay=""10""/>
n	t	t	t<enemy name=""tanket"" delay=""11""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""15""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""14""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""15""/>
n	t	t	t
n	t	t	t<enemy name=""tank1"" delay=""20""/>
n	t	t	t
n	t	t	t<enemy name=""wheel"" delay=""27""/>
n	t	t	t<enemy name=""wheel"" delay=""28""/>
n	t	t	t<enemy name=""wheel"" delay=""29""/>
n	t	t	t<enemy name=""wheel"" delay=""30""/>
n	t	t	t<enemy name=""wheel"" delay=""31""/>
n	t	t	t
n	t	t	t<enemy name=""tank3"" delay=""50""/>
n	t	t	t
n	t	t	t<enemy name=""parashut"" delay=""60""/>
n	t	t	t<enemy name=""parashut"" delay=""61""/>
n	t	t	t<enemy name=""parashut"" delay=""62""/>
n	t	t	t<enemy name=""parashut"" delay=""63""/>
n	t	t	t<enemy name=""parashut"" delay=""64""/>
n	t	t	t<enemy name=""parashut"" delay=""65""/>
n	t	t	t<enemy name=""parashut"" delay=""66""/>
n	t	t	t<enemy name=""parashut"" delay=""67""/>
n	t	t	t<enemy name=""parashut"" delay=""68""/>
n	t	t	t<enemy name=""parashut"" delay=""69""/>
n	t	t	t<enemy name=""parashut"" delay=""70""/>
n	t	t	t<enemy name=""parashut"" delay=""70.5""/>
n	t	t	t<enemy name=""parashut"" delay=""71""/>
n	t	t	t<enemy name=""parashut"" delay=""71.5""/>
n	t	t	t<enemy name=""parashut"" delay=""72""/>
n	t	t	t<enemy name=""parashut"" delay=""72.5""/>
n	t	t	t<enemy name=""parashut"" delay=""73""/>
n	t	t	t<enemy name=""parashut"" delay=""73.5""/>
n	t	t	t
n	t	t	t<enemy name=""tank1"" delay=""80""/>
n	t	t	t<enemy name=""tanket"" delay=""85""/>
n	t	t	t<enemy name=""tank1"" delay=""90""/>
n	t	t	t
n	t	t	t<enemy name=""walker1"" delay=""100""/>
n	t	t	t<enemy name=""walker1"" delay=""105""/>
n	t	t	t
n	t	t	t<enemy name=""unit2"" delay=""105""/>
n	t	t	t<enemy name=""unit2"" delay=""106""/>
n	t	t	t<enemy name=""unit2"" delay=""107""/>
n	t	t	t<enemy name=""unit2"" delay=""108""/>
n	t	t	t<enemy name=""unit2"" delay=""109""/>
n	t	t	t<enemy name=""unit2"" delay=""100""/>
n	t	t</wave>
n	t</group>
n</level>")("<level eye="normal" money="40000" maxTower="1" maxUpgrade="5" bg="4" upgradeTwo="true" threeStarHealth="80" twiStarHealth="60" preStartMoney="3000">
	<!-- 
	Пушки
	столбец - 0 лев, 1 центр, 2 прав
	строка -  0 подвал, 1 первый, 2 второй, ...
	индексы апгрейдов 
	1 - upgr2, 
	2 - upgr3_1, 
	3 - upgr4_1, 
	4 - upgr3_2, 
	5 - upgr4_2
	
	значения для глаза(eye)  off, normal, always
	-->
	
	<settings towerLevel="1" towerHealth="30" globalUpgrades="4" maxCannons="2" machinegun="true" heavygun="true" lightning="true" saws="true" score="52000">
	    <!--
		<cannon name="lightning" upgr="5" col="2" row="2"/>
		<cannon name="lightning" upgr="5" col="0" row="2"/>
		-->
		<cannon name="saw" upgr="3" col="2" row="1"/>
		<cannon name="lightning" upgr="3" col="0" row="1"/>
	</settings>
	<group pause="0">
		<wave pause="0" lifeTime="50" side="left" img="1">
			<enemy name="car" delay="5"/>
			<enemy name="tanket" delay="4"/>
			<enemy name="unit1-line-4" delay="10"/>
			<enemy name="unit1-line-4" delay="11"/>
			<enemy name="car" delay="15"/>
			<enemy name="tanket" delay="14"/>
			
			<enemy name="unit2-line-3" delay="20"/>
			<enemy name="unit2-line-3" delay="21"/>
			<enemy name="unit2-line-3" delay="22"/>
			
			<enemy name="wheel" delay="27"/>
			<enemy name="wheel" delay="28"/>
			<enemy name="wheel" delay="29"/>
			<enemy name="wheel" delay="30"/>
			
			<enemy name="walker1" delay="34"/>
			<enemy name="unit1" delay="41"/>
			<enemy name="unit1" delay="41.5"/>
			<enemy name="unit1" delay="42"/>
			<enemy name="unit1" delay="42.5"/>
			
			<enemy name="unit1" delay="48"/>
			<enemy name="unit1" delay="48.5"/>
			<enemy name="unit1" delay="49"/>
			<enemy name="unit1" delay="49.5"/>
			
			<enemy name="parashut" delay="60"/>
			<enemy name="parashut" delay="61"/>
			<enemy name="parashut" delay="62"/>
			<enemy name="parashut" delay="63"/>
			<enemy name="parashut" delay="64"/>
			<enemy name="parashut" delay="65"/>
			<enemy name="parashut" delay="66"/>
			<enemy name="parashut" delay="67"/>
			<enemy name="parashut" delay="68"/>
			<enemy name="parashut" delay="69"/>
			<enemy name="parashut" delay="70"/>
			<enemy name="parashut" delay="70.5"/>
			<enemy name="parashut" delay="71"/>
			<enemy name="parashut" delay="71.5"/>
			<enemy name="parashut" delay="72"/>
			<enemy name="parashut" delay="72.5"/>
			<enemy name="parashut" delay="73"/>
			<enemy name="parashut" delay="73.5"/>
			
			<enemy name="tanket" delay="80"/>
			<enemy name="tank1" delay="85"/>
			<enemy name="tanket" delay="90"/>
			
			<enemy name="walker1" delay="100"/>
			<enemy name="walker1" delay="105"/>
			
			<enemy name="unit1-line-4" delay="105"/>
			<enemy name="unit1-line-4" delay="106"/>
			<enemy name="unit1-line-4" delay="107"/>
			<enemy name="unit1-line-4" delay="108"/>
			<enemy name="unit1-line-4" delay="109"/>
			<enemy name="unit1-line-4" delay="100"/>

		</wave>
		<wave pause="0" lifeTime="50" side="right" img="1">
			<enemy name="unit1-line-4" delay="5"/>
			<enemy name="unit1-line-4" delay="4"/>
			<enemy name="car" delay="10"/>
			<enemy name="tanket" delay="11"/>
			<enemy name="unit1-line-4" delay="15"/>
			<enemy name="unit1-line-4" delay="14"/>
			<enemy name="unit1-line-4" delay="15"/>
			
			<enemy name="tank1" delay="20"/>
			
			<enemy name="wheel" delay="27"/>
			<enemy name="wheel" delay="28"/>
			<enemy name="wheel" delay="29"/>
			<enemy name="wheel" delay="30"/>
			<enemy name="wheel" delay="31"/>
			
			<enemy name="tank3" delay="50"/>
			
			<enemy name="parashut" delay="60"/>
			<enemy name="parashut" delay="61"/>
			<enemy name="parashut" delay="62"/>
			<enemy name="parashut" delay="63"/>
			<enemy name="parashut" delay="64"/>
			<enemy name="parashut" delay="65"/>
			<enemy name="parashut" delay="66"/>
			<enemy name="parashut" delay="67"/>
			<enemy name="parashut" delay="68"/>
			<enemy name="parashut" delay="69"/>
			<enemy name="parashut" delay="70"/>
			<enemy name="parashut" delay="70.5"/>
			<enemy name="parashut" delay="71"/>
			<enemy name="parashut" delay="71.5"/>
			<enemy name="parashut" delay="72"/>
			<enemy name="parashut" delay="72.5"/>
			<enemy name="parashut" delay="73"/>
			<enemy name="parashut" delay="73.5"/>
			
			<enemy name="tank1" delay="80"/>
			<enemy name="tanket" delay="85"/>
			<enemy name="tank1" delay="90"/>
			
			<enemy name="walker1" delay="100"/>
			<enemy name="walker1" delay="105"/>
			
			<enemy name="unit2" delay="105"/>
			<enemy name="unit2" delay="106"/>
			<enemy name="unit2" delay="107"/>
			<enemy name="unit2" delay="108"/>
			<enemy name="unit2" delay="109"/>
			<enemy name="unit2" delay="100"/>
		</wave>
	</group>
</level>;
            var _loc_29:* = <level eye=""normal"" money=""49000"" maxTower=""5"" maxUpgrade=""5"" bg=""5"" upgradeTwo=""true"" threeStarHealth=""80"" twiStarHealth=""60"" preStartMoney=""3000"">
n	t<!-- 
n	tПушки
n	tстолбец - 0 лев, 1 центр, 2 прав
n	tстрока -  0 подвал, 1 первый, 2 второй, ...
n	tиндексы апгрейдов 
n	t1 - upgr2, 
n	t2 - upgr3_1, 
n	t3 - upgr4_1, 
n	t4 - upgr3_2, 
n	t5 - upgr4_2
n	t
n	tзначения для глаза(eye)  off, normal, always
n	t-->
n	t
n	t<settings towerLevel=""5"" towerHealth=""50"" globalUpgrades=""4"" maxCannons=""10"" machinegun=""false"" heavygun=""false"" lightning=""true"" saws=""false"" score=""54000"">
n	t    <!--
n	t	t<cannon name=""lightning"" upgr=""5"" col=""2"" row=""2""/>
n	t	t<cannon name=""lightning"" upgr=""5"" col=""0"" row=""2""/>
n	t	t-->
n	t	t<cannon name=""heavygun"" upgr=""3"" col=""2"" row=""1""/>
n	t</settings>
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""20"" side=""left"" img=""1"">
n	t	t    <enemy name=""balloon"" delay=""1""/>
n	t	t	t<enemy name=""balloon"" delay=""5""/>
n	t	t	t<enemy name=""balloon"" delay=""10""/>
n	t	t	t<enemy name=""balloon"" delay=""15""/>
n	t	t	t<enemy name=""balloon"" delay=""20""/>
n	t	t	t<enemy name=""parashut"" delay=""1""/>
n	t	t	t<enemy name=""parashut"" delay=""3""/>
n	t	t	t<enemy name=""parashut"" delay=""5""/>
n	t	t	t<enemy name=""parashut"" delay=""7""/>
n	t	t	t<enemy name=""parashut"" delay=""9""/>
n	t	t	t<enemy name=""parashut"" delay=""11""/>
n	t	t	t<enemy name=""parashut"" delay=""13""/>
n	t	t	t<enemy name=""parashut"" delay=""15""/>
n	t	t	t<enemy name=""parashut"" delay=""16""/>
n	t	t	t<enemy name=""parashut"" delay=""17""/>
n	t	t	t<enemy name=""parashut"" delay=""18""/>
n	t	t	t<enemy name=""parashut"" delay=""19""/>
n	t	t	t<enemy name=""parashut"" delay=""20""/>
n	t	t	t
n	t	t	t<enemy name=""tank1"" delay=""5""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""20"" side=""right"" img=""1"">
n	t	t    <enemy name=""balloon"" delay=""1""/>
n	t	t	t<enemy name=""balloon"" delay=""5""/>
n	t	t	t<enemy name=""balloon"" delay=""10""/>
n	t	t	t<enemy name=""balloon"" delay=""15""/>
n	t	t	t<enemy name=""balloon"" delay=""20""/>
n            <enemy name=""parashut"" delay=""1""/>
n	t	t	t<enemy name=""parashut"" delay=""3""/>
n	t	t	t<enemy name=""parashut"" delay=""5""/>
n	t	t	t<enemy name=""parashut"" delay=""7""/>
n	t	t	t<enemy name=""parashut"" delay=""9""/>
n	t	t	t<enemy name=""parashut"" delay=""11""/>
n	t	t	t<enemy name=""parashut"" delay=""13""/>
n	t	t	t<enemy name=""parashut"" delay=""15""/>
n	t	t	t<enemy name=""parashut"" delay=""16""/>
n	t	t	t<enemy name=""parashut"" delay=""17""/>
n	t	t	t<enemy name=""parashut"" delay=""18""/>
n	t	t	t<enemy name=""parashut"" delay=""19""/>
n	t	t	t<enemy name=""parashut"" delay=""20""/>
n	t	t	t
n	t	t	t<enemy name=""tank1"" delay=""15""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""2"">
n	t	t<wave pause=""0"" lifeTime=""20"" side=""left"" img=""1"">
n	t	t    <enemy name=""unit2-line-3"" delay=""1""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""2""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""3""/>
n	t	t	t<enemy name=""tank1"" delay=""3""/>
n	t	t	t<enemy name=""tank1"" delay=""13""/>
n	t	t	t
n	t	t	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""12""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit1"" delay=""17""/>
n
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""20"" side=""right"" img=""1"">
n	t	t    <enemy name=""unit2-line-3"" delay=""1""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""2""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""3""/>
n	t	t	t<enemy name=""tank1"" delay=""7""/>
n	t	t	t<enemy name=""tank1"" delay=""17""/>
n	t	t	t
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""12""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit1"" delay=""17""/>
n	t	t	t<enemy name=""unit1"" delay=""18""/>
n	t	t	t<enemy name=""unit1"" delay=""19""/>
n	t	t	t<enemy name=""unit1"" delay=""20""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""2"">
n	t	t<wave pause=""0"" lifeTime=""30"" side=""left"" img=""1"">
n	t	t	t<enemy name=""tank1"" delay=""1""/>
n	t	t	t<enemy name=""aerostat"" delay=""0""/>
n	t	t	t<enemy name=""aerostat"" delay=""5""/>
n	t	t	t<enemy name=""aerostat"" delay=""10""/>
n	t	t	t<enemy name=""aerostat"" delay=""15""/>
n	t	t	t<enemy name=""aerostat"" delay=""20""/>
n	t	t	t<enemy name=""aerostat"" delay=""25""/>
n	t	t	t
n	t	t	t<enemy name=""parashut"" delay=""1""/>
n	t	t	t<enemy name=""parashut"" delay=""3""/>
n	t	t	t<enemy name=""parashut"" delay=""5""/>
n	t	t	t<enemy name=""parashut"" delay=""7""/>
n	t	t	t<enemy name=""parashut"" delay=""9""/>
n	t	t	t<enemy name=""parashut"" delay=""11""/>
n	t	t	t<enemy name=""parashut"" delay=""12""/>
n	t	t	t<enemy name=""parashut"" delay=""13""/>
n	t	t	t<enemy name=""parashut"" delay=""14""/>
n	t	t	t<enemy name=""parashut"" delay=""15""/>
n	t	t	t<enemy name=""parashut"" delay=""16""/>
n	t	t	t<enemy name=""parashut"" delay=""17""/>
n	t	t	t<enemy name=""parashut"" delay=""18""/>
n	t	t	t<enemy name=""parashut"" delay=""19""/>
n	t	t	t<enemy name=""parashut"" delay=""20""/>
n	t	t	t
n	t	t	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""12""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit1"" delay=""17""/>
n	t	t	t
n	t	t	t<enemy name=""car"" delay=""8""/>
n	t	t	t<enemy name=""car"" delay=""13""/>
n	t	t	t<enemy name=""car"" delay=""17""/>
n	t	t	t
n	t	t	t<enemy name=""tank1"" delay=""20""/>
n	t	t	t<enemy name=""tank1"" delay=""23""/>
n	t	t	t<enemy name=""tank2"" delay=""25""/>
n	t	t	t<enemy name=""tank2"" delay=""28""/>
n	t	t	t<enemy name=""tank3"" delay=""33""/>
n
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""30"" side=""right"" img=""1"">
n	t	t	t<enemy name=""tank1"" delay=""1""/>
n	t	t	t<enemy name=""aerostat"" delay=""0""/>
n	t	t	t<enemy name=""aerostat"" delay=""5""/>
n	t	t	t<enemy name=""aerostat"" delay=""10""/>
n	t	t	t<enemy name=""aerostat"" delay=""15""/>
n	t	t	t<enemy name=""aerostat"" delay=""20""/>
n	t	t	t<enemy name=""aerostat"" delay=""25""/>
n	t	t	t
n	t	t	t<enemy name=""parashut"" delay=""1""/>
n	t	t	t<enemy name=""parashut"" delay=""3""/>
n	t	t	t<enemy name=""parashut"" delay=""5""/>
n	t	t	t<enemy name=""parashut"" delay=""7""/>
n	t	t	t<enemy name=""parashut"" delay=""9""/>
n	t	t	t<enemy name=""parashut"" delay=""11""/>
n	t	t	t<enemy name=""parashut"" delay=""12""/>
n	t	t	t<enemy name=""parashut"" delay=""13""/>
n	t	t	t<enemy name=""parashut"" delay=""14""/>
n	t	t	t<enemy name=""parashut"" delay=""15""/>
n	t	t	t<enemy name=""parashut"" delay=""16""/>
n	t	t	t<enemy name=""parashut"" delay=""17""/>
n	t	t	t<enemy name=""parashut"" delay=""18""/>
n	t	t	t<enemy name=""parashut"" delay=""19""/>
n	t	t	t<enemy name=""parashut"" delay=""20""/>
n	t	t	t
n	t	t	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""12""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit1"" delay=""17""/>
n	t	t	t
n	t	t	t<enemy name=""car"" delay=""9""/>
n	t	t	t<enemy name=""car"" delay=""12""/>
n	t	t	t<enemy name=""car"" delay=""16""/>
n	t	t	t
n	t	t	t<enemy name=""tank1"" delay=""20""/>
n	t	t	t<enemy name=""tank1"" delay=""23""/>
n	t	t	t<enemy name=""tank2"" delay=""25""/>
n	t	t	t<enemy name=""tank2"" delay=""28""/>
n	t	t	t<enemy name=""tank3"" delay=""33""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""5"">
n	t	t<wave pause=""0"" lifeTime=""20"" side=""right"" img=""1"">
n	t	t	t<enemy name=""walker1"" delay=""1""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""7""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""8""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""9""/>
n	t	t	t<enemy name=""unit2-line-3"" delay=""10""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""2"">
n	t	t<wave pause=""0"" lifeTime=""20"" side=""left"" img=""1"">
n	t	t    <enemy name=""walker1"" delay=""1""/>
n	t	t    <enemy name=""walker1"" delay=""10""/>
n	t	t	t<enemy name=""balloon"" delay=""1""/>
n	t	t	t<enemy name=""balloon"" delay=""5""/>
n	t	t	t<enemy name=""balloon"" delay=""10""/>
n	t	t	t<enemy name=""balloon"" delay=""15""/>
n	t	t	t<enemy name=""balloon"" delay=""20""/>
n	t	t	t
n	t	t	t<enemy name=""parashut"" delay=""1""/>
n	t	t	t<enemy name=""parashut"" delay=""3""/>
n	t	t	t<enemy name=""parashut"" delay=""5""/>
n	t	t	t<enemy name=""parashut"" delay=""7""/>
n	t	t	t<enemy name=""parashut"" delay=""9""/>
n	t	t	t<enemy name=""parashut"" delay=""11""/>
n	t	t	t<enemy name=""parashut"" delay=""13""/>
n	t	t	t<enemy name=""parashut"" delay=""15""/>
n	t	t	t<enemy name=""parashut"" delay=""16""/>
n	t	t	t<enemy name=""parashut"" delay=""17""/>
n	t	t	t<enemy name=""parashut"" delay=""18""/>
n	t	t	t<enemy name=""parashut"" delay=""19""/>
n	t	t	t<enemy name=""parashut"" delay=""20""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""20"" side=""right"" img=""1"">
n	t	t	t<enemy name=""walker1"" delay=""1""/>
n	t	t	t<enemy name=""walker1"" delay=""10""/>
n	t	t	t<enemy name=""balloon"" delay=""1""/>
n	t	t	t<enemy name=""balloon"" delay=""5""/>
n	t	t	t<enemy name=""balloon"" delay=""10""/>
n	t	t	t<enemy name=""balloon"" delay=""15""/>
n	t	t	t<enemy name=""balloon"" delay=""20""/>
n	t	t	t
n	t	t	t<enemy name=""parashut"" delay=""1""/>
n	t	t	t<enemy name=""parashut"" delay=""3""/>
n	t	t	t<enemy name=""parashut"" delay=""5""/>
n	t	t	t<enemy name=""parashut"" delay=""7""/>
n	t	t	t<enemy name=""parashut"" delay=""9""/>
n	t	t	t<enemy name=""parashut"" delay=""11""/>
n	t	t	t<enemy name=""parashut"" delay=""13""/>
n	t	t	t<enemy name=""parashut"" delay=""15""/>
n	t	t	t<enemy name=""parashut"" delay=""16""/>
n	t	t	t<enemy name=""parashut"" delay=""17""/>
n	t	t	t<enemy name=""parashut"" delay=""18""/>
n	t	t	t<enemy name=""parashut"" delay=""19""/>
n	t	t	t<enemy name=""parashut"" delay=""20""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""3"">
n	t	t<wave pause=""0"" lifeTime=""20"" side=""left"" img=""1"">
n	t	t	t<enemy name=""walker2"" delay=""1""/>
n	t	t	t
n	t	t	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""12""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit1"" delay=""17""/>
n
n	t	t</wave>
n	t</group>
n	t<group pause=""8"">
n	t	t<wave pause=""0"" lifeTime=""20"" side=""left"" img=""1"">
n	t	t    <enemy name=""tank3"" delay=""1""/>
n	t	t	t<enemy name=""heli"" delay=""1""/>
n	t	t	t<enemy name=""heli"" delay=""5""/>
n	t	t	t<enemy name=""heli"" delay=""10""/>
n	t	t	t<enemy name=""heli"" delay=""15""/>
n	t	t	t<enemy name=""heli"" delay=""20""/>
n	t	t	t
n	t	t	t<enemy name=""airplane"" delay=""1""/>
n	t	t	t<enemy name=""airplane"" delay=""5""/>
n	t	t	t<enemy name=""airplane"" delay=""10""/>
n	t	t	t<enemy name=""airplane"" delay=""15""/>
n	t	t	t<enemy name=""airplane"" delay=""20""/>
n	t	t	t
n	t	t	t<enemy name=""parashut"" delay=""1""/>
n	t	t	t<enemy name=""parashut"" delay=""3""/>
n	t	t	t<enemy name=""parashut"" delay=""5""/>
n	t	t	t<enemy name=""parashut"" delay=""7""/>
n	t	t	t<enemy name=""parashut"" delay=""9""/>
n	t	t	t<enemy name=""parashut"" delay=""11""/>
n	t	t	t<enemy name=""parashut"" delay=""13""/>
n	t	t	t<enemy name=""parashut"" delay=""15""/>
n	t	t	t<enemy name=""parashut"" delay=""16""/>
n	t	t	t<enemy name=""parashut"" delay=""17""/>
n	t	t	t<enemy name=""parashut"" delay=""18""/>
n	t	t	t<enemy name=""parashut"" delay=""19""/>
n	t	t	t<enemy name=""parashut"" delay=""20""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""20"" side=""right"" img=""1"">
n	t	t	t<enemy name=""tank3"" delay=""1""/>
n	t	t	t<enemy name=""heli"" delay=""1""/>
n	t	t	t<enemy name=""heli"" delay=""5""/>
n	t	t	t<enemy name=""heli"" delay=""10""/>
n	t	t	t<enemy name=""heli"" delay=""15""/>
n	t	t	t<enemy name=""heli"" delay=""20""/>
n	t	t	t
n	t	t	t<enemy name=""airplane"" delay=""1""/>
n	t	t	t<enemy name=""airplane"" delay=""4""/>
n	t	t	t<enemy name=""airplane"" delay=""9""/>
n	t	t	t<enemy name=""airplane"" delay=""14""/>
n	t	t	t<enemy name=""airplane"" delay=""19""/>
n	t	t	t
n	t	t	t<enemy name=""parashut"" delay=""1""/>
n	t	t	t<enemy name=""parashut"" delay=""3""/>
n	t	t	t<enemy name=""parashut"" delay=""5""/>
n	t	t	t<enemy name=""parashut"" delay=""7""/>
n	t	t	t<enemy name=""parashut"" delay=""9""/>
n	t	t	t<enemy name=""parashut"" delay=""11""/>
n	t	t	t<enemy name=""parashut"" delay=""13""/>
n	t	t	t<enemy name=""parashut"" delay=""15""/>
n	t	t	t<enemy name=""parashut"" delay=""16""/>
n	t	t	t<enemy name=""parashut"" delay=""17""/>
n	t	t	t<enemy name=""parashut"" delay=""18""/>
n	t	t	t<enemy name=""parashut"" delay=""19""/>
n	t	t	t<enemy name=""parashut"" delay=""20""/>
n	t	t</wave>
n	t</group>
n	t
n	t<group pause=""8"">
n	t	t<wave pause=""0"" lifeTime=""65"" side=""left"" img=""1"">
n	t	t    <enemy name=""airplane"" delay=""1""/>
n	t	t	t<enemy name=""airplane"" delay=""2""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""0""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""0.5""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""3""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""3.5""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""6""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""6.5""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""9""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""9.5""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""12""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""12.5""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""15""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""15.5""/>
n	t	t	t
n	t	t	t<enemy name=""heli"" delay=""1""/>
n	t	t	t<enemy name=""heli"" delay=""4""/>
n	t	t	t<enemy name=""heli"" delay=""8""/>
n	t	t	t<enemy name=""heli"" delay=""12""/>
n	t	t	t<enemy name=""heli"" delay=""16""/>
n	t	t	t<enemy name=""heli"" delay=""20""/>
n	t	t	t<enemy name=""heli"" delay=""24""/>
n	t	t	t<enemy name=""heli"" delay=""28""/>
n	t	t	t<enemy name=""heli"" delay=""32""/>
n	t	t	t
n	t	t	t<enemy name=""unit2"" delay=""20""/>
n	t	t	t<enemy name=""unit2"" delay=""21""/>
n	t	t	t<enemy name=""tanket"" delay=""22""/>
n	t	t	t<enemy name=""unit2"" delay=""23""/>
n	t	t	t<enemy name=""unit2"" delay=""24""/>
n	t	t	t<enemy name=""tanket"" delay=""25""/>
n	t	t	t<enemy name=""unit2"" delay=""26""/>
n	t	t	t<enemy name=""unit2"" delay=""27""/>
n	t	t	t
n	t	t	t<enemy name=""airplane"" delay=""30""/>
n	t	t	t<enemy name=""airplane"" delay=""31""/>
n	t	t	t<enemy name=""airplane"" delay=""32""/>
n	t	t	t
n	t	t	t<enemy name=""wheel"" delay=""30""/>
n	t	t	t<enemy name=""wheel"" delay=""31""/>
n	t	t	t<enemy name=""wheel"" delay=""32""/>
n	t	t	t<enemy name=""wheel"" delay=""33""/>
n	t	t	t
n	t	t	t<enemy name=""walker2"" delay=""35""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""65"" side=""right"" img=""1"">
n	t	t    <enemy name=""airplane"" delay=""1""/>
n	t	t	t<enemy name=""airplane"" delay=""2""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""0""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""0.5""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""3""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""3.5""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""6""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""6.5""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""9""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""9.5""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""12""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""12.5""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""15""/>
n	t	t	t<enemy name=""unit1-line-4"" delay=""15.5""/>
n	t	t	t
n	t	t	t<enemy name=""heli"" delay=""1""/>
n	t	t	t<enemy name=""heli"" delay=""4""/>
n	t	t	t<enemy name=""heli"" delay=""8""/>
n	t	t	t<enemy name=""heli"" delay=""12""/>
n	t	t	t<enemy name=""heli"" delay=""16""/>
n	t	t	t<enemy name=""heli"" delay=""20""/>
n	t	t	t<enemy name=""heli"" delay=""24""/>
n	t	t	t<enemy name=""heli"" delay=""28""/>
n	t	t	t<enemy name=""heli"" delay=""32""/>
n	t	t	t
n	t	t	t<enemy name=""unit2"" delay=""20""/>
n	t	t	t<enemy name=""unit2"" delay=""21""/>
n	t	t	t<enemy name=""tanket"" delay=""22""/>
n	t	t	t<enemy name=""unit2"" delay=""23""/>
n	t	t	t<enemy name=""unit2"" delay=""24""/>
n	t	t	t<enemy name=""tanket"" delay=""25""/>
n	t	t	t<enemy name=""unit2"" delay=""26""/>
n	t	t	t<enemy name=""unit2"" delay=""27""/>
n	t	t	t
n	t	t	t<enemy name=""airplane"" delay=""30""/>
n	t	t	t<enemy name=""airplane"" delay=""31""/>
n	t	t	t<enemy name=""airplane"" delay=""32""/>
n	t	t	t
n	t	t	t<enemy name=""wheel"" delay=""30""/>
n	t	t	t<enemy name=""wheel"" delay=""31""/>
n	t	t	t<enemy name=""wheel"" delay=""32""/>
n	t	t	t<enemy name=""wheel"" delay=""33""/>
n	t	t	t<enemy name=""wheel"" delay=""34""/>
n	t	t	t<enemy name=""wheel"" delay=""35""/>
n	t	t	t<enemy name=""wheel"" delay=""36""/>
n	t	t	t
n	t	t	t<enemy name=""walker2"" delay=""43""/>
n	t	t</wave>
n	t</group>
n	t<group pause=""10"">
n	t	t<wave pause=""0"" lifeTime=""200"" side=""left"" img=""1"">
n	t	t    <enemy name=""unit1-line-2"" delay=""1""/>
n	t	t	t<enemy name=""unit1-line-2"" delay=""2""/>
n	t	t	t<enemy name=""unit1-line-2"" delay=""3""/>
n	t	t	t<enemy name=""unit1-line-2"" delay=""4""/>
n	t	t	t<enemy name=""unit1-line-2"" delay=""5""/>
n	t	t	t<enemy name=""unit1-line-2"" delay=""6""/>
n	t	t	t<enemy name=""unit1-line-2"" delay=""7""/>
n	t	t	t<enemy name=""unit1-line-2"" delay=""8""/>
n	t	t	t<enemy name=""unit1-line-2"" delay=""9""/>
n	t	t	t<enemy name=""unit1-line-2"" delay=""10""/>
n	t	t	t
n	t	t	t<enemy name=""parashut"" delay=""8""/>
n	t	t	t<enemy name=""parashut"" delay=""9""/>
n	t	t	t<enemy name=""parashut"" delay=""10""/>
n	t	t	t<enemy name=""parashut"" delay=""11""/>
n	t	t	t<enemy name=""parashut"" delay=""12""/>
n	t	t	t<enemy name=""parashut"" delay=""13""/>
n	t	t	t<enemy name=""parashut"" delay=""14""/>
n	t	t	t<enemy name=""parashut"" delay=""15""/>
n	t	t	t
n	t	t	t<enemy name=""walker1"" delay=""10""/>
n	t	t	t
n	t	t	t<enemy name=""tank2"" delay=""16""/>
n	t	t	t
n	t	t	t<enemy name=""heli"" delay=""15""/>
n	t	t	t<enemy name=""heli"" delay=""20""/>
n	t	t	t<enemy name=""heli"" delay=""25""/>
n	t	t	t<enemy name=""heli"" delay=""30""/>
n	t	t	t
n	t	t	t<enemy name=""car"" delay=""20""/>
n	t	t	t<enemy name=""car"" delay=""21""/>
n	t	t	t<enemy name=""tanket"" delay=""22""/>
n	t	t	t<enemy name=""car"" delay=""23""/>
n	t	t	t<enemy name=""car"" delay=""24""/>
n	t	t	t<enemy name=""tanket"" delay=""25""/>
n	t	t	t<enemy name=""car"" delay=""26""/>
n	t	t	t<enemy name=""car"" delay=""27""/>
n	t	t	t
n	t	t	t<enemy name=""walker1"" delay=""30""/>
n	t	t	t<enemy name=""walker1"" delay=""40""/>
n	t	t	t<enemy name=""walker1"" delay=""50""/>
n	t	t	t
n	t	t	t<enemy name=""parashut"" delay=""30""/>
n	t	t	t<enemy name=""parashut"" delay=""31""/>
n	t	t	t<enemy name=""parashut"" delay=""32""/>
n	t	t	t<enemy name=""parashut"" delay=""33""/>
n	t	t	t<enemy name=""parashut"" delay=""34""/>
n	t	t	t<enemy name=""parashut"" delay=""35""/>
n	t	t	t<enemy name=""parashut"" delay=""36""/>
n	t	t	t<enemy name=""parashut"" delay=""37""/>
n	t	t	t<enemy name=""parashut"" delay=""38""/>
n	t	t	t<enemy name=""parashut"" delay=""39""/>
n	t	t	t<enemy name=""parashut"" delay=""40""/>
n	t	t	t<enemy name=""parashut"" delay=""41""/>
n	t	t	t<enemy name=""parashut"" delay=""42""/>
n	t	t	t<enemy name=""parashut"" delay=""43""/>
n	t	t	t<enemy name=""parashut"" delay=""44""/>
n	t	t	t<enemy name=""parashut"" delay=""45""/>
n	t	t	t<enemy name=""parashut"" delay=""46""/>
n	t	t	t<enemy name=""parashut"" delay=""47""/>
n	t	t	t<enemy name=""parashut"" delay=""48""/>
n	t	t	t<enemy name=""parashut"" delay=""49""/>
n	t	t	t<enemy name=""parashut"" delay=""50""/>
n	t	t	t<enemy name=""parashut"" delay=""51""/>
n	t	t	t<enemy name=""parashut"" delay=""5""/>
n	t	t	t<enemy name=""parashut"" delay=""53""/>
n	t	t	t<enemy name=""parashut"" delay=""54""/>
n	t	t	t<enemy name=""parashut"" delay=""55""/>
n	t	t	t<enemy name=""parashut"" delay=""56""/>
n	t	t	t<enemy name=""parashut"" delay=""57""/>
n	t	t	t<enemy name=""parashut"" delay=""58""/>
n	t	t	t<enemy name=""parashut"" delay=""59""/>
n	t	t	t
n	t	t	t<enemy name=""car"" delay=""60""/>
n	t	t	t<enemy name=""car"" delay=""61""/>
n	t	t	t<enemy name=""car"" delay=""62""/>
n	t	t	t<enemy name=""car"" delay=""63""/>
n	t	t	t<enemy name=""car"" delay=""64""/>
n	t	t	t<enemy name=""car"" delay=""65""/>
n	t	t	t<enemy name=""car"" delay=""66""/>
n	t	t	t<enemy name=""car"" delay=""67""/>
n	t	t	t<enemy name=""car"" delay=""68""/>
n	t	t	t<enemy name=""car"" delay=""69""/>
n	t	t	t
n	t	t	t<enemy name=""heli"" delay=""60""/>
n	t	t	t<enemy name=""heli"" delay=""65""/>
n	t	t	t<enemy name=""heli"" delay=""70""/>
n	t	t	t
n	t	t	t<enemy name=""tank3"" delay=""70""/>
n	t	t	t
n	t	t	t<enemy name=""parashut"" delay=""70""/>
n	t	t	t<enemy name=""parashut"" delay=""70.5""/>
n	t	t	t<enemy name=""parashut"" delay=""71""/>
n	t	t	t<enemy name=""parashut"" delay=""71.5""/>
n	t	t	t<enemy name=""parashut"" delay=""72""/>
n	t	t	t<enemy name=""parashut"" delay=""72.5""/>
n	t	t	t<enemy name=""parashut"" delay=""73""/>
n	t	t	t<enemy name=""parashut"" delay=""73.5""/>
n	t	t	t<enemy name=""parashut"" delay=""74""/>
n	t	t	t<enemy name=""parashut"" delay=""74.5""/>
n	t	t	t<enemy name=""parashut"" delay=""75""/>
n	t	t	t<enemy name=""parashut"" delay=""75.5""/>
n	t	t	t<enemy name=""parashut"" delay=""76""/>
n	t	t	t<enemy name=""parashut"" delay=""76.5""/>
n	t	t	t<enemy name=""parashut"" delay=""77""/>
n	t	t	t<enemy name=""parashut"" delay=""77.5""/>
n	t	t	t<enemy name=""parashut"" delay=""78""/>
n	t	t	t<enemy name=""parashut"" delay=""78.5""/>
n	t	t	t<enemy name=""parashut"" delay=""79""/>
n	t	t	t<enemy name=""parashut"" delay=""79.5""/>
n	t	t	t<enemy name=""parashut"" delay=""80""/>
n	t	t	t<enemy name=""parashut"" delay=""80.5""/>
n	t	t	t<enemy name=""parashut"" delay=""80""/>
n	t	t	t<enemy name=""parashut"" delay=""80.5""/>
n	t	t	t<enemy name=""parashut"" delay=""81""/>
n	t	t	t<enemy name=""parashut"" delay=""81.5""/>
n	t	t	t<enemy name=""parashut"" delay=""82""/>
n	t	t	t<enemy name=""parashut"" delay=""82.5""/>
n	t	t	t<enemy name=""parashut"" delay=""83""/>
n	t	t	t<enemy name=""parashut"" delay=""83.5""/>
n	t	t	t<enemy name=""parashut"" delay=""84""/>
n	t	t	t<enemy name=""parashut"" delay=""84.5""/>
n	t	t	t<enemy name=""parashut"" delay=""85""/>
n	t	t	t<enemy name=""parashut"" delay=""85.5""/>
n	t	t	t<enemy name=""parashut"" delay=""86""/>
n	t	t	t<enemy name=""parashut"" delay=""86.5""/>
n	t	t	t<enemy name=""parashut"" delay=""87""/>
n	t	t	t<enemy name=""parashut"" delay=""87.5""/>
n	t	t	t
n	t	t	t<enemy name=""unit1"" delay=""80""/>
n	t	t	t<enemy name=""unit1"" delay=""81""/>
n	t	t	t<enemy name=""unit1"" delay=""82""/>
n	t	t	t<enemy name=""unit1"" delay=""83""/>
n	t	t	t<enemy name=""unit1"" delay=""84""/>
n	t	t	t<enemy name=""unit1"" delay=""85""/>
n	t	t	t<enemy name=""unit1"" delay=""86""/>
n	t	t	t<enemy name=""unit1"" delay=""87""/>
n	t	t	t<enemy name=""unit1"" delay=""88""/>
n	t	t	t<enemy name=""unit1"" delay=""89""/>
n	t	t	t<enemy name=""unit1"" delay=""90""/>
n	t	t	t<enemy name=""unit1"" delay=""80.5""/>
n	t	t	t<enemy name=""unit1"" delay=""81.5""/>
n	t	t	t<enemy name=""unit1"" delay=""82.5""/>
n	t	t	t<enemy name=""unit1"" delay=""83.5""/>
n	t	t	t<enemy name=""unit1"" delay=""84.5""/>
n	t	t	t<enemy name=""unit1"" delay=""85.5""/>
n	t	t	t<enemy name=""unit1"" delay=""86.5""/>
n	t	t	t<enemy name=""unit1"" delay=""87.5""/>
n	t	t	t<enemy name=""unit1"" delay=""88.5""/>
n	t	t	t<enemy name=""unit1"" delay=""89.5""/>
n	t	t	t<enemy name=""unit1"" delay=""90.5""/>
n	t	t	t
n	t	t	t<enemy name=""airship"" delay=""85""/>
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""200"" side=""right"" img=""1"">
n            <enemy name=""unit1-line-2"" delay=""1""/>
n	t	t	t<enemy name=""unit1-line-2"" delay=""2""/>
n	t	t	t<enemy name=""unit1-line-2"" delay=""3""/>
n	t	t	t<enemy name=""unit1-line-2"" delay=""4""/>
n	t	t	t<enemy name=""unit1-line-2"" delay=""5""/>
n	t	t	t<enemy name=""unit1-line-2"" delay=""6""/>
n	t	t	t<enemy name=""unit1-line-2"" delay=""7""/>
n	t	t	t<enemy name=""unit1-line-2"" delay=""8""/>
n	t	t	t<enemy name=""unit1-line-2"" delay=""9""/>
n	t	t	t<enemy name=""unit1-line-2"" delay=""10""/>
n	t	t	t
n	t	t	t<enemy name=""parashut"" delay=""8""/>
n	t	t	t<enemy name=""parashut"" delay=""9""/>
n	t	t	t<enemy name=""parashut"" delay=""10""/>
n	t	t	t<enemy name=""parashut"" delay=""11""/>
n	t	t	t<enemy name=""parashut"" delay=""12""/>
n	t	t	t<enemy name=""parashut"" delay=""13""/>
n	t	t	t<enemy name=""parashut"" delay=""14""/>
n	t	t	t<enemy name=""parashut"" delay=""15""/>
n	t	t	t
n	t	t	t<enemy name=""walker1"" delay=""10""/>
n	t	t	t
n	t	t	t<enemy name=""tank2"" delay=""16""/>
n	t	t	t
n	t	t	t<enemy name=""heli"" delay=""15""/>
n	t	t	t<enemy name=""heli"" delay=""20""/>
n	t	t	t<enemy name=""heli"" delay=""25""/>
n	t	t	t<enemy name=""heli"" delay=""30""/>
n	t	t	t
n	t	t	t<enemy name=""car"" delay=""20""/>
n	t	t	t<enemy name=""car"" delay=""21""/>
n	t	t	t<enemy name=""tanket"" delay=""22""/>
n	t	t	t<enemy name=""car"" delay=""23""/>
n	t	t	t<enemy name=""car"" delay=""24""/>
n	t	t	t<enemy name=""tanket"" delay=""25""/>
n	t	t	t<enemy name=""car"" delay=""26""/>
n	t	t	t<enemy name=""car"" delay=""27""/>
n	t	t	t
n	t	t	t<enemy name=""walker1"" delay=""30""/>
n	t	t	t<enemy name=""walker1"" delay=""40""/>
n	t	t	t<enemy name=""walker1"" delay=""50""/>
n	t	t	t
n	t	t	t<enemy name=""parashut"" delay=""30""/>
n	t	t	t<enemy name=""parashut"" delay=""31""/>
n	t	t	t<enemy name=""parashut"" delay=""32""/>
n	t	t	t<enemy name=""parashut"" delay=""33""/>
n	t	t	t<enemy name=""parashut"" delay=""34""/>
n	t	t	t<enemy name=""parashut"" delay=""35""/>
n	t	t	t<enemy name=""parashut"" delay=""36""/>
n	t	t	t<enemy name=""parashut"" delay=""37""/>
n	t	t	t<enemy name=""parashut"" delay=""38""/>
n	t	t	t<enemy name=""parashut"" delay=""39""/>
n	t	t	t<enemy name=""parashut"" delay=""40""/>
n	t	t	t<enemy name=""parashut"" delay=""41""/>
n	t	t	t<enemy name=""parashut"" delay=""42""/>
n	t	t	t<enemy name=""parashut"" delay=""43""/>
n	t	t	t<enemy name=""parashut"" delay=""44""/>
n	t	t	t<enemy name=""parashut"" delay=""45""/>
n	t	t	t<enemy name=""parashut"" delay=""46""/>
n	t	t	t<enemy name=""parashut"" delay=""47""/>
n	t	t	t<enemy name=""parashut"" delay=""48""/>
n	t	t	t<enemy name=""parashut"" delay=""49""/>
n	t	t	t<enemy name=""parashut"" delay=""50""/>
n	t	t	t<enemy name=""parashut"" delay=""51""/>
n	t	t	t<enemy name=""parashut"" delay=""5""/>
n	t	t	t<enemy name=""parashut"" delay=""53""/>
n	t	t	t<enemy name=""parashut"" delay=""54""/>
n	t	t	t<enemy name=""parashut"" delay=""55""/>
n	t	t	t<enemy name=""parashut"" delay=""56""/>
n	t	t	t<enemy name=""parashut"" delay=""57""/>
n	t	t	t<enemy name=""parashut"" delay=""58""/>
n	t	t	t<enemy name=""parashut"" delay=""59""/>
n	t	t	t
n	t	t	t<enemy name=""car"" delay=""60""/>
n	t	t	t<enemy name=""car"" delay=""61""/>
n	t	t	t<enemy name=""car"" delay=""62""/>
n	t	t	t<enemy name=""car"" delay=""63""/>
n	t	t	t<enemy name=""car"" delay=""64""/>
n	t	t	t<enemy name=""car"" delay=""65""/>
n	t	t	t<enemy name=""car"" delay=""66""/>
n	t	t	t<enemy name=""car"" delay=""67""/>
n	t	t	t<enemy name=""car"" delay=""68""/>
n	t	t	t<enemy name=""car"" delay=""69""/>
n	t	t	t
n	t	t	t<enemy name=""heli"" delay=""60""/>
n	t	t	t<enemy name=""heli"" delay=""65""/>
n	t	t	t<enemy name=""heli"" delay=""70""/>
n	t	t	t
n	t	t	t<enemy name=""tank3"" delay=""70""/>
n	t	t	t
n	t	t	t<enemy name=""parashut"" delay=""70""/>
n	t	t	t<enemy name=""parashut"" delay=""70.5""/>
n	t	t	t<enemy name=""parashut"" delay=""71""/>
n	t	t	t<enemy name=""parashut"" delay=""71.5""/>
n	t	t	t<enemy name=""parashut"" delay=""72""/>
n	t	t	t<enemy name=""parashut"" delay=""72.5""/>
n	t	t	t<enemy name=""parashut"" delay=""73""/>
n	t	t	t<enemy name=""parashut"" delay=""73.5""/>
n	t	t	t<enemy name=""parashut"" delay=""74""/>
n	t	t	t<enemy name=""parashut"" delay=""74.5""/>
n	t	t	t<enemy name=""parashut"" delay=""75""/>
n	t	t	t<enemy name=""parashut"" delay=""75.5""/>
n	t	t	t<enemy name=""parashut"" delay=""76""/>
n	t	t	t<enemy name=""parashut"" delay=""76.5""/>
n	t	t	t<enemy name=""parashut"" delay=""77""/>
n	t	t	t<enemy name=""parashut"" delay=""77.5""/>
n	t	t	t<enemy name=""parashut"" delay=""78""/>
n	t	t	t<enemy name=""parashut"" delay=""78.5""/>
n	t	t	t<enemy name=""parashut"" delay=""79""/>
n	t	t	t<enemy name=""parashut"" delay=""79.5""/>
n	t	t	t<enemy name=""parashut"" delay=""80""/>
n	t	t	t<enemy name=""parashut"" delay=""80.5""/>
n	t	t	t<enemy name=""parashut"" delay=""80""/>
n	t	t	t<enemy name=""parashut"" delay=""80.5""/>
n	t	t	t<enemy name=""parashut"" delay=""81""/>
n	t	t	t<enemy name=""parashut"" delay=""81.5""/>
n	t	t	t<enemy name=""parashut"" delay=""82""/>
n	t	t	t<enemy name=""parashut"" delay=""82.5""/>
n	t	t	t<enemy name=""parashut"" delay=""83""/>
n	t	t	t<enemy name=""parashut"" delay=""83.5""/>
n	t	t	t<enemy name=""parashut"" delay=""84""/>
n	t	t	t<enemy name=""parashut"" delay=""84.5""/>
n	t	t	t<enemy name=""parashut"" delay=""85""/>
n	t	t	t<enemy name=""parashut"" delay=""85.5""/>
n	t	t	t<enemy name=""parashut"" delay=""86""/>
n	t	t	t<enemy name=""parashut"" delay=""86.5""/>
n	t	t	t<enemy name=""parashut"" delay=""87""/>
n	t	t	t<enemy name=""parashut"" delay=""87.5""/>
n	t	t	t
n	t	t	t<enemy name=""unit1"" delay=""80""/>
n	t	t	t<enemy name=""unit1"" delay=""81""/>
n	t	t	t<enemy name=""unit1"" delay=""82""/>
n	t	t	t<enemy name=""unit1"" delay=""83""/>
n	t	t	t<enemy name=""unit1"" delay=""84""/>
n	t	t	t<enemy name=""unit1"" delay=""85""/>
n	t	t	t<enemy name=""unit1"" delay=""86""/>
n	t	t	t<enemy name=""unit1"" delay=""87""/>
n	t	t	t<enemy name=""unit1"" delay=""88""/>
n	t	t	t<enemy name=""unit1"" delay=""89""/>
n	t	t	t<enemy name=""unit1"" delay=""90""/>
n	t	t	t<enemy name=""unit1"" delay=""80.5""/>
n	t	t	t<enemy name=""unit1"" delay=""81.5""/>
n	t	t	t<enemy name=""unit1"" delay=""82.5""/>
n	t	t	t<enemy name=""unit1"" delay=""83.5""/>
n	t	t	t<enemy name=""unit1"" delay=""84.5""/>
n	t	t	t<enemy name=""unit1"" delay=""85.5""/>
n	t	t	t<enemy name=""unit1"" delay=""86.5""/>
n	t	t	t<enemy name=""unit1"" delay=""87.5""/>
n	t	t	t<enemy name=""unit1"" delay=""88.5""/>
n	t	t	t<enemy name=""unit1"" delay=""89.5""/>
n	t	t	t<enemy name=""unit1"" delay=""90.5""/>
n	t	t	t
n	t	t	t<enemy name=""airship"" delay=""85""/>
n
n	t	t</wave>
n	t</group>
n</level>")("<level eye="normal" money="49000" maxTower="5" maxUpgrade="5" bg="5" upgradeTwo="true" threeStarHealth="80" twiStarHealth="60" preStartMoney="3000">
	<!-- 
	Пушки
	столбец - 0 лев, 1 центр, 2 прав
	строка -  0 подвал, 1 первый, 2 второй, ...
	индексы апгрейдов 
	1 - upgr2, 
	2 - upgr3_1, 
	3 - upgr4_1, 
	4 - upgr3_2, 
	5 - upgr4_2
	
	значения для глаза(eye)  off, normal, always
	-->
	
	<settings towerLevel="5" towerHealth="50" globalUpgrades="4" maxCannons="10" machinegun="false" heavygun="false" lightning="true" saws="false" score="54000">
	    <!--
		<cannon name="lightning" upgr="5" col="2" row="2"/>
		<cannon name="lightning" upgr="5" col="0" row="2"/>
		-->
		<cannon name="heavygun" upgr="3" col="2" row="1"/>
	</settings>
	<group pause="0">
		<wave pause="0" lifeTime="20" side="left" img="1">
		    <enemy name="balloon" delay="1"/>
			<enemy name="balloon" delay="5"/>
			<enemy name="balloon" delay="10"/>
			<enemy name="balloon" delay="15"/>
			<enemy name="balloon" delay="20"/>
			<enemy name="parashut" delay="1"/>
			<enemy name="parashut" delay="3"/>
			<enemy name="parashut" delay="5"/>
			<enemy name="parashut" delay="7"/>
			<enemy name="parashut" delay="9"/>
			<enemy name="parashut" delay="11"/>
			<enemy name="parashut" delay="13"/>
			<enemy name="parashut" delay="15"/>
			<enemy name="parashut" delay="16"/>
			<enemy name="parashut" delay="17"/>
			<enemy name="parashut" delay="18"/>
			<enemy name="parashut" delay="19"/>
			<enemy name="parashut" delay="20"/>
			
			<enemy name="tank1" delay="5"/>
		</wave>
		<wave pause="0" lifeTime="20" side="right" img="1">
		    <enemy name="balloon" delay="1"/>
			<enemy name="balloon" delay="5"/>
			<enemy name="balloon" delay="10"/>
			<enemy name="balloon" delay="15"/>
			<enemy name="balloon" delay="20"/>
            <enemy name="parashut" delay="1"/>
			<enemy name="parashut" delay="3"/>
			<enemy name="parashut" delay="5"/>
			<enemy name="parashut" delay="7"/>
			<enemy name="parashut" delay="9"/>
			<enemy name="parashut" delay="11"/>
			<enemy name="parashut" delay="13"/>
			<enemy name="parashut" delay="15"/>
			<enemy name="parashut" delay="16"/>
			<enemy name="parashut" delay="17"/>
			<enemy name="parashut" delay="18"/>
			<enemy name="parashut" delay="19"/>
			<enemy name="parashut" delay="20"/>
			
			<enemy name="tank1" delay="15"/>
		</wave>
	</group>
	<group pause="2">
		<wave pause="0" lifeTime="20" side="left" img="1">
		    <enemy name="unit2-line-3" delay="1"/>
			<enemy name="unit2-line-3" delay="2"/>
			<enemy name="unit2-line-3" delay="3"/>
			<enemy name="tank1" delay="3"/>
			<enemy name="tank1" delay="13"/>
			
			<enemy name="unit1" delay="7"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="12"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit1" delay="17"/>

		</wave>
		<wave pause="0" lifeTime="20" side="right" img="1">
		    <enemy name="unit2-line-3" delay="1"/>
			<enemy name="unit2-line-3" delay="2"/>
			<enemy name="unit2-line-3" delay="3"/>
			<enemy name="tank1" delay="7"/>
			<enemy name="tank1" delay="17"/>
			
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="12"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit1" delay="17"/>
			<enemy name="unit1" delay="18"/>
			<enemy name="unit1" delay="19"/>
			<enemy name="unit1" delay="20"/>
		</wave>
	</group>
	<group pause="2">
		<wave pause="0" lifeTime="30" side="left" img="1">
			<enemy name="tank1" delay="1"/>
			<enemy name="aerostat" delay="0"/>
			<enemy name="aerostat" delay="5"/>
			<enemy name="aerostat" delay="10"/>
			<enemy name="aerostat" delay="15"/>
			<enemy name="aerostat" delay="20"/>
			<enemy name="aerostat" delay="25"/>
			
			<enemy name="parashut" delay="1"/>
			<enemy name="parashut" delay="3"/>
			<enemy name="parashut" delay="5"/>
			<enemy name="parashut" delay="7"/>
			<enemy name="parashut" delay="9"/>
			<enemy name="parashut" delay="11"/>
			<enemy name="parashut" delay="12"/>
			<enemy name="parashut" delay="13"/>
			<enemy name="parashut" delay="14"/>
			<enemy name="parashut" delay="15"/>
			<enemy name="parashut" delay="16"/>
			<enemy name="parashut" delay="17"/>
			<enemy name="parashut" delay="18"/>
			<enemy name="parashut" delay="19"/>
			<enemy name="parashut" delay="20"/>
			
			<enemy name="unit1" delay="7"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="12"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit1" delay="17"/>
			
			<enemy name="car" delay="8"/>
			<enemy name="car" delay="13"/>
			<enemy name="car" delay="17"/>
			
			<enemy name="tank1" delay="20"/>
			<enemy name="tank1" delay="23"/>
			<enemy name="tank2" delay="25"/>
			<enemy name="tank2" delay="28"/>
			<enemy name="tank3" delay="33"/>

		</wave>
		<wave pause="0" lifeTime="30" side="right" img="1">
			<enemy name="tank1" delay="1"/>
			<enemy name="aerostat" delay="0"/>
			<enemy name="aerostat" delay="5"/>
			<enemy name="aerostat" delay="10"/>
			<enemy name="aerostat" delay="15"/>
			<enemy name="aerostat" delay="20"/>
			<enemy name="aerostat" delay="25"/>
			
			<enemy name="parashut" delay="1"/>
			<enemy name="parashut" delay="3"/>
			<enemy name="parashut" delay="5"/>
			<enemy name="parashut" delay="7"/>
			<enemy name="parashut" delay="9"/>
			<enemy name="parashut" delay="11"/>
			<enemy name="parashut" delay="12"/>
			<enemy name="parashut" delay="13"/>
			<enemy name="parashut" delay="14"/>
			<enemy name="parashut" delay="15"/>
			<enemy name="parashut" delay="16"/>
			<enemy name="parashut" delay="17"/>
			<enemy name="parashut" delay="18"/>
			<enemy name="parashut" delay="19"/>
			<enemy name="parashut" delay="20"/>
			
			<enemy name="unit1" delay="7"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="12"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit1" delay="17"/>
			
			<enemy name="car" delay="9"/>
			<enemy name="car" delay="12"/>
			<enemy name="car" delay="16"/>
			
			<enemy name="tank1" delay="20"/>
			<enemy name="tank1" delay="23"/>
			<enemy name="tank2" delay="25"/>
			<enemy name="tank2" delay="28"/>
			<enemy name="tank3" delay="33"/>
		</wave>
	</group>
	<group pause="5">
		<wave pause="0" lifeTime="20" side="right" img="1">
			<enemy name="walker1" delay="1"/>
			<enemy name="unit2-line-3" delay="7"/>
			<enemy name="unit2-line-3" delay="8"/>
			<enemy name="unit2-line-3" delay="9"/>
			<enemy name="unit2-line-3" delay="10"/>
		</wave>
	</group>
	<group pause="2">
		<wave pause="0" lifeTime="20" side="left" img="1">
		    <enemy name="walker1" delay="1"/>
		    <enemy name="walker1" delay="10"/>
			<enemy name="balloon" delay="1"/>
			<enemy name="balloon" delay="5"/>
			<enemy name="balloon" delay="10"/>
			<enemy name="balloon" delay="15"/>
			<enemy name="balloon" delay="20"/>
			
			<enemy name="parashut" delay="1"/>
			<enemy name="parashut" delay="3"/>
			<enemy name="parashut" delay="5"/>
			<enemy name="parashut" delay="7"/>
			<enemy name="parashut" delay="9"/>
			<enemy name="parashut" delay="11"/>
			<enemy name="parashut" delay="13"/>
			<enemy name="parashut" delay="15"/>
			<enemy name="parashut" delay="16"/>
			<enemy name="parashut" delay="17"/>
			<enemy name="parashut" delay="18"/>
			<enemy name="parashut" delay="19"/>
			<enemy name="parashut" delay="20"/>
		</wave>
		<wave pause="0" lifeTime="20" side="right" img="1">
			<enemy name="walker1" delay="1"/>
			<enemy name="walker1" delay="10"/>
			<enemy name="balloon" delay="1"/>
			<enemy name="balloon" delay="5"/>
			<enemy name="balloon" delay="10"/>
			<enemy name="balloon" delay="15"/>
			<enemy name="balloon" delay="20"/>
			
			<enemy name="parashut" delay="1"/>
			<enemy name="parashut" delay="3"/>
			<enemy name="parashut" delay="5"/>
			<enemy name="parashut" delay="7"/>
			<enemy name="parashut" delay="9"/>
			<enemy name="parashut" delay="11"/>
			<enemy name="parashut" delay="13"/>
			<enemy name="parashut" delay="15"/>
			<enemy name="parashut" delay="16"/>
			<enemy name="parashut" delay="17"/>
			<enemy name="parashut" delay="18"/>
			<enemy name="parashut" delay="19"/>
			<enemy name="parashut" delay="20"/>
		</wave>
	</group>
	<group pause="3">
		<wave pause="0" lifeTime="20" side="left" img="1">
			<enemy name="walker2" delay="1"/>
			
			<enemy name="unit1" delay="7"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="12"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit1" delay="17"/>

		</wave>
	</group>
	<group pause="8">
		<wave pause="0" lifeTime="20" side="left" img="1">
		    <enemy name="tank3" delay="1"/>
			<enemy name="heli" delay="1"/>
			<enemy name="heli" delay="5"/>
			<enemy name="heli" delay="10"/>
			<enemy name="heli" delay="15"/>
			<enemy name="heli" delay="20"/>
			
			<enemy name="airplane" delay="1"/>
			<enemy name="airplane" delay="5"/>
			<enemy name="airplane" delay="10"/>
			<enemy name="airplane" delay="15"/>
			<enemy name="airplane" delay="20"/>
			
			<enemy name="parashut" delay="1"/>
			<enemy name="parashut" delay="3"/>
			<enemy name="parashut" delay="5"/>
			<enemy name="parashut" delay="7"/>
			<enemy name="parashut" delay="9"/>
			<enemy name="parashut" delay="11"/>
			<enemy name="parashut" delay="13"/>
			<enemy name="parashut" delay="15"/>
			<enemy name="parashut" delay="16"/>
			<enemy name="parashut" delay="17"/>
			<enemy name="parashut" delay="18"/>
			<enemy name="parashut" delay="19"/>
			<enemy name="parashut" delay="20"/>
		</wave>
		<wave pause="0" lifeTime="20" side="right" img="1">
			<enemy name="tank3" delay="1"/>
			<enemy name="heli" delay="1"/>
			<enemy name="heli" delay="5"/>
			<enemy name="heli" delay="10"/>
			<enemy name="heli" delay="15"/>
			<enemy name="heli" delay="20"/>
			
			<enemy name="airplane" delay="1"/>
			<enemy name="airplane" delay="4"/>
			<enemy name="airplane" delay="9"/>
			<enemy name="airplane" delay="14"/>
			<enemy name="airplane" delay="19"/>
			
			<enemy name="parashut" delay="1"/>
			<enemy name="parashut" delay="3"/>
			<enemy name="parashut" delay="5"/>
			<enemy name="parashut" delay="7"/>
			<enemy name="parashut" delay="9"/>
			<enemy name="parashut" delay="11"/>
			<enemy name="parashut" delay="13"/>
			<enemy name="parashut" delay="15"/>
			<enemy name="parashut" delay="16"/>
			<enemy name="parashut" delay="17"/>
			<enemy name="parashut" delay="18"/>
			<enemy name="parashut" delay="19"/>
			<enemy name="parashut" delay="20"/>
		</wave>
	</group>
	
	<group pause="8">
		<wave pause="0" lifeTime="65" side="left" img="1">
		    <enemy name="airplane" delay="1"/>
			<enemy name="airplane" delay="2"/>
			<enemy name="unit1-line-4" delay="0"/>
			<enemy name="unit1-line-4" delay="0.5"/>
			<enemy name="unit1-line-4" delay="3"/>
			<enemy name="unit1-line-4" delay="3.5"/>
			<enemy name="unit1-line-4" delay="6"/>
			<enemy name="unit1-line-4" delay="6.5"/>
			<enemy name="unit1-line-4" delay="9"/>
			<enemy name="unit1-line-4" delay="9.5"/>
			<enemy name="unit1-line-4" delay="12"/>
			<enemy name="unit1-line-4" delay="12.5"/>
			<enemy name="unit1-line-4" delay="15"/>
			<enemy name="unit1-line-4" delay="15.5"/>
			
			<enemy name="heli" delay="1"/>
			<enemy name="heli" delay="4"/>
			<enemy name="heli" delay="8"/>
			<enemy name="heli" delay="12"/>
			<enemy name="heli" delay="16"/>
			<enemy name="heli" delay="20"/>
			<enemy name="heli" delay="24"/>
			<enemy name="heli" delay="28"/>
			<enemy name="heli" delay="32"/>
			
			<enemy name="unit2" delay="20"/>
			<enemy name="unit2" delay="21"/>
			<enemy name="tanket" delay="22"/>
			<enemy name="unit2" delay="23"/>
			<enemy name="unit2" delay="24"/>
			<enemy name="tanket" delay="25"/>
			<enemy name="unit2" delay="26"/>
			<enemy name="unit2" delay="27"/>
			
			<enemy name="airplane" delay="30"/>
			<enemy name="airplane" delay="31"/>
			<enemy name="airplane" delay="32"/>
			
			<enemy name="wheel" delay="30"/>
			<enemy name="wheel" delay="31"/>
			<enemy name="wheel" delay="32"/>
			<enemy name="wheel" delay="33"/>
			
			<enemy name="walker2" delay="35"/>
		</wave>
		<wave pause="0" lifeTime="65" side="right" img="1">
		    <enemy name="airplane" delay="1"/>
			<enemy name="airplane" delay="2"/>
			<enemy name="unit1-line-4" delay="0"/>
			<enemy name="unit1-line-4" delay="0.5"/>
			<enemy name="unit1-line-4" delay="3"/>
			<enemy name="unit1-line-4" delay="3.5"/>
			<enemy name="unit1-line-4" delay="6"/>
			<enemy name="unit1-line-4" delay="6.5"/>
			<enemy name="unit1-line-4" delay="9"/>
			<enemy name="unit1-line-4" delay="9.5"/>
			<enemy name="unit1-line-4" delay="12"/>
			<enemy name="unit1-line-4" delay="12.5"/>
			<enemy name="unit1-line-4" delay="15"/>
			<enemy name="unit1-line-4" delay="15.5"/>
			
			<enemy name="heli" delay="1"/>
			<enemy name="heli" delay="4"/>
			<enemy name="heli" delay="8"/>
			<enemy name="heli" delay="12"/>
			<enemy name="heli" delay="16"/>
			<enemy name="heli" delay="20"/>
			<enemy name="heli" delay="24"/>
			<enemy name="heli" delay="28"/>
			<enemy name="heli" delay="32"/>
			
			<enemy name="unit2" delay="20"/>
			<enemy name="unit2" delay="21"/>
			<enemy name="tanket" delay="22"/>
			<enemy name="unit2" delay="23"/>
			<enemy name="unit2" delay="24"/>
			<enemy name="tanket" delay="25"/>
			<enemy name="unit2" delay="26"/>
			<enemy name="unit2" delay="27"/>
			
			<enemy name="airplane" delay="30"/>
			<enemy name="airplane" delay="31"/>
			<enemy name="airplane" delay="32"/>
			
			<enemy name="wheel" delay="30"/>
			<enemy name="wheel" delay="31"/>
			<enemy name="wheel" delay="32"/>
			<enemy name="wheel" delay="33"/>
			<enemy name="wheel" delay="34"/>
			<enemy name="wheel" delay="35"/>
			<enemy name="wheel" delay="36"/>
			
			<enemy name="walker2" delay="43"/>
		</wave>
	</group>
	<group pause="10">
		<wave pause="0" lifeTime="200" side="left" img="1">
		    <enemy name="unit1-line-2" delay="1"/>
			<enemy name="unit1-line-2" delay="2"/>
			<enemy name="unit1-line-2" delay="3"/>
			<enemy name="unit1-line-2" delay="4"/>
			<enemy name="unit1-line-2" delay="5"/>
			<enemy name="unit1-line-2" delay="6"/>
			<enemy name="unit1-line-2" delay="7"/>
			<enemy name="unit1-line-2" delay="8"/>
			<enemy name="unit1-line-2" delay="9"/>
			<enemy name="unit1-line-2" delay="10"/>
			
			<enemy name="parashut" delay="8"/>
			<enemy name="parashut" delay="9"/>
			<enemy name="parashut" delay="10"/>
			<enemy name="parashut" delay="11"/>
			<enemy name="parashut" delay="12"/>
			<enemy name="parashut" delay="13"/>
			<enemy name="parashut" delay="14"/>
			<enemy name="parashut" delay="15"/>
			
			<enemy name="walker1" delay="10"/>
			
			<enemy name="tank2" delay="16"/>
			
			<enemy name="heli" delay="15"/>
			<enemy name="heli" delay="20"/>
			<enemy name="heli" delay="25"/>
			<enemy name="heli" delay="30"/>
			
			<enemy name="car" delay="20"/>
			<enemy name="car" delay="21"/>
			<enemy name="tanket" delay="22"/>
			<enemy name="car" delay="23"/>
			<enemy name="car" delay="24"/>
			<enemy name="tanket" delay="25"/>
			<enemy name="car" delay="26"/>
			<enemy name="car" delay="27"/>
			
			<enemy name="walker1" delay="30"/>
			<enemy name="walker1" delay="40"/>
			<enemy name="walker1" delay="50"/>
			
			<enemy name="parashut" delay="30"/>
			<enemy name="parashut" delay="31"/>
			<enemy name="parashut" delay="32"/>
			<enemy name="parashut" delay="33"/>
			<enemy name="parashut" delay="34"/>
			<enemy name="parashut" delay="35"/>
			<enemy name="parashut" delay="36"/>
			<enemy name="parashut" delay="37"/>
			<enemy name="parashut" delay="38"/>
			<enemy name="parashut" delay="39"/>
			<enemy name="parashut" delay="40"/>
			<enemy name="parashut" delay="41"/>
			<enemy name="parashut" delay="42"/>
			<enemy name="parashut" delay="43"/>
			<enemy name="parashut" delay="44"/>
			<enemy name="parashut" delay="45"/>
			<enemy name="parashut" delay="46"/>
			<enemy name="parashut" delay="47"/>
			<enemy name="parashut" delay="48"/>
			<enemy name="parashut" delay="49"/>
			<enemy name="parashut" delay="50"/>
			<enemy name="parashut" delay="51"/>
			<enemy name="parashut" delay="5"/>
			<enemy name="parashut" delay="53"/>
			<enemy name="parashut" delay="54"/>
			<enemy name="parashut" delay="55"/>
			<enemy name="parashut" delay="56"/>
			<enemy name="parashut" delay="57"/>
			<enemy name="parashut" delay="58"/>
			<enemy name="parashut" delay="59"/>
			
			<enemy name="car" delay="60"/>
			<enemy name="car" delay="61"/>
			<enemy name="car" delay="62"/>
			<enemy name="car" delay="63"/>
			<enemy name="car" delay="64"/>
			<enemy name="car" delay="65"/>
			<enemy name="car" delay="66"/>
			<enemy name="car" delay="67"/>
			<enemy name="car" delay="68"/>
			<enemy name="car" delay="69"/>
			
			<enemy name="heli" delay="60"/>
			<enemy name="heli" delay="65"/>
			<enemy name="heli" delay="70"/>
			
			<enemy name="tank3" delay="70"/>
			
			<enemy name="parashut" delay="70"/>
			<enemy name="parashut" delay="70.5"/>
			<enemy name="parashut" delay="71"/>
			<enemy name="parashut" delay="71.5"/>
			<enemy name="parashut" delay="72"/>
			<enemy name="parashut" delay="72.5"/>
			<enemy name="parashut" delay="73"/>
			<enemy name="parashut" delay="73.5"/>
			<enemy name="parashut" delay="74"/>
			<enemy name="parashut" delay="74.5"/>
			<enemy name="parashut" delay="75"/>
			<enemy name="parashut" delay="75.5"/>
			<enemy name="parashut" delay="76"/>
			<enemy name="parashut" delay="76.5"/>
			<enemy name="parashut" delay="77"/>
			<enemy name="parashut" delay="77.5"/>
			<enemy name="parashut" delay="78"/>
			<enemy name="parashut" delay="78.5"/>
			<enemy name="parashut" delay="79"/>
			<enemy name="parashut" delay="79.5"/>
			<enemy name="parashut" delay="80"/>
			<enemy name="parashut" delay="80.5"/>
			<enemy name="parashut" delay="80"/>
			<enemy name="parashut" delay="80.5"/>
			<enemy name="parashut" delay="81"/>
			<enemy name="parashut" delay="81.5"/>
			<enemy name="parashut" delay="82"/>
			<enemy name="parashut" delay="82.5"/>
			<enemy name="parashut" delay="83"/>
			<enemy name="parashut" delay="83.5"/>
			<enemy name="parashut" delay="84"/>
			<enemy name="parashut" delay="84.5"/>
			<enemy name="parashut" delay="85"/>
			<enemy name="parashut" delay="85.5"/>
			<enemy name="parashut" delay="86"/>
			<enemy name="parashut" delay="86.5"/>
			<enemy name="parashut" delay="87"/>
			<enemy name="parashut" delay="87.5"/>
			
			<enemy name="unit1" delay="80"/>
			<enemy name="unit1" delay="81"/>
			<enemy name="unit1" delay="82"/>
			<enemy name="unit1" delay="83"/>
			<enemy name="unit1" delay="84"/>
			<enemy name="unit1" delay="85"/>
			<enemy name="unit1" delay="86"/>
			<enemy name="unit1" delay="87"/>
			<enemy name="unit1" delay="88"/>
			<enemy name="unit1" delay="89"/>
			<enemy name="unit1" delay="90"/>
			<enemy name="unit1" delay="80.5"/>
			<enemy name="unit1" delay="81.5"/>
			<enemy name="unit1" delay="82.5"/>
			<enemy name="unit1" delay="83.5"/>
			<enemy name="unit1" delay="84.5"/>
			<enemy name="unit1" delay="85.5"/>
			<enemy name="unit1" delay="86.5"/>
			<enemy name="unit1" delay="87.5"/>
			<enemy name="unit1" delay="88.5"/>
			<enemy name="unit1" delay="89.5"/>
			<enemy name="unit1" delay="90.5"/>
			
			<enemy name="airship" delay="85"/>
		</wave>
		<wave pause="0" lifeTime="200" side="right" img="1">
            <enemy name="unit1-line-2" delay="1"/>
			<enemy name="unit1-line-2" delay="2"/>
			<enemy name="unit1-line-2" delay="3"/>
			<enemy name="unit1-line-2" delay="4"/>
			<enemy name="unit1-line-2" delay="5"/>
			<enemy name="unit1-line-2" delay="6"/>
			<enemy name="unit1-line-2" delay="7"/>
			<enemy name="unit1-line-2" delay="8"/>
			<enemy name="unit1-line-2" delay="9"/>
			<enemy name="unit1-line-2" delay="10"/>
			
			<enemy name="parashut" delay="8"/>
			<enemy name="parashut" delay="9"/>
			<enemy name="parashut" delay="10"/>
			<enemy name="parashut" delay="11"/>
			<enemy name="parashut" delay="12"/>
			<enemy name="parashut" delay="13"/>
			<enemy name="parashut" delay="14"/>
			<enemy name="parashut" delay="15"/>
			
			<enemy name="walker1" delay="10"/>
			
			<enemy name="tank2" delay="16"/>
			
			<enemy name="heli" delay="15"/>
			<enemy name="heli" delay="20"/>
			<enemy name="heli" delay="25"/>
			<enemy name="heli" delay="30"/>
			
			<enemy name="car" delay="20"/>
			<enemy name="car" delay="21"/>
			<enemy name="tanket" delay="22"/>
			<enemy name="car" delay="23"/>
			<enemy name="car" delay="24"/>
			<enemy name="tanket" delay="25"/>
			<enemy name="car" delay="26"/>
			<enemy name="car" delay="27"/>
			
			<enemy name="walker1" delay="30"/>
			<enemy name="walker1" delay="40"/>
			<enemy name="walker1" delay="50"/>
			
			<enemy name="parashut" delay="30"/>
			<enemy name="parashut" delay="31"/>
			<enemy name="parashut" delay="32"/>
			<enemy name="parashut" delay="33"/>
			<enemy name="parashut" delay="34"/>
			<enemy name="parashut" delay="35"/>
			<enemy name="parashut" delay="36"/>
			<enemy name="parashut" delay="37"/>
			<enemy name="parashut" delay="38"/>
			<enemy name="parashut" delay="39"/>
			<enemy name="parashut" delay="40"/>
			<enemy name="parashut" delay="41"/>
			<enemy name="parashut" delay="42"/>
			<enemy name="parashut" delay="43"/>
			<enemy name="parashut" delay="44"/>
			<enemy name="parashut" delay="45"/>
			<enemy name="parashut" delay="46"/>
			<enemy name="parashut" delay="47"/>
			<enemy name="parashut" delay="48"/>
			<enemy name="parashut" delay="49"/>
			<enemy name="parashut" delay="50"/>
			<enemy name="parashut" delay="51"/>
			<enemy name="parashut" delay="5"/>
			<enemy name="parashut" delay="53"/>
			<enemy name="parashut" delay="54"/>
			<enemy name="parashut" delay="55"/>
			<enemy name="parashut" delay="56"/>
			<enemy name="parashut" delay="57"/>
			<enemy name="parashut" delay="58"/>
			<enemy name="parashut" delay="59"/>
			
			<enemy name="car" delay="60"/>
			<enemy name="car" delay="61"/>
			<enemy name="car" delay="62"/>
			<enemy name="car" delay="63"/>
			<enemy name="car" delay="64"/>
			<enemy name="car" delay="65"/>
			<enemy name="car" delay="66"/>
			<enemy name="car" delay="67"/>
			<enemy name="car" delay="68"/>
			<enemy name="car" delay="69"/>
			
			<enemy name="heli" delay="60"/>
			<enemy name="heli" delay="65"/>
			<enemy name="heli" delay="70"/>
			
			<enemy name="tank3" delay="70"/>
			
			<enemy name="parashut" delay="70"/>
			<enemy name="parashut" delay="70.5"/>
			<enemy name="parashut" delay="71"/>
			<enemy name="parashut" delay="71.5"/>
			<enemy name="parashut" delay="72"/>
			<enemy name="parashut" delay="72.5"/>
			<enemy name="parashut" delay="73"/>
			<enemy name="parashut" delay="73.5"/>
			<enemy name="parashut" delay="74"/>
			<enemy name="parashut" delay="74.5"/>
			<enemy name="parashut" delay="75"/>
			<enemy name="parashut" delay="75.5"/>
			<enemy name="parashut" delay="76"/>
			<enemy name="parashut" delay="76.5"/>
			<enemy name="parashut" delay="77"/>
			<enemy name="parashut" delay="77.5"/>
			<enemy name="parashut" delay="78"/>
			<enemy name="parashut" delay="78.5"/>
			<enemy name="parashut" delay="79"/>
			<enemy name="parashut" delay="79.5"/>
			<enemy name="parashut" delay="80"/>
			<enemy name="parashut" delay="80.5"/>
			<enemy name="parashut" delay="80"/>
			<enemy name="parashut" delay="80.5"/>
			<enemy name="parashut" delay="81"/>
			<enemy name="parashut" delay="81.5"/>
			<enemy name="parashut" delay="82"/>
			<enemy name="parashut" delay="82.5"/>
			<enemy name="parashut" delay="83"/>
			<enemy name="parashut" delay="83.5"/>
			<enemy name="parashut" delay="84"/>
			<enemy name="parashut" delay="84.5"/>
			<enemy name="parashut" delay="85"/>
			<enemy name="parashut" delay="85.5"/>
			<enemy name="parashut" delay="86"/>
			<enemy name="parashut" delay="86.5"/>
			<enemy name="parashut" delay="87"/>
			<enemy name="parashut" delay="87.5"/>
			
			<enemy name="unit1" delay="80"/>
			<enemy name="unit1" delay="81"/>
			<enemy name="unit1" delay="82"/>
			<enemy name="unit1" delay="83"/>
			<enemy name="unit1" delay="84"/>
			<enemy name="unit1" delay="85"/>
			<enemy name="unit1" delay="86"/>
			<enemy name="unit1" delay="87"/>
			<enemy name="unit1" delay="88"/>
			<enemy name="unit1" delay="89"/>
			<enemy name="unit1" delay="90"/>
			<enemy name="unit1" delay="80.5"/>
			<enemy name="unit1" delay="81.5"/>
			<enemy name="unit1" delay="82.5"/>
			<enemy name="unit1" delay="83.5"/>
			<enemy name="unit1" delay="84.5"/>
			<enemy name="unit1" delay="85.5"/>
			<enemy name="unit1" delay="86.5"/>
			<enemy name="unit1" delay="87.5"/>
			<enemy name="unit1" delay="88.5"/>
			<enemy name="unit1" delay="89.5"/>
			<enemy name="unit1" delay="90.5"/>
			
			<enemy name="airship" delay="85"/>

		</wave>
	</group>
</level>;
            var _loc_30:* = <level eye=""normal"" money=""8000"" maxTower=""5"" maxUpgrade=""5"" bg=""5"" upgradeTwo=""true"" threeStarHealth=""80"" twiStarHealth=""60"" preStartMoney=""3200"">
n	t<!-- 
n	tПушки
n	tстолбец - 0 лев, 1 центр, 2 прав
n	tстрока -  0 подвал, 1 первый, 2 второй, ...
n	tиндексы апгрейдов 
n	t1 - upgr2, 
n	t2 - upgr3_1, 
n	t3 - upgr4_1, 
n	t4 - upgr3_2, 
n	t5 - upgr4_2
n	t
n	tзначения для глаза(eye)  off, normal, always
n	t-->
n	t
n	t<settings towerLevel=""5"" towerHealth=""50"" globalUpgrades=""4"" maxCannons=""10"" machinegun=""true"" heavygun=""false"" lightning=""true"" saws=""true"" score=""56000"">
n	t    <!--
n	t	t<cannon name=""lightning"" upgr=""5"" col=""2"" row=""2""/>
n	t	t<cannon name=""lightning"" upgr=""5"" col=""0"" row=""2""/>
n	t	t-->
n	t	t<cannon name=""machinegun"" upgr=""3"" col=""2"" row=""4""/>
n	t	t<cannon name=""machinegun"" upgr=""3"" col=""0"" row=""4""/>
n	t	t<cannon name=""machinegun"" upgr=""3"" col=""2"" row=""2""/>
n	t	t<cannon name=""machinegun"" upgr=""3"" col=""0"" row=""2""/>
n	t	t
n	t	t<cannon name=""saws"" upgr=""5"" col=""2"" row=""1""/>
n	t	t<cannon name=""saws"" upgr=""5"" col=""0"" row=""1""/>
n	t	t<cannon name=""saws"" upgr=""5"" col=""2"" row=""3""/>
n	t	t<cannon name=""saws"" upgr=""5"" col=""0"" row=""3""/>
n	t</settings>
n	t<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""200"" side=""left"" img=""1"">
n	t	t	t<enemy name=""walker2"" delay=""1""/>
n	t	t	t
n	t	t	t<enemy name=""walker1"" delay=""18""/>
n	t	t	t
n	t	t	t<enemy name=""tank2"" delay=""25""/>
n	t	t	t
n	t	t	t<enemy name=""car"" delay=""35""/>
n	t	t	t
n	t	t	t<enemy name=""unit1"" delay=""42""/>
n	t	t	t
n	t	t	t<enemy name=""unit1"" delay=""51""/>
n	t	t	t<enemy name=""unit1"" delay=""52""/>
n	t	t	t<enemy name=""unit2"" delay=""53""/>
n	t	t	t<enemy name=""unit1"" delay=""54""/>
n	t	t	t<enemy name=""unit1"" delay=""55""/>
n	t	t	t<enemy name=""unit2"" delay=""57""/>
n	t	t	t<enemy name=""unit1"" delay=""58""/>
n	t	t	t<enemy name=""unit1"" delay=""59""/>
n	t	t	t<enemy name=""unit2"" delay=""60""/>
n	t	t	t<enemy name=""unit1"" delay=""61""/>
n	t	t	t<enemy name=""unit1"" delay=""63""/>
n	t	t	t<enemy name=""unit2"" delay=""64""/>
n	t	t	t<enemy name=""unit1"" delay=""65""/>
n	t	t	t<enemy name=""unit1"" delay=""66""/>
n	t	t	t<enemy name=""unit2"" delay=""67""/>
n	t	t	t<enemy name=""unit1"" delay=""68""/>
n	t	t	t<enemy name=""unit1"" delay=""69""/>
n	t	t	t<enemy name=""unit2"" delay=""70""/>
n	t	t	t<enemy name=""unit1"" delay=""51""/>
n	t	t	t<enemy name=""unit1"" delay=""52""/>
n	t	t	t<enemy name=""unit2"" delay=""53""/>
n	t	t	t<enemy name=""unit1"" delay=""54""/>
n	t	t	t<enemy name=""unit1"" delay=""55""/>
n	t	t	t<enemy name=""unit2"" delay=""57""/>
n	t	t	t<enemy name=""unit1"" delay=""58""/>
n	t	t	t<enemy name=""unit1"" delay=""59""/>
n	t	t	t<enemy name=""unit2"" delay=""60""/>
n	t	t	t<enemy name=""unit1"" delay=""61""/>
n	t	t	t<enemy name=""unit1"" delay=""63""/>
n	t	t	t<enemy name=""unit2"" delay=""64""/>
n	t	t	t<enemy name=""unit1"" delay=""65""/>
n	t	t	t<enemy name=""unit1"" delay=""66""/>
n	t	t	t<enemy name=""unit2"" delay=""67""/>
n	t	t	t<enemy name=""unit1"" delay=""68""/>
n	t	t	t<enemy name=""unit1"" delay=""69""/>
n	t	t	t<enemy name=""unit2"" delay=""70""/>
n	t	t	t<enemy name=""unit1"" delay=""72""/>
n	t	t	t<enemy name=""unit1"" delay=""73""/>
n	t	t	t<enemy name=""unit1"" delay=""74""/>
n	t	t	t<enemy name=""unit1"" delay=""75""/>
n	t	t	t<enemy name=""unit1"" delay=""76""/>
n	t	t	t<enemy name=""unit1"" delay=""77""/>
n	t	t	t<enemy name=""unit1"" delay=""78""/>
n	t	t	t<enemy name=""unit1"" delay=""79""/>
n	t	t	t<enemy name=""unit2"" delay=""80""/>
n	t	t	t<enemy name=""unit1"" delay=""82""/>
n	t	t	t<enemy name=""unit1"" delay=""83""/>
n	t	t	t<enemy name=""unit1"" delay=""84""/>
n	t	t	t<enemy name=""unit1"" delay=""85""/>
n	t	t	t<enemy name=""unit1"" delay=""86""/>
n	t	t	t<enemy name=""unit1"" delay=""87""/>
n	t	t	t<enemy name=""unit1"" delay=""88""/>
n	t	t	t<enemy name=""unit1"" delay=""89""/>
n	t	t	t<enemy name=""unit2"" delay=""90""/>
n	t	t	t<enemy name=""unit1"" delay=""92""/>
n	t	t	t<enemy name=""unit1"" delay=""93""/>
n	t	t	t<enemy name=""unit1"" delay=""94""/>
n	t	t	t<enemy name=""unit1"" delay=""95""/>
n	t	t	t<enemy name=""unit1"" delay=""96""/>
n	t	t	t<enemy name=""unit1"" delay=""97""/>
n	t	t	t<enemy name=""unit1"" delay=""98""/>
n	t	t	t<enemy name=""unit1"" delay=""99""/>
n	t	t	t<enemy name=""unit1"" delay=""101""/>
n	t	t	t<enemy name=""unit1"" delay=""102""/>
n	t	t	t<enemy name=""unit1"" delay=""103""/>
n	t	t	t<enemy name=""unit1"" delay=""104""/>
n	t	t	t<enemy name=""unit1"" delay=""105""/>
n	t	t	t<enemy name=""unit1"" delay=""106""/>
n	t	t	t<enemy name=""unit1"" delay=""107""/>
n	t	t	t<enemy name=""unit1"" delay=""108""/>
n	t	t	t<enemy name=""unit1"" delay=""109""/>
n	t	t	t<enemy name=""unit1"" delay=""111""/>
n	t	t	t<enemy name=""unit1"" delay=""112""/>
n	t	t	t<enemy name=""unit1"" delay=""113""/>
n	t	t	t<enemy name=""unit1"" delay=""114""/>
n	t	t	t<enemy name=""unit1"" delay=""115""/>
n	t	t	t<enemy name=""unit1"" delay=""116""/>
n	t	t	t<enemy name=""unit1"" delay=""117""/>
n	t	t	t<enemy name=""unit1"" delay=""118""/>
n	t	t	t<enemy name=""unit1"" delay=""119""/>
n	t	t    <enemy name=""unit1"" delay=""121""/>
n	t	t	t<enemy name=""unit1"" delay=""122""/>
n	t	t	t<enemy name=""unit1"" delay=""123""/>
n	t	t	t<enemy name=""unit1"" delay=""124""/>
n	t	t	t<enemy name=""unit1"" delay=""125""/>
n	t	t	t<enemy name=""unit1"" delay=""126""/>
n	t	t	t<enemy name=""unit1"" delay=""127""/>
n	t	t	t<enemy name=""unit1"" delay=""128""/>
n	t	t	t<enemy name=""unit1"" delay=""129""/>
n	t	t	t<enemy name=""unit2"" delay=""130""/>
n	t	t	t<enemy name=""unit1"" delay=""131""/>
n	t	t	t<enemy name=""unit1"" delay=""132""/>
n	t	t	t<enemy name=""unit1"" delay=""133""/>
n	t	t	t<enemy name=""unit1"" delay=""134""/>
n	t	t	t<enemy name=""unit1"" delay=""135""/>
n	t	t	t<enemy name=""unit1"" delay=""136""/>
n	t	t	t<enemy name=""unit1"" delay=""137""/>
n	t	t	t<enemy name=""unit1"" delay=""138""/>
n	t	t	t<enemy name=""unit1"" delay=""139""/>
n	t	t	t<enemy name=""unit2"" delay=""140""/>
n	t	t	t<enemy name=""unit1"" delay=""141""/>
n	t	t	t<enemy name=""unit1"" delay=""142""/>
n	t	t	t<enemy name=""unit1"" delay=""143""/>
n	t	t	t<enemy name=""unit1"" delay=""144""/>
n	t	t	t<enemy name=""unit1"" delay=""145""/>
n	t	t	t<enemy name=""unit1"" delay=""146""/>
n	t	t	t<enemy name=""unit1"" delay=""147""/>
n	t	t	t<enemy name=""unit1"" delay=""148""/>
n	t	t	t<enemy name=""unit1"" delay=""149""/>
n	t	t	t
n	t	t	t<enemy name=""parashut"" delay=""50""/>
n	t	t	t<enemy name=""parashut"" delay=""52""/>
n	t	t	t<enemy name=""parashut"" delay=""54""/>
n	t	t	t<enemy name=""parashut"" delay=""56""/>
n	t	t	t<enemy name=""parashut"" delay=""58""/>
n	t	t	t<enemy name=""parashut"" delay=""60""/>
n	t	t	t<enemy name=""parashut"" delay=""62""/>
n	t	t	t<enemy name=""parashut"" delay=""64""/>
n	t	t	t<enemy name=""parashut"" delay=""66""/>
n	t	t	t<enemy name=""parashut"" delay=""68""/>
n	t	t	t<enemy name=""parashut"" delay=""70""/>
n	t	t	t<enemy name=""parashut"" delay=""72""/>
n	t	t	t<enemy name=""parashut"" delay=""74""/>
n	t	t	t<enemy name=""parashut"" delay=""76""/>
n	t	t	t<enemy name=""parashut"" delay=""78""/>
n	t	t	t<enemy name=""parashut"" delay=""80""/>
n	t	t	t<enemy name=""parashut"" delay=""82""/>
n	t	t	t<enemy name=""parashut"" delay=""84""/>
n	t	t	t<enemy name=""parashut"" delay=""86""/>
n	t	t	t<enemy name=""parashut"" delay=""90""/>
n	t	t	t<enemy name=""parashut"" delay=""92""/>
n	t	t	t<enemy name=""parashut"" delay=""94""/>
n	t	t	t<enemy name=""parashut"" delay=""96""/>
n	t	t	t<enemy name=""parashut"" delay=""98""/>
n	t	t	t<enemy name=""parashut"" delay=""100""/>
n	t	t	t<enemy name=""parashut"" delay=""102""/>
n	t	t	t<enemy name=""parashut"" delay=""104""/>
n	t	t	t<enemy name=""parashut"" delay=""106""/>
n	t	t	t<enemy name=""parashut"" delay=""108""/>
n	t	t	t<enemy name=""parashut"" delay=""110""/>
n	t	t	t<enemy name=""parashut"" delay=""112""/>
n	t	t	t<enemy name=""parashut"" delay=""114""/>
n	t	t	t<enemy name=""parashut"" delay=""116""/>
n	t	t	t<enemy name=""parashut"" delay=""118""/>
n	t	t	t<enemy name=""parashut"" delay=""120""/>
n	t	t	t<enemy name=""parashut"" delay=""121""/>
n	t	t	t<enemy name=""parashut"" delay=""122""/>
n	t	t	t<enemy name=""parashut"" delay=""123""/>
n	t	t	t<enemy name=""parashut"" delay=""124""/>
n	t	t	t<enemy name=""parashut"" delay=""125""/>
n	t	t	t<enemy name=""parashut"" delay=""126""/>
n	t	t	t<enemy name=""parashut"" delay=""127""/>
n	t	t	t<enemy name=""parashut"" delay=""128""/>
n	t	t	t<enemy name=""parashut"" delay=""129""/>
n	t	t	t<enemy name=""parashut"" delay=""130""/>
n	t	t	t<enemy name=""parashut"" delay=""131""/>
n	t	t	t<enemy name=""parashut"" delay=""132""/>
n	t	t	t<enemy name=""parashut"" delay=""133""/>
n	t	t	t<enemy name=""parashut"" delay=""134""/>
n	t	t	t<enemy name=""parashut"" delay=""135""/>
n	t	t	t<enemy name=""parashut"" delay=""136""/>
n	t	t	t<enemy name=""parashut"" delay=""137""/>
n	t	t	t<enemy name=""parashut"" delay=""138""/>
n	t	t	t<enemy name=""parashut"" delay=""139""/>
n	t	t	t<enemy name=""parashut"" delay=""140""/>
n	t	t	t<enemy name=""parashut"" delay=""141""/>
n	t	t	t<enemy name=""parashut"" delay=""142""/>
n	t	t	t<enemy name=""parashut"" delay=""143""/>
n	t	t	t<enemy name=""parashut"" delay=""144""/>
n	t	t	t<enemy name=""parashut"" delay=""145""/>
n	t	t	t<enemy name=""parashut"" delay=""146""/>
n	t	t	t<enemy name=""parashut"" delay=""147""/>
n	t	t	t
n	t	t	t<enemy name=""balloon"" delay=""50""/>
n	t	t	t<enemy name=""aerostat"" delay=""55""/>
n	t	t	t<enemy name=""aerostat"" delay=""60""/>
n	t	t	t<enemy name=""aerostat"" delay=""65""/>
n	t	t	t<enemy name=""aerostat"" delay=""70""/>
n	t	t	t<enemy name=""heli"" delay=""75""/>
n	t	t	t<enemy name=""heli"" delay=""80""/>
n	t	t	t<enemy name=""heli"" delay=""85""/>
n	t	t	t<enemy name=""heli"" delay=""90""/>
n	t	t	t<enemy name=""heli"" delay=""100""/>
n	t	t	t<enemy name=""heli"" delay=""105""/>
n	t	t	t<enemy name=""heli"" delay=""118""/>
n	t	t	t<enemy name=""heli"" delay=""122""/>
n	t	t	t<enemy name=""heli"" delay=""126""/>
n	t	t	t<enemy name=""heli"" delay=""130""/>
n	t	t	t<enemy name=""heli"" delay=""133""/>
n	t	t	t<enemy name=""heli"" delay=""136""/>
n	t	t	t<enemy name=""heli"" delay=""139""/>
n	t	t	t<enemy name=""heli"" delay=""141""/>
n	t	t	t<enemy name=""heli"" delay=""144""/>
n	t	t	t<enemy name=""heli"" delay=""147""/>
n	t	t	t
n	t	t	t<enemy name=""wheel"" delay=""55""/>
n	t	t	t<enemy name=""wheel"" delay=""65""/>
n	t	t	t<enemy name=""wheel"" delay=""75""/>
n	t	t	t<enemy name=""wheel"" delay=""85""/>
n	t	t	t<enemy name=""wheel"" delay=""95""/>
n	t	t	t<enemy name=""wheel"" delay=""115""/>
n	t	t	t<enemy name=""wheel"" delay=""125""/>
n	t	t	t<enemy name=""wheel"" delay=""135""/>
n	t	t	t<enemy name=""wheel"" delay=""145""/>
n	t	t	t
n	t	t	t<enemy name=""tank3"" delay=""50""/>
n	t	t	t<enemy name=""car"" delay=""60""/>
n	t	t	t<enemy name=""tank1"" delay=""70""/>
n	t	t	t<enemy name=""tank2"" delay=""80""/>
n	t	t	t<enemy name=""walker1"" delay=""90""/>
n	t	t	t<enemy name=""walker1"" delay=""100""/>
n	t	t	t<enemy name=""tank3"" delay=""110""/>
n	t	t	t<enemy name=""walker1"" delay=""120""/>
n	t	t	t<enemy name=""walker1"" delay=""130""/>
n	t	t	t<enemy name=""walker2"" delay=""145""/>
n	t	t	t<enemy name=""airship"" delay=""155""/>
n	t	t	t
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""200"" side=""right"" img=""1"">
n	t	t	t<enemy name=""walker2"" delay=""1""/>
n	t	t	t
n	t	t	t<enemy name=""walker1"" delay=""18""/>
n	t	t	t
n	t	t	t<enemy name=""tank2"" delay=""25""/>
n	t	t	t
n	t	t	t<enemy name=""car"" delay=""35""/>
n	t	t	t
n	t	t	t<enemy name=""unit1"" delay=""42""/>
n	t	t	t
n	t	t	t<enemy name=""unit1"" delay=""51""/>
n	t	t	t<enemy name=""unit1"" delay=""52""/>
n	t	t	t<enemy name=""unit2"" delay=""53""/>
n	t	t	t<enemy name=""unit1"" delay=""54""/>
n	t	t	t<enemy name=""unit1"" delay=""55""/>
n	t	t	t<enemy name=""unit2"" delay=""57""/>
n	t	t	t<enemy name=""unit1"" delay=""58""/>
n	t	t	t<enemy name=""unit1"" delay=""59""/>
n	t	t	t<enemy name=""unit2"" delay=""60""/>
n	t	t	t<enemy name=""unit1"" delay=""61""/>
n	t	t	t<enemy name=""unit1"" delay=""63""/>
n	t	t	t<enemy name=""unit2"" delay=""64""/>
n	t	t	t<enemy name=""unit1"" delay=""65""/>
n	t	t	t<enemy name=""unit1"" delay=""66""/>
n	t	t	t<enemy name=""unit2"" delay=""67""/>
n	t	t	t<enemy name=""unit1"" delay=""68""/>
n	t	t	t<enemy name=""unit1"" delay=""69""/>
n	t	t	t<enemy name=""unit2"" delay=""70""/>
n	t	t	t<enemy name=""unit1"" delay=""51""/>
n	t	t	t<enemy name=""unit1"" delay=""52""/>
n	t	t	t<enemy name=""unit2"" delay=""53""/>
n	t	t	t<enemy name=""unit1"" delay=""54""/>
n	t	t	t<enemy name=""unit1"" delay=""55""/>
n	t	t	t<enemy name=""unit2"" delay=""57""/>
n	t	t	t<enemy name=""unit1"" delay=""58""/>
n	t	t	t<enemy name=""unit1"" delay=""59""/>
n	t	t	t<enemy name=""unit2"" delay=""60""/>
n	t	t	t<enemy name=""unit1"" delay=""61""/>
n	t	t	t<enemy name=""unit1"" delay=""63""/>
n	t	t	t<enemy name=""unit2"" delay=""64""/>
n	t	t	t<enemy name=""unit1"" delay=""65""/>
n	t	t	t<enemy name=""unit1"" delay=""66""/>
n	t	t	t<enemy name=""unit2"" delay=""67""/>
n	t	t	t<enemy name=""unit1"" delay=""68""/>
n	t	t	t<enemy name=""unit1"" delay=""69""/>
n	t	t	t<enemy name=""unit2"" delay=""70""/>
n	t	t	t<enemy name=""unit1"" delay=""72""/>
n	t	t	t<enemy name=""unit1"" delay=""73""/>
n	t	t	t<enemy name=""unit1"" delay=""74""/>
n	t	t	t<enemy name=""unit1"" delay=""75""/>
n	t	t	t<enemy name=""unit1"" delay=""76""/>
n	t	t	t<enemy name=""unit1"" delay=""77""/>
n	t	t	t<enemy name=""unit1"" delay=""78""/>
n	t	t	t<enemy name=""unit1"" delay=""79""/>
n	t	t	t<enemy name=""unit2"" delay=""80""/>
n	t	t	t<enemy name=""unit1"" delay=""82""/>
n	t	t	t<enemy name=""unit1"" delay=""83""/>
n	t	t	t<enemy name=""unit1"" delay=""84""/>
n	t	t	t<enemy name=""unit1"" delay=""85""/>
n	t	t	t<enemy name=""unit1"" delay=""86""/>
n	t	t	t<enemy name=""unit1"" delay=""87""/>
n	t	t	t<enemy name=""unit1"" delay=""88""/>
n	t	t	t<enemy name=""unit1"" delay=""89""/>
n	t	t	t<enemy name=""unit2"" delay=""90""/>
n	t	t	t<enemy name=""unit1"" delay=""92""/>
n	t	t	t<enemy name=""unit1"" delay=""93""/>
n	t	t	t<enemy name=""unit1"" delay=""94""/>
n	t	t	t<enemy name=""unit1"" delay=""95""/>
n	t	t	t<enemy name=""unit1"" delay=""96""/>
n	t	t	t<enemy name=""unit1"" delay=""97""/>
n	t	t	t<enemy name=""unit1"" delay=""98""/>
n	t	t	t<enemy name=""unit1"" delay=""99""/>
n	t	t	t<enemy name=""unit1"" delay=""101""/>
n	t	t	t<enemy name=""unit1"" delay=""102""/>
n	t	t	t<enemy name=""unit1"" delay=""103""/>
n	t	t	t<enemy name=""unit1"" delay=""104""/>
n	t	t	t<enemy name=""unit1"" delay=""105""/>
n	t	t	t<enemy name=""unit1"" delay=""106""/>
n	t	t	t<enemy name=""unit1"" delay=""107""/>
n	t	t	t<enemy name=""unit1"" delay=""108""/>
n	t	t	t<enemy name=""unit1"" delay=""109""/>
n	t	t	t<enemy name=""unit1"" delay=""111""/>
n	t	t	t<enemy name=""unit1"" delay=""112""/>
n	t	t	t<enemy name=""unit1"" delay=""113""/>
n	t	t	t<enemy name=""unit1"" delay=""114""/>
n	t	t	t<enemy name=""unit1"" delay=""115""/>
n	t	t	t<enemy name=""unit1"" delay=""116""/>
n	t	t	t<enemy name=""unit1"" delay=""117""/>
n	t	t	t<enemy name=""unit1"" delay=""118""/>
n	t	t	t<enemy name=""unit1"" delay=""119""/>
n  	t	t    <enemy name=""unit1"" delay=""121""/>
n	t	t	t<enemy name=""unit1"" delay=""122""/>
n	t	t	t<enemy name=""unit1"" delay=""123""/>
n	t	t	t<enemy name=""unit1"" delay=""124""/>
n	t	t	t<enemy name=""unit1"" delay=""125""/>
n	t	t	t<enemy name=""unit1"" delay=""126""/>
n	t	t	t<enemy name=""unit1"" delay=""127""/>
n	t	t	t<enemy name=""unit1"" delay=""128""/>
n	t	t	t<enemy name=""unit1"" delay=""129""/>
n	t	t	t<enemy name=""unit2"" delay=""130""/>
n	t	t	t<enemy name=""unit1"" delay=""131""/>
n	t	t	t<enemy name=""unit1"" delay=""132""/>
n	t	t	t<enemy name=""unit1"" delay=""133""/>
n	t	t	t<enemy name=""unit1"" delay=""134""/>
n	t	t	t<enemy name=""unit1"" delay=""135""/>
n	t	t	t<enemy name=""unit1"" delay=""136""/>
n	t	t	t<enemy name=""unit1"" delay=""137""/>
n	t	t	t<enemy name=""unit1"" delay=""138""/>
n	t	t	t<enemy name=""unit1"" delay=""139""/>
n	t	t	t<enemy name=""unit2"" delay=""140""/>
n	t	t	t<enemy name=""unit1"" delay=""141""/>
n	t	t	t<enemy name=""unit1"" delay=""142""/>
n	t	t	t<enemy name=""unit1"" delay=""143""/>
n	t	t	t<enemy name=""unit1"" delay=""144""/>
n	t	t	t<enemy name=""unit1"" delay=""145""/>
n	t	t	t<enemy name=""unit1"" delay=""146""/>
n	t	t	t<enemy name=""unit1"" delay=""147""/>
n	t	t	t<enemy name=""unit1"" delay=""148""/>
n	t	t	t<enemy name=""unit1"" delay=""149""/>
n	t	t	t
n	t	t	t<enemy name=""parashut"" delay=""50""/>
n	t	t	t<enemy name=""parashut"" delay=""52""/>
n	t	t	t<enemy name=""parashut"" delay=""54""/>
n	t	t	t<enemy name=""parashut"" delay=""56""/>
n	t	t	t<enemy name=""parashut"" delay=""58""/>
n	t	t	t<enemy name=""parashut"" delay=""60""/>
n	t	t	t<enemy name=""parashut"" delay=""62""/>
n	t	t	t<enemy name=""parashut"" delay=""64""/>
n	t	t	t<enemy name=""parashut"" delay=""66""/>
n	t	t	t<enemy name=""parashut"" delay=""68""/>
n	t	t	t<enemy name=""parashut"" delay=""70""/>
n	t	t	t<enemy name=""parashut"" delay=""72""/>
n	t	t	t<enemy name=""parashut"" delay=""74""/>
n	t	t	t<enemy name=""parashut"" delay=""76""/>
n	t	t	t<enemy name=""parashut"" delay=""78""/>
n	t	t	t<enemy name=""parashut"" delay=""80""/>
n	t	t	t<enemy name=""parashut"" delay=""82""/>
n	t	t	t<enemy name=""parashut"" delay=""84""/>
n	t	t	t<enemy name=""parashut"" delay=""86""/>
n	t	t	t<enemy name=""parashut"" delay=""90""/>
n	t	t	t<enemy name=""parashut"" delay=""92""/>
n	t	t	t<enemy name=""parashut"" delay=""94""/>
n	t	t	t<enemy name=""parashut"" delay=""96""/>
n	t	t	t<enemy name=""parashut"" delay=""98""/>
n	t	t	t<enemy name=""parashut"" delay=""100""/>
n	t	t	t<enemy name=""parashut"" delay=""102""/>
n	t	t	t<enemy name=""parashut"" delay=""104""/>
n	t	t	t<enemy name=""parashut"" delay=""106""/>
n	t	t	t<enemy name=""parashut"" delay=""108""/>
n	t	t	t<enemy name=""parashut"" delay=""110""/>
n	t	t	t<enemy name=""parashut"" delay=""112""/>
n	t	t	t<enemy name=""parashut"" delay=""114""/>
n	t	t	t<enemy name=""parashut"" delay=""116""/>
n	t	t	t<enemy name=""parashut"" delay=""118""/>
n	t	t	t<enemy name=""parashut"" delay=""120""/>
n	t	t	t<enemy name=""parashut"" delay=""121""/>
n	t	t	t<enemy name=""parashut"" delay=""122""/>
n	t	t	t<enemy name=""parashut"" delay=""123""/>
n	t	t	t<enemy name=""parashut"" delay=""124""/>
n	t	t	t<enemy name=""parashut"" delay=""125""/>
n	t	t	t<enemy name=""parashut"" delay=""126""/>
n	t	t	t<enemy name=""parashut"" delay=""127""/>
n	t	t	t<enemy name=""parashut"" delay=""128""/>
n	t	t	t<enemy name=""parashut"" delay=""129""/>
n	t	t	t<enemy name=""parashut"" delay=""130""/>
n	t	t	t<enemy name=""parashut"" delay=""131""/>
n	t	t	t<enemy name=""parashut"" delay=""132""/>
n	t	t	t<enemy name=""parashut"" delay=""133""/>
n	t	t	t<enemy name=""parashut"" delay=""134""/>
n	t	t	t<enemy name=""parashut"" delay=""135""/>
n	t	t	t<enemy name=""parashut"" delay=""136""/>
n	t	t	t<enemy name=""parashut"" delay=""137""/>
n	t	t	t<enemy name=""parashut"" delay=""138""/>
n	t	t	t<enemy name=""parashut"" delay=""139""/>
n	t	t	t<enemy name=""parashut"" delay=""140""/>
n	t	t	t<enemy name=""parashut"" delay=""141""/>
n	t	t	t<enemy name=""parashut"" delay=""142""/>
n	t	t	t<enemy name=""parashut"" delay=""143""/>
n	t	t	t<enemy name=""parashut"" delay=""144""/>
n	t	t	t<enemy name=""parashut"" delay=""145""/>
n	t	t	t<enemy name=""parashut"" delay=""146""/>
n	t	t	t<enemy name=""parashut"" delay=""147""/>
n	t	t	t
n	t	t	t<enemy name=""balloon"" delay=""50""/>
n	t	t	t<enemy name=""aerostat"" delay=""55""/>
n	t	t	t<enemy name=""aerostat"" delay=""60""/>
n	t	t	t<enemy name=""aerostat"" delay=""65""/>
n	t	t	t<enemy name=""aerostat"" delay=""70""/>
n	t	t	t<enemy name=""heli"" delay=""75""/>
n	t	t	t<enemy name=""heli"" delay=""80""/>
n	t	t	t<enemy name=""heli"" delay=""85""/>
n	t	t	t<enemy name=""heli"" delay=""90""/>
n	t	t	t<enemy name=""heli"" delay=""114""/>
n	t	t	t<enemy name=""heli"" delay=""118""/>
n	t	t	t<enemy name=""heli"" delay=""122""/>
n	t	t	t<enemy name=""heli"" delay=""126""/>
n	t	t	t<enemy name=""heli"" delay=""130""/>
n	t	t	t<enemy name=""heli"" delay=""133""/>
n	t	t	t<enemy name=""heli"" delay=""136""/>
n	t	t	t<enemy name=""heli"" delay=""139""/>
n	t	t	t<enemy name=""heli"" delay=""141""/>
n	t	t	t<enemy name=""heli"" delay=""144""/>
n	t	t	t<enemy name=""heli"" delay=""147""/>
n	t	t	t
n	t	t	t<enemy name=""wheel"" delay=""55""/>
n	t	t	t<enemy name=""wheel"" delay=""65""/>
n	t	t	t<enemy name=""wheel"" delay=""75""/>
n	t	t	t<enemy name=""wheel"" delay=""85""/>
n	t	t	t<enemy name=""wheel"" delay=""95""/>
n	t	t	t<enemy name=""wheel"" delay=""115""/>
n	t	t	t<enemy name=""wheel"" delay=""125""/>
n	t	t	t<enemy name=""wheel"" delay=""135""/>
n	t	t	t<enemy name=""wheel"" delay=""145""/>
n	t	t	t
n	t	t	t<enemy name=""tanket"" delay=""50""/>
n	t	t	t<enemy name=""car"" delay=""60""/>
n	t	t	t<enemy name=""walker2"" delay=""60""/>
n	t	t	t<enemy name=""tank2"" delay=""80""/>
n	t	t	t<enemy name=""tank2"" delay=""90""/>
n	t	t	t<enemy name=""tank3"" delay=""100""/>
n	t	t	t<enemy name=""walker1"" delay=""110""/>
n	t	t	t<enemy name=""walker2"" delay=""120""/>
n	t	t	t<enemy name=""walker1"" delay=""130""/>
n	t	t	t<enemy name=""walker2"" delay=""145""/>
n	t	t	t<enemy name=""airship"" delay=""155""/>
n	t	t</wave>
n	t</group>
n</level>")("<level eye="normal" money="8000" maxTower="5" maxUpgrade="5" bg="5" upgradeTwo="true" threeStarHealth="80" twiStarHealth="60" preStartMoney="3200">
	<!-- 
	Пушки
	столбец - 0 лев, 1 центр, 2 прав
	строка -  0 подвал, 1 первый, 2 второй, ...
	индексы апгрейдов 
	1 - upgr2, 
	2 - upgr3_1, 
	3 - upgr4_1, 
	4 - upgr3_2, 
	5 - upgr4_2
	
	значения для глаза(eye)  off, normal, always
	-->
	
	<settings towerLevel="5" towerHealth="50" globalUpgrades="4" maxCannons="10" machinegun="true" heavygun="false" lightning="true" saws="true" score="56000">
	    <!--
		<cannon name="lightning" upgr="5" col="2" row="2"/>
		<cannon name="lightning" upgr="5" col="0" row="2"/>
		-->
		<cannon name="machinegun" upgr="3" col="2" row="4"/>
		<cannon name="machinegun" upgr="3" col="0" row="4"/>
		<cannon name="machinegun" upgr="3" col="2" row="2"/>
		<cannon name="machinegun" upgr="3" col="0" row="2"/>
		
		<cannon name="saws" upgr="5" col="2" row="1"/>
		<cannon name="saws" upgr="5" col="0" row="1"/>
		<cannon name="saws" upgr="5" col="2" row="3"/>
		<cannon name="saws" upgr="5" col="0" row="3"/>
	</settings>
	<group pause="0">
		<wave pause="0" lifeTime="200" side="left" img="1">
			<enemy name="walker2" delay="1"/>
			
			<enemy name="walker1" delay="18"/>
			
			<enemy name="tank2" delay="25"/>
			
			<enemy name="car" delay="35"/>
			
			<enemy name="unit1" delay="42"/>
			
			<enemy name="unit1" delay="51"/>
			<enemy name="unit1" delay="52"/>
			<enemy name="unit2" delay="53"/>
			<enemy name="unit1" delay="54"/>
			<enemy name="unit1" delay="55"/>
			<enemy name="unit2" delay="57"/>
			<enemy name="unit1" delay="58"/>
			<enemy name="unit1" delay="59"/>
			<enemy name="unit2" delay="60"/>
			<enemy name="unit1" delay="61"/>
			<enemy name="unit1" delay="63"/>
			<enemy name="unit2" delay="64"/>
			<enemy name="unit1" delay="65"/>
			<enemy name="unit1" delay="66"/>
			<enemy name="unit2" delay="67"/>
			<enemy name="unit1" delay="68"/>
			<enemy name="unit1" delay="69"/>
			<enemy name="unit2" delay="70"/>
			<enemy name="unit1" delay="51"/>
			<enemy name="unit1" delay="52"/>
			<enemy name="unit2" delay="53"/>
			<enemy name="unit1" delay="54"/>
			<enemy name="unit1" delay="55"/>
			<enemy name="unit2" delay="57"/>
			<enemy name="unit1" delay="58"/>
			<enemy name="unit1" delay="59"/>
			<enemy name="unit2" delay="60"/>
			<enemy name="unit1" delay="61"/>
			<enemy name="unit1" delay="63"/>
			<enemy name="unit2" delay="64"/>
			<enemy name="unit1" delay="65"/>
			<enemy name="unit1" delay="66"/>
			<enemy name="unit2" delay="67"/>
			<enemy name="unit1" delay="68"/>
			<enemy name="unit1" delay="69"/>
			<enemy name="unit2" delay="70"/>
			<enemy name="unit1" delay="72"/>
			<enemy name="unit1" delay="73"/>
			<enemy name="unit1" delay="74"/>
			<enemy name="unit1" delay="75"/>
			<enemy name="unit1" delay="76"/>
			<enemy name="unit1" delay="77"/>
			<enemy name="unit1" delay="78"/>
			<enemy name="unit1" delay="79"/>
			<enemy name="unit2" delay="80"/>
			<enemy name="unit1" delay="82"/>
			<enemy name="unit1" delay="83"/>
			<enemy name="unit1" delay="84"/>
			<enemy name="unit1" delay="85"/>
			<enemy name="unit1" delay="86"/>
			<enemy name="unit1" delay="87"/>
			<enemy name="unit1" delay="88"/>
			<enemy name="unit1" delay="89"/>
			<enemy name="unit2" delay="90"/>
			<enemy name="unit1" delay="92"/>
			<enemy name="unit1" delay="93"/>
			<enemy name="unit1" delay="94"/>
			<enemy name="unit1" delay="95"/>
			<enemy name="unit1" delay="96"/>
			<enemy name="unit1" delay="97"/>
			<enemy name="unit1" delay="98"/>
			<enemy name="unit1" delay="99"/>
			<enemy name="unit1" delay="101"/>
			<enemy name="unit1" delay="102"/>
			<enemy name="unit1" delay="103"/>
			<enemy name="unit1" delay="104"/>
			<enemy name="unit1" delay="105"/>
			<enemy name="unit1" delay="106"/>
			<enemy name="unit1" delay="107"/>
			<enemy name="unit1" delay="108"/>
			<enemy name="unit1" delay="109"/>
			<enemy name="unit1" delay="111"/>
			<enemy name="unit1" delay="112"/>
			<enemy name="unit1" delay="113"/>
			<enemy name="unit1" delay="114"/>
			<enemy name="unit1" delay="115"/>
			<enemy name="unit1" delay="116"/>
			<enemy name="unit1" delay="117"/>
			<enemy name="unit1" delay="118"/>
			<enemy name="unit1" delay="119"/>
		    <enemy name="unit1" delay="121"/>
			<enemy name="unit1" delay="122"/>
			<enemy name="unit1" delay="123"/>
			<enemy name="unit1" delay="124"/>
			<enemy name="unit1" delay="125"/>
			<enemy name="unit1" delay="126"/>
			<enemy name="unit1" delay="127"/>
			<enemy name="unit1" delay="128"/>
			<enemy name="unit1" delay="129"/>
			<enemy name="unit2" delay="130"/>
			<enemy name="unit1" delay="131"/>
			<enemy name="unit1" delay="132"/>
			<enemy name="unit1" delay="133"/>
			<enemy name="unit1" delay="134"/>
			<enemy name="unit1" delay="135"/>
			<enemy name="unit1" delay="136"/>
			<enemy name="unit1" delay="137"/>
			<enemy name="unit1" delay="138"/>
			<enemy name="unit1" delay="139"/>
			<enemy name="unit2" delay="140"/>
			<enemy name="unit1" delay="141"/>
			<enemy name="unit1" delay="142"/>
			<enemy name="unit1" delay="143"/>
			<enemy name="unit1" delay="144"/>
			<enemy name="unit1" delay="145"/>
			<enemy name="unit1" delay="146"/>
			<enemy name="unit1" delay="147"/>
			<enemy name="unit1" delay="148"/>
			<enemy name="unit1" delay="149"/>
			
			<enemy name="parashut" delay="50"/>
			<enemy name="parashut" delay="52"/>
			<enemy name="parashut" delay="54"/>
			<enemy name="parashut" delay="56"/>
			<enemy name="parashut" delay="58"/>
			<enemy name="parashut" delay="60"/>
			<enemy name="parashut" delay="62"/>
			<enemy name="parashut" delay="64"/>
			<enemy name="parashut" delay="66"/>
			<enemy name="parashut" delay="68"/>
			<enemy name="parashut" delay="70"/>
			<enemy name="parashut" delay="72"/>
			<enemy name="parashut" delay="74"/>
			<enemy name="parashut" delay="76"/>
			<enemy name="parashut" delay="78"/>
			<enemy name="parashut" delay="80"/>
			<enemy name="parashut" delay="82"/>
			<enemy name="parashut" delay="84"/>
			<enemy name="parashut" delay="86"/>
			<enemy name="parashut" delay="90"/>
			<enemy name="parashut" delay="92"/>
			<enemy name="parashut" delay="94"/>
			<enemy name="parashut" delay="96"/>
			<enemy name="parashut" delay="98"/>
			<enemy name="parashut" delay="100"/>
			<enemy name="parashut" delay="102"/>
			<enemy name="parashut" delay="104"/>
			<enemy name="parashut" delay="106"/>
			<enemy name="parashut" delay="108"/>
			<enemy name="parashut" delay="110"/>
			<enemy name="parashut" delay="112"/>
			<enemy name="parashut" delay="114"/>
			<enemy name="parashut" delay="116"/>
			<enemy name="parashut" delay="118"/>
			<enemy name="parashut" delay="120"/>
			<enemy name="parashut" delay="121"/>
			<enemy name="parashut" delay="122"/>
			<enemy name="parashut" delay="123"/>
			<enemy name="parashut" delay="124"/>
			<enemy name="parashut" delay="125"/>
			<enemy name="parashut" delay="126"/>
			<enemy name="parashut" delay="127"/>
			<enemy name="parashut" delay="128"/>
			<enemy name="parashut" delay="129"/>
			<enemy name="parashut" delay="130"/>
			<enemy name="parashut" delay="131"/>
			<enemy name="parashut" delay="132"/>
			<enemy name="parashut" delay="133"/>
			<enemy name="parashut" delay="134"/>
			<enemy name="parashut" delay="135"/>
			<enemy name="parashut" delay="136"/>
			<enemy name="parashut" delay="137"/>
			<enemy name="parashut" delay="138"/>
			<enemy name="parashut" delay="139"/>
			<enemy name="parashut" delay="140"/>
			<enemy name="parashut" delay="141"/>
			<enemy name="parashut" delay="142"/>
			<enemy name="parashut" delay="143"/>
			<enemy name="parashut" delay="144"/>
			<enemy name="parashut" delay="145"/>
			<enemy name="parashut" delay="146"/>
			<enemy name="parashut" delay="147"/>
			
			<enemy name="balloon" delay="50"/>
			<enemy name="aerostat" delay="55"/>
			<enemy name="aerostat" delay="60"/>
			<enemy name="aerostat" delay="65"/>
			<enemy name="aerostat" delay="70"/>
			<enemy name="heli" delay="75"/>
			<enemy name="heli" delay="80"/>
			<enemy name="heli" delay="85"/>
			<enemy name="heli" delay="90"/>
			<enemy name="heli" delay="100"/>
			<enemy name="heli" delay="105"/>
			<enemy name="heli" delay="118"/>
			<enemy name="heli" delay="122"/>
			<enemy name="heli" delay="126"/>
			<enemy name="heli" delay="130"/>
			<enemy name="heli" delay="133"/>
			<enemy name="heli" delay="136"/>
			<enemy name="heli" delay="139"/>
			<enemy name="heli" delay="141"/>
			<enemy name="heli" delay="144"/>
			<enemy name="heli" delay="147"/>
			
			<enemy name="wheel" delay="55"/>
			<enemy name="wheel" delay="65"/>
			<enemy name="wheel" delay="75"/>
			<enemy name="wheel" delay="85"/>
			<enemy name="wheel" delay="95"/>
			<enemy name="wheel" delay="115"/>
			<enemy name="wheel" delay="125"/>
			<enemy name="wheel" delay="135"/>
			<enemy name="wheel" delay="145"/>
			
			<enemy name="tank3" delay="50"/>
			<enemy name="car" delay="60"/>
			<enemy name="tank1" delay="70"/>
			<enemy name="tank2" delay="80"/>
			<enemy name="walker1" delay="90"/>
			<enemy name="walker1" delay="100"/>
			<enemy name="tank3" delay="110"/>
			<enemy name="walker1" delay="120"/>
			<enemy name="walker1" delay="130"/>
			<enemy name="walker2" delay="145"/>
			<enemy name="airship" delay="155"/>
			
		</wave>
		<wave pause="0" lifeTime="200" side="right" img="1">
			<enemy name="walker2" delay="1"/>
			
			<enemy name="walker1" delay="18"/>
			
			<enemy name="tank2" delay="25"/>
			
			<enemy name="car" delay="35"/>
			
			<enemy name="unit1" delay="42"/>
			
			<enemy name="unit1" delay="51"/>
			<enemy name="unit1" delay="52"/>
			<enemy name="unit2" delay="53"/>
			<enemy name="unit1" delay="54"/>
			<enemy name="unit1" delay="55"/>
			<enemy name="unit2" delay="57"/>
			<enemy name="unit1" delay="58"/>
			<enemy name="unit1" delay="59"/>
			<enemy name="unit2" delay="60"/>
			<enemy name="unit1" delay="61"/>
			<enemy name="unit1" delay="63"/>
			<enemy name="unit2" delay="64"/>
			<enemy name="unit1" delay="65"/>
			<enemy name="unit1" delay="66"/>
			<enemy name="unit2" delay="67"/>
			<enemy name="unit1" delay="68"/>
			<enemy name="unit1" delay="69"/>
			<enemy name="unit2" delay="70"/>
			<enemy name="unit1" delay="51"/>
			<enemy name="unit1" delay="52"/>
			<enemy name="unit2" delay="53"/>
			<enemy name="unit1" delay="54"/>
			<enemy name="unit1" delay="55"/>
			<enemy name="unit2" delay="57"/>
			<enemy name="unit1" delay="58"/>
			<enemy name="unit1" delay="59"/>
			<enemy name="unit2" delay="60"/>
			<enemy name="unit1" delay="61"/>
			<enemy name="unit1" delay="63"/>
			<enemy name="unit2" delay="64"/>
			<enemy name="unit1" delay="65"/>
			<enemy name="unit1" delay="66"/>
			<enemy name="unit2" delay="67"/>
			<enemy name="unit1" delay="68"/>
			<enemy name="unit1" delay="69"/>
			<enemy name="unit2" delay="70"/>
			<enemy name="unit1" delay="72"/>
			<enemy name="unit1" delay="73"/>
			<enemy name="unit1" delay="74"/>
			<enemy name="unit1" delay="75"/>
			<enemy name="unit1" delay="76"/>
			<enemy name="unit1" delay="77"/>
			<enemy name="unit1" delay="78"/>
			<enemy name="unit1" delay="79"/>
			<enemy name="unit2" delay="80"/>
			<enemy name="unit1" delay="82"/>
			<enemy name="unit1" delay="83"/>
			<enemy name="unit1" delay="84"/>
			<enemy name="unit1" delay="85"/>
			<enemy name="unit1" delay="86"/>
			<enemy name="unit1" delay="87"/>
			<enemy name="unit1" delay="88"/>
			<enemy name="unit1" delay="89"/>
			<enemy name="unit2" delay="90"/>
			<enemy name="unit1" delay="92"/>
			<enemy name="unit1" delay="93"/>
			<enemy name="unit1" delay="94"/>
			<enemy name="unit1" delay="95"/>
			<enemy name="unit1" delay="96"/>
			<enemy name="unit1" delay="97"/>
			<enemy name="unit1" delay="98"/>
			<enemy name="unit1" delay="99"/>
			<enemy name="unit1" delay="101"/>
			<enemy name="unit1" delay="102"/>
			<enemy name="unit1" delay="103"/>
			<enemy name="unit1" delay="104"/>
			<enemy name="unit1" delay="105"/>
			<enemy name="unit1" delay="106"/>
			<enemy name="unit1" delay="107"/>
			<enemy name="unit1" delay="108"/>
			<enemy name="unit1" delay="109"/>
			<enemy name="unit1" delay="111"/>
			<enemy name="unit1" delay="112"/>
			<enemy name="unit1" delay="113"/>
			<enemy name="unit1" delay="114"/>
			<enemy name="unit1" delay="115"/>
			<enemy name="unit1" delay="116"/>
			<enemy name="unit1" delay="117"/>
			<enemy name="unit1" delay="118"/>
			<enemy name="unit1" delay="119"/>
  		    <enemy name="unit1" delay="121"/>
			<enemy name="unit1" delay="122"/>
			<enemy name="unit1" delay="123"/>
			<enemy name="unit1" delay="124"/>
			<enemy name="unit1" delay="125"/>
			<enemy name="unit1" delay="126"/>
			<enemy name="unit1" delay="127"/>
			<enemy name="unit1" delay="128"/>
			<enemy name="unit1" delay="129"/>
			<enemy name="unit2" delay="130"/>
			<enemy name="unit1" delay="131"/>
			<enemy name="unit1" delay="132"/>
			<enemy name="unit1" delay="133"/>
			<enemy name="unit1" delay="134"/>
			<enemy name="unit1" delay="135"/>
			<enemy name="unit1" delay="136"/>
			<enemy name="unit1" delay="137"/>
			<enemy name="unit1" delay="138"/>
			<enemy name="unit1" delay="139"/>
			<enemy name="unit2" delay="140"/>
			<enemy name="unit1" delay="141"/>
			<enemy name="unit1" delay="142"/>
			<enemy name="unit1" delay="143"/>
			<enemy name="unit1" delay="144"/>
			<enemy name="unit1" delay="145"/>
			<enemy name="unit1" delay="146"/>
			<enemy name="unit1" delay="147"/>
			<enemy name="unit1" delay="148"/>
			<enemy name="unit1" delay="149"/>
			
			<enemy name="parashut" delay="50"/>
			<enemy name="parashut" delay="52"/>
			<enemy name="parashut" delay="54"/>
			<enemy name="parashut" delay="56"/>
			<enemy name="parashut" delay="58"/>
			<enemy name="parashut" delay="60"/>
			<enemy name="parashut" delay="62"/>
			<enemy name="parashut" delay="64"/>
			<enemy name="parashut" delay="66"/>
			<enemy name="parashut" delay="68"/>
			<enemy name="parashut" delay="70"/>
			<enemy name="parashut" delay="72"/>
			<enemy name="parashut" delay="74"/>
			<enemy name="parashut" delay="76"/>
			<enemy name="parashut" delay="78"/>
			<enemy name="parashut" delay="80"/>
			<enemy name="parashut" delay="82"/>
			<enemy name="parashut" delay="84"/>
			<enemy name="parashut" delay="86"/>
			<enemy name="parashut" delay="90"/>
			<enemy name="parashut" delay="92"/>
			<enemy name="parashut" delay="94"/>
			<enemy name="parashut" delay="96"/>
			<enemy name="parashut" delay="98"/>
			<enemy name="parashut" delay="100"/>
			<enemy name="parashut" delay="102"/>
			<enemy name="parashut" delay="104"/>
			<enemy name="parashut" delay="106"/>
			<enemy name="parashut" delay="108"/>
			<enemy name="parashut" delay="110"/>
			<enemy name="parashut" delay="112"/>
			<enemy name="parashut" delay="114"/>
			<enemy name="parashut" delay="116"/>
			<enemy name="parashut" delay="118"/>
			<enemy name="parashut" delay="120"/>
			<enemy name="parashut" delay="121"/>
			<enemy name="parashut" delay="122"/>
			<enemy name="parashut" delay="123"/>
			<enemy name="parashut" delay="124"/>
			<enemy name="parashut" delay="125"/>
			<enemy name="parashut" delay="126"/>
			<enemy name="parashut" delay="127"/>
			<enemy name="parashut" delay="128"/>
			<enemy name="parashut" delay="129"/>
			<enemy name="parashut" delay="130"/>
			<enemy name="parashut" delay="131"/>
			<enemy name="parashut" delay="132"/>
			<enemy name="parashut" delay="133"/>
			<enemy name="parashut" delay="134"/>
			<enemy name="parashut" delay="135"/>
			<enemy name="parashut" delay="136"/>
			<enemy name="parashut" delay="137"/>
			<enemy name="parashut" delay="138"/>
			<enemy name="parashut" delay="139"/>
			<enemy name="parashut" delay="140"/>
			<enemy name="parashut" delay="141"/>
			<enemy name="parashut" delay="142"/>
			<enemy name="parashut" delay="143"/>
			<enemy name="parashut" delay="144"/>
			<enemy name="parashut" delay="145"/>
			<enemy name="parashut" delay="146"/>
			<enemy name="parashut" delay="147"/>
			
			<enemy name="balloon" delay="50"/>
			<enemy name="aerostat" delay="55"/>
			<enemy name="aerostat" delay="60"/>
			<enemy name="aerostat" delay="65"/>
			<enemy name="aerostat" delay="70"/>
			<enemy name="heli" delay="75"/>
			<enemy name="heli" delay="80"/>
			<enemy name="heli" delay="85"/>
			<enemy name="heli" delay="90"/>
			<enemy name="heli" delay="114"/>
			<enemy name="heli" delay="118"/>
			<enemy name="heli" delay="122"/>
			<enemy name="heli" delay="126"/>
			<enemy name="heli" delay="130"/>
			<enemy name="heli" delay="133"/>
			<enemy name="heli" delay="136"/>
			<enemy name="heli" delay="139"/>
			<enemy name="heli" delay="141"/>
			<enemy name="heli" delay="144"/>
			<enemy name="heli" delay="147"/>
			
			<enemy name="wheel" delay="55"/>
			<enemy name="wheel" delay="65"/>
			<enemy name="wheel" delay="75"/>
			<enemy name="wheel" delay="85"/>
			<enemy name="wheel" delay="95"/>
			<enemy name="wheel" delay="115"/>
			<enemy name="wheel" delay="125"/>
			<enemy name="wheel" delay="135"/>
			<enemy name="wheel" delay="145"/>
			
			<enemy name="tanket" delay="50"/>
			<enemy name="car" delay="60"/>
			<enemy name="walker2" delay="60"/>
			<enemy name="tank2" delay="80"/>
			<enemy name="tank2" delay="90"/>
			<enemy name="tank3" delay="100"/>
			<enemy name="walker1" delay="110"/>
			<enemy name="walker2" delay="120"/>
			<enemy name="walker1" delay="130"/>
			<enemy name="walker2" delay="145"/>
			<enemy name="airship" delay="155"/>
		</wave>
	</group>
</level>;
            var _loc_31:* = <level eye=""always"" money=""0"" maxTower=""5"" maxUpgrade=""5"" bg=""5"" upgradeTwo=""true"" threeStarHealth=""80"" twiStarHealth=""60"" preStartMoney=""3500"">
n	t
n<!-- 
n	tПушки
n	tстолбец - 0 лев, 1 центр, 2 прав
n	tстрока -  0 подвал, 1 первый, 2 второй, ...
n	tиндексы апгрейдов 
n	t1 - upgr2, 
n	t2 - upgr3_1, 
n	t3 - upgr4_1, 
n	t4 - upgr3_2, 
n	t5 - upgr4_2
n	t
n	tзначения для глаза(eye)  off, normal, always
n	t-->
n	t
n	t<settings towerLevel=""4"" towerHealth=""100"" globalUpgrades=""4"" maxCannons=""8"" machinegun=""false"" heavygun=""false"" lightning=""false"" saws=""false"" score=""58000"">
n	t    <!--
n	t	t
n	t	t-->
n	t	t<cannon name=""lightning"" upgr=""5"" col=""0"" row=""1""/>
n	t	t<cannon name=""lightning"" upgr=""5"" col=""2"" row=""1""/>
n	t	t<cannon name=""heavygun"" upgr=""5"" col=""0"" row=""2""/>
n	t	t<cannon name=""heavygun"" upgr=""5"" col=""2"" row=""2""/>
n	t	t<cannon name=""machinegun"" upgr=""5"" col=""0"" row=""3""/>
n	t	t<cannon name=""machinegun"" upgr=""5"" col=""2"" row=""3""/>
n	t	t<cannon name=""saw"" upgr=""5"" col=""0"" row=""4""/>
n	t	t<cannon name=""saw"" upgr=""5"" col=""2"" row=""4""/>
n	t</settings>
n	t
n	t
n<group pause=""0"">
n	t	t<wave pause=""0"" lifeTime=""400"" side=""left"" img=""1"">
n	t	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""6""/>
n	t	t	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""12""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit1"" delay=""17""/>
n	t	t	t<enemy name=""unit1"" delay=""19""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""12""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit1"" delay=""17""/>
n	t	t	t<enemy name=""unit1"" delay=""19""/>
n	t	t	t<enemy name=""unit1"" delay=""20""/>
n	t	t	t<enemy name=""unit1"" delay=""21""/>
n	t	t	t<enemy name=""unit1"" delay=""22""/>
n	t	t	t<enemy name=""unit1"" delay=""23""/>
n	t	t	t<enemy name=""unit1"" delay=""24""/>
n	t	t	t<enemy name=""unit1"" delay=""25""/>
n	t	t	t<enemy name=""unit1"" delay=""26""/>
n	t	t	t<enemy name=""unit1"" delay=""27""/>
n	t	t	t<enemy name=""unit1"" delay=""28""/>
n	t	t	t<enemy name=""unit1"" delay=""29""/>
n	t	t	t<enemy name=""unit1"" delay=""30""/>
n	t	t	t
n	t	t	t<enemy name=""unit1"" delay=""50""/>
n	t	t	t<enemy name=""unit1"" delay=""51""/>
n	t	t	t<enemy name=""unit1"" delay=""52""/>
n	t	t	t<enemy name=""unit1"" delay=""53""/>
n	t	t	t<enemy name=""unit1"" delay=""54""/>
n	t	t	t<enemy name=""unit1"" delay=""55""/>
n	t	t	t<enemy name=""unit1"" delay=""56""/>
n	t	t	t<enemy name=""unit1"" delay=""57""/>
n	t	t	t<enemy name=""unit1"" delay=""58""/>
n	t	t	t<enemy name=""unit1"" delay=""59""/>
n	t	t	t<enemy name=""unit1"" delay=""60""/>
n	t	t	t
n	t	t	t<enemy name=""unit1"" delay=""71""/>
n	t	t	t<enemy name=""unit1"" delay=""72""/>
n	t	t	t<enemy name=""unit1"" delay=""73""/>
n	t	t	t<enemy name=""unit1"" delay=""74""/>
n	t	t	t<enemy name=""unit1"" delay=""75""/>
n	t	t	t<enemy name=""unit1"" delay=""76""/>
n	t	t	t<enemy name=""unit1"" delay=""77""/>
n	t	t	t<enemy name=""unit1"" delay=""78""/>
n	t	t	t<enemy name=""unit1"" delay=""79""/>
n	t	t	t<enemy name=""unit1"" delay=""80""/>
n	t	t	t<enemy name=""unit1"" delay=""81""/>
n	t	t	t<enemy name=""unit1"" delay=""82""/>
n	t	t	t<enemy name=""unit1"" delay=""83""/>
n	t	t	t<enemy name=""unit1"" delay=""84""/>
n	t	t	t<enemy name=""unit1"" delay=""85""/>
n	t	t	t<enemy name=""unit1"" delay=""86""/>
n	t	t	t<enemy name=""unit1"" delay=""87""/>
n	t	t	t<enemy name=""unit1"" delay=""88""/>
n	t	t	t<enemy name=""unit1"" delay=""89""/>
n	t	t	t<enemy name=""unit1"" delay=""90""/>
n	t	t	t<enemy name=""unit1"" delay=""101""/>
n	t	t	t<enemy name=""unit1"" delay=""102""/>
n	t	t	t<enemy name=""unit1"" delay=""103""/>
n	t	t	t<enemy name=""unit1"" delay=""104""/>
n	t	t	t<enemy name=""unit1"" delay=""105""/>
n	t	t	t<enemy name=""unit1"" delay=""106""/>
n	t	t	t<enemy name=""unit1"" delay=""107""/>
n	t	t	t<enemy name=""unit1"" delay=""108""/>
n	t	t	t<enemy name=""unit1"" delay=""109""/>
n	t	t	t<enemy name=""unit1"" delay=""110""/>
n	t	t	t<enemy name=""unit1"" delay=""111""/>
n	t	t	t<enemy name=""unit1"" delay=""112""/>
n	t	t	t<enemy name=""unit1"" delay=""113""/>
n	t	t	t<enemy name=""unit1"" delay=""114""/>
n	t	t	t<enemy name=""unit1"" delay=""115""/>
n	t	t	t<enemy name=""unit1"" delay=""116""/>
n	t	t	t<enemy name=""unit1"" delay=""117""/>
n	t	t	t<enemy name=""unit1"" delay=""118""/>
n	t	t	t<enemy name=""unit1"" delay=""119""/>
n	t	t	t<enemy name=""unit1"" delay=""120""/>
n	t	t	t
n	t	t	t<enemy name=""unit1"" delay=""151""/>
n	t	t	t<enemy name=""unit1"" delay=""152""/>
n	t	t	t<enemy name=""unit1"" delay=""153""/>
n	t	t	t<enemy name=""unit1"" delay=""154""/>
n	t	t	t<enemy name=""unit1"" delay=""155""/>
n	t	t	t<enemy name=""unit1"" delay=""156""/>
n	t	t	t<enemy name=""unit1"" delay=""157""/>
n	t	t	t<enemy name=""unit1"" delay=""158""/>
n	t	t	t<enemy name=""unit1"" delay=""159""/>
n	t	t	t<enemy name=""unit1"" delay=""160""/>
n	t	t	t<enemy name=""unit1"" delay=""161""/>
n	t	t	t<enemy name=""unit1"" delay=""162""/>
n	t	t	t<enemy name=""unit1"" delay=""163""/>
n	t	t	t<enemy name=""unit1"" delay=""164""/>
n	t	t	t<enemy name=""unit1"" delay=""165""/>
n	t	t	t<enemy name=""unit1"" delay=""166""/>
n	t	t	t<enemy name=""unit1"" delay=""167""/>
n	t	t	t<enemy name=""unit1"" delay=""168""/>
n	t	t	t<enemy name=""unit1"" delay=""169""/>
n	t	t	t<enemy name=""unit1"" delay=""170""/>
n	t	t	t<enemy name=""unit1"" delay=""171""/>
n	t	t	t<enemy name=""unit1"" delay=""172""/>
n	t	t	t<enemy name=""unit1"" delay=""173""/>
n	t	t	t<enemy name=""unit1"" delay=""174""/>
n	t	t	t<enemy name=""unit1"" delay=""175""/>
n	t	t	t<enemy name=""unit1"" delay=""176""/>
n	t	t	t<enemy name=""unit1"" delay=""177""/>
n	t	t	t<enemy name=""unit1"" delay=""178""/>
n	t	t	t<enemy name=""unit1"" delay=""179""/>
n	t	t	t<enemy name=""unit1"" delay=""180""/>
n	t	t	t
n	t	t	t<enemy name=""unit1"" delay=""221""/>
n	t	t	t<enemy name=""unit1"" delay=""222""/>
n	t	t	t<enemy name=""unit1"" delay=""223""/>
n	t	t	t<enemy name=""unit1"" delay=""224""/>
n	t	t	t<enemy name=""unit1"" delay=""225""/>
n	t	t	t<enemy name=""unit1"" delay=""226""/>
n	t	t	t<enemy name=""unit1"" delay=""227""/>
n	t	t	t<enemy name=""unit1"" delay=""228""/>
n	t	t	t<enemy name=""unit1"" delay=""229""/>
n	t	t	t<enemy name=""unit1"" delay=""230""/>
n	t	t	t<enemy name=""unit1"" delay=""231""/>
n	t	t	t<enemy name=""unit1"" delay=""232""/>
n	t	t	t<enemy name=""unit1"" delay=""233""/>
n	t	t	t<enemy name=""unit1"" delay=""234""/>
n	t	t	t<enemy name=""unit1"" delay=""235""/>
n	t	t	t<enemy name=""unit1"" delay=""236""/>
n	t	t	t<enemy name=""unit1"" delay=""237""/>
n	t	t	t<enemy name=""unit1"" delay=""238""/>
n	t	t	t<enemy name=""unit1"" delay=""239""/>
n	t	t	t<enemy name=""unit1"" delay=""240""/>
n	t	t	t<enemy name=""unit1"" delay=""241""/>
n	t	t	t<enemy name=""unit1"" delay=""242""/>
n	t	t	t<enemy name=""unit1"" delay=""243""/>
n	t	t	t<enemy name=""unit1"" delay=""244""/>
n	t	t	t<enemy name=""unit1"" delay=""245""/>
n	t	t	t<enemy name=""unit1"" delay=""246""/>
n	t	t	t<enemy name=""unit1"" delay=""247""/>
n	t	t	t<enemy name=""unit1"" delay=""248""/>
n	t	t	t<enemy name=""unit1"" delay=""249""/>
n	t	t	t<enemy name=""unit1"" delay=""250""/>
n	t	t	t
n	t	t	t<enemy name=""unit1"" delay=""261""/>
n	t	t	t<enemy name=""unit1"" delay=""262""/>
n	t	t	t<enemy name=""unit1"" delay=""263""/>
n	t	t	t<enemy name=""unit1"" delay=""264""/>
n	t	t	t<enemy name=""unit1"" delay=""265""/>
n	t	t	t<enemy name=""unit1"" delay=""266""/>
n	t	t	t<enemy name=""unit1"" delay=""267""/>
n	t	t	t<enemy name=""unit1"" delay=""268""/>
n	t	t	t<enemy name=""unit1"" delay=""269""/>
n	t	t	t<enemy name=""unit1"" delay=""270""/>
n	t	t	t<enemy name=""unit1"" delay=""271""/>
n	t	t	t<enemy name=""unit1"" delay=""272""/>
n	t	t	t<enemy name=""unit1"" delay=""273""/>
n	t	t	t<enemy name=""unit1"" delay=""274""/>
n	t	t	t<enemy name=""unit1"" delay=""275""/>
n	t	t	t<enemy name=""unit1"" delay=""276""/>
n	t	t	t<enemy name=""unit1"" delay=""277""/>
n	t	t	t<enemy name=""unit1"" delay=""278""/>
n	t	t	t<enemy name=""unit1"" delay=""279""/>
n	t	t	t<enemy name=""unit1"" delay=""280""/>
n	t	t	t<enemy name=""unit1"" delay=""281""/>
n	t	t	t<enemy name=""unit1"" delay=""282""/>
n	t	t	t<enemy name=""unit1"" delay=""283""/>
n	t	t	t<enemy name=""unit1"" delay=""284""/>
n	t	t	t<enemy name=""unit1"" delay=""285""/>
n	t	t	t<enemy name=""unit1"" delay=""286""/>
n	t	t	t<enemy name=""unit1"" delay=""287""/>
n	t	t	t<enemy name=""unit1"" delay=""288""/>
n	t	t	t<enemy name=""unit1"" delay=""289""/>
n	t	t	t<enemy name=""unit1"" delay=""290""/>
n	t	t	t<enemy name=""unit1"" delay=""291""/>
n	t	t	t<enemy name=""unit1"" delay=""292""/>
n	t	t	t<enemy name=""unit1"" delay=""293""/>
n	t	t	t<enemy name=""unit1"" delay=""294""/>
n	t	t	t<enemy name=""unit1"" delay=""295""/>
n	t	t	t<enemy name=""unit1"" delay=""296""/>
n	t	t	t<enemy name=""unit1"" delay=""297""/>
n	t	t	t<enemy name=""unit1"" delay=""298""/>
n	t	t	t<enemy name=""unit1"" delay=""299""/>
n	t	t	t<enemy name=""unit1"" delay=""300""/>
n	t	t	t
n	t	t	t<!-- unit2  -->
n	t	t	t<enemy name=""unit2"" delay=""80""/>
n	t	t	t<enemy name=""unit2"" delay=""82""/>
n	t	t	t<enemy name=""unit2"" delay=""84""/>
n	t	t	t<enemy name=""unit2"" delay=""86""/>
n	t	t	t<enemy name=""unit2"" delay=""88""/>
n	t	t	t<enemy name=""unit2"" delay=""90""/>
n	t	t	t<enemy name=""unit2"" delay=""92""/>
n	t	t	t<enemy name=""unit2"" delay=""94""/>
n	t	t	t<enemy name=""unit2"" delay=""96""/>
n	t	t	t<enemy name=""unit2"" delay=""98""/>
n	t	t	t<enemy name=""unit2"" delay=""100""/>
n	t	t	t
n	t	t	t<enemy name=""unit2"" delay=""120""/>
n	t	t	t<enemy name=""unit2"" delay=""122""/>
n	t	t	t<enemy name=""unit2"" delay=""124""/>
n	t	t	t<enemy name=""unit2"" delay=""126""/>
n	t	t	t<enemy name=""unit2"" delay=""128""/>
n	t	t	t<enemy name=""unit2"" delay=""130""/>
n	t	t	t<enemy name=""unit2"" delay=""132""/>
n	t	t	t<enemy name=""unit2"" delay=""134""/>
n	t	t	t<enemy name=""unit2"" delay=""136""/>
n	t	t	t<enemy name=""unit2"" delay=""138""/>
n	t	t	t<enemy name=""unit2"" delay=""140""/>
n	t	t	t<enemy name=""unit2"" delay=""142""/>
n	t	t	t<enemy name=""unit2"" delay=""144""/>
n	t	t	t<enemy name=""unit2"" delay=""146""/>
n	t	t	t<enemy name=""unit2"" delay=""148""/>
n	t	t	t<enemy name=""unit2"" delay=""150""/>
n	t	t	t
n	t	t	t<enemy name=""unit2"" delay=""170""/>
n	t	t	t<enemy name=""unit2"" delay=""172""/>
n	t	t	t<enemy name=""unit2"" delay=""174""/>
n	t	t	t<enemy name=""unit2"" delay=""176""/>
n	t	t	t<enemy name=""unit2"" delay=""178""/>
n	t	t	t<enemy name=""unit2"" delay=""180""/>
n	t	t	t<enemy name=""unit2"" delay=""182""/>
n	t	t	t<enemy name=""unit2"" delay=""184""/>
n	t	t	t<enemy name=""unit2"" delay=""186""/>
n	t	t	t<enemy name=""unit2"" delay=""188""/>
n	t	t	t<enemy name=""unit2"" delay=""190""/>
n	t	t	t<enemy name=""unit2"" delay=""192""/>
n	t	t	t<enemy name=""unit2"" delay=""194""/>
n	t	t	t<enemy name=""unit2"" delay=""196""/>
n	t	t	t<enemy name=""unit2"" delay=""198""/>
n	t	t	t<enemy name=""unit2"" delay=""200""/>
n	t	t	t
n	t	t	t<enemy name=""unit2"" delay=""230""/>
n	t	t	t<enemy name=""unit2"" delay=""232""/>
n	t	t	t<enemy name=""unit2"" delay=""234""/>
n	t	t	t<enemy name=""unit2"" delay=""236""/>
n	t	t	t<enemy name=""unit2"" delay=""238""/>
n	t	t	t<enemy name=""unit2"" delay=""240""/>
n	t	t	t<enemy name=""unit2"" delay=""242""/>
n	t	t	t<enemy name=""unit2"" delay=""244""/>
n	t	t	t<enemy name=""unit2"" delay=""246""/>
n	t	t	t<enemy name=""unit2"" delay=""248""/>
n	t	t	t<enemy name=""unit2"" delay=""252""/>
n	t	t	t<enemy name=""unit2"" delay=""254""/>
n	t	t	t<enemy name=""unit2"" delay=""256""/>
n	t	t	t<enemy name=""unit2"" delay=""258""/>
n	t	t	t<enemy name=""unit2"" delay=""260""/>
n	t	t	t<enemy name=""unit2"" delay=""262""/>
n	t	t	t<enemy name=""unit2"" delay=""264""/>
n	t	t	t<enemy name=""unit2"" delay=""266""/>
n	t	t	t<enemy name=""unit2"" delay=""268""/>
n	t	t	t<enemy name=""unit2"" delay=""270""/>
n	t	t	t<enemy name=""unit2"" delay=""272""/>
n	t	t	t<enemy name=""unit2"" delay=""274""/>
n	t	t	t<enemy name=""unit2"" delay=""276""/>
n	t	t	t<enemy name=""unit2"" delay=""278""/>
n	t	t	t<enemy name=""unit2"" delay=""280""/>
n	t	t	t<enemy name=""unit2"" delay=""282""/>
n	t	t	t<enemy name=""unit2"" delay=""284""/>
n	t	t	t<enemy name=""unit2"" delay=""286""/>
n	t	t	t<enemy name=""unit2"" delay=""288""/>
n	t	t	t<enemy name=""unit2"" delay=""290""/>
n	t	t	t<enemy name=""unit2"" delay=""292""/>
n	t	t	t<enemy name=""unit2"" delay=""294""/>
n	t	t	t
n	t	t	t<enemy name=""airplane"" delay=""180""/>
n	t	t	t<enemy name=""airplane"" delay=""185""/>
n	t	t	t<enemy name=""airplane"" delay=""190""/>
n	t	t	t<enemy name=""airplane"" delay=""195""/>
n	t	t	t
n	t	t	t<!-- tanket  -->
n	t	t	t<enemy name=""tanket"" delay=""20""/>
n	t	t	t<enemy name=""tanket"" delay=""25""/>
n	t	t	t<enemy name=""tanket"" delay=""30""/>
n	t	t	t<enemy name=""tanket"" delay=""35""/>
n	t	t	t<enemy name=""tanket"" delay=""40""/>
n	t	t	t<enemy name=""tanket"" delay=""43""/>
n	t	t	t<enemy name=""tanket"" delay=""46""/>
n	t	t	t<enemy name=""tanket"" delay=""49""/>
n	t	t	t
n	t	t	t<!-- car or balloon  -->
n	t	t	t<enemy name=""balloon"" delay=""40""/>
n	t	t	t<enemy name=""balloon"" delay=""44""/>
n	t	t	t<enemy name=""balloon"" delay=""48""/>
n	t	t	t<enemy name=""balloon"" delay=""52""/>
n	t	t	t<enemy name=""balloon"" delay=""56""/>
n	t	t	t<enemy name=""balloon"" delay=""60""/>
n	t	t	t<enemy name=""balloon"" delay=""63""/>
n	t	t	t<enemy name=""balloon"" delay=""66""/>
n	t	t	t<enemy name=""balloon"" delay=""69""/>
n	t	t	t<enemy name=""balloon"" delay=""72""/>
n	t	t	t<enemy name=""balloon"" delay=""75""/>
n	t	t	t<enemy name=""balloon"" delay=""78""/>
n	t	t	t
n	t	t	t<!-- cars -->
n	t	t	t<enemy name=""car"" delay=""90""/>
n	t	t	t<enemy name=""car"" delay=""100""/>
n	t	t	t<enemy name=""car"" delay=""110""/>
n	t	t	t<enemy name=""car"" delay=""120""/>
n	t	t	t<enemy name=""car"" delay=""130""/>
n	t	t	t<enemy name=""car"" delay=""140""/>
n	t	t	t<enemy name=""car"" delay=""150""/>
n	t	t	t<enemy name=""car"" delay=""170""/>
n	t	t	t<enemy name=""car"" delay=""190""/>
n	t	t	t<enemy name=""car"" delay=""220""/>
n	t	t	t<enemy name=""car"" delay=""260""/>
n	t	t	t
n	t	t	t<!-- aerostat or tank1 -->
n	t	t	t<enemy name=""tank1"" delay=""85""/>
n	t	t	t<enemy name=""tank1"" delay=""95""/>
n	t	t	t<enemy name=""tank1"" delay=""105""/>
n	t	t	t<enemy name=""tank1"" delay=""115""/>
n	t	t	t
n	t	t	t<!-- aerostats  -->
n	t	t	t<enemy name=""aerostat"" delay=""120""/>
n	t	t	t<enemy name=""aerostat"" delay=""130""/>
n	t	t	t<enemy name=""aerostat"" delay=""140""/>
n	t	t	t<enemy name=""aerostat"" delay=""160""/>
n	t	t	t<enemy name=""aerostat"" delay=""200""/>
n	t	t	t<enemy name=""aerostat"" delay=""240""/>
n	t	t	t<enemy name=""aerostat"" delay=""280""/>
n	t	t	t
n	t	t	t<!-- tanks -->
n	t	t	t<enemy name=""tank1"" delay=""140""/>
n	t	t	t<enemy name=""tank2"" delay=""160""/>
n	t	t	t<enemy name=""tank1"" delay=""180""/>
n	t	t	t<enemy name=""tank2"" delay=""200""/>
n	t	t	t<enemy name=""tank1"" delay=""220""/>
n	t	t	t<enemy name=""tank2"" delay=""240""/>
n	t	t	t<enemy name=""tank1"" delay=""260""/>
n	t	t	t<enemy name=""tank1"" delay=""280""/>
n	t	t	t
n	t	t	t<enemy name=""tank3"" delay=""170""/>
n	t	t	t<enemy name=""tank3"" delay=""200""/>
n	t	t	t
n	t	t	t<!-- parashuts -->
n	t	t	t<enemy name=""parashut"" delay=""180""/>
n	t	t	t<enemy name=""parashut"" delay=""183""/>
n	t	t	t<enemy name=""parashut"" delay=""186""/>
n	t	t	t<enemy name=""parashut"" delay=""190""/>
n	t	t	t<enemy name=""parashut"" delay=""193""/>
n	t	t	t<enemy name=""parashut"" delay=""196""/>
n	t	t	t<enemy name=""parashut"" delay=""200""/>
n	t	t	t<enemy name=""parashut"" delay=""203""/>
n	t	t	t<enemy name=""parashut"" delay=""206""/>
n	t	t	t<enemy name=""parashut"" delay=""210""/>
n	t	t	t<enemy name=""parashut"" delay=""203""/>
n	t	t	t<enemy name=""parashut"" delay=""216""/>
n	t	t	t<enemy name=""parashut"" delay=""220""/>
n	t	t	t<enemy name=""parashut"" delay=""223""/>
n	t	t	t<enemy name=""parashut"" delay=""226""/>
n	t	t	t<enemy name=""parashut"" delay=""230""/>
n	t	t	t<enemy name=""parashut"" delay=""233""/>
n	t	t	t<enemy name=""parashut"" delay=""236""/>
n	t	t	t<enemy name=""parashut"" delay=""240""/>
n	t	t	t<enemy name=""parashut"" delay=""243""/>
n	t	t	t<enemy name=""parashut"" delay=""246""/>
n	t	t	t<enemy name=""parashut"" delay=""250""/>
n	t	t	t<enemy name=""parashut"" delay=""253""/>
n	t	t	t<enemy name=""parashut"" delay=""256""/>
n	t	t	t<enemy name=""parashut"" delay=""260""/>
n	t	t	t
n	t	t	t<!-- Heli or walker  -->
n	t	t	t<enemy name=""heli"" delay=""190""/>
n	t	t	t<enemy name=""heli"" delay=""194""/>
n	t	t	t<enemy name=""heli"" delay=""198""/>
n	t	t	t<enemy name=""heli"" delay=""200""/>
n	t	t	t<enemy name=""heli"" delay=""204""/>
n	t	t	t<enemy name=""heli"" delay=""208""/>
n	t	t	t<enemy name=""heli"" delay=""212""/>
n	t	t	t<enemy name=""heli"" delay=""216""/>
n	t	t	t<enemy name=""heli"" delay=""220""/>
n	t	t	t<enemy name=""heli"" delay=""225""/>
n	t	t	t<enemy name=""heli"" delay=""230""/>
n	t	t	t
n	t	t	t<!-- heli -->
n	t	t	t<enemy name=""heli"" delay=""260""/>
n	t	t	t<enemy name=""heli"" delay=""270""/>
n	t	t	t<enemy name=""heli"" delay=""280""/>
n	t	t	t<enemy name=""heli"" delay=""290""/>
n	t	t	t
n	t	t	t<!-- walker -->
n	t	t	t<enemy name=""walker1"" delay=""10""/>
n	t	t	t<enemy name=""walker1"" delay=""30""/>
n	t	t	t<enemy name=""walker1"" delay=""90""/>
n	t	t	t<enemy name=""walker1"" delay=""255""/>
n	t	t	t<enemy name=""walker1"" delay=""265""/>
n	t	t	t<enemy name=""walker2"" delay=""275""/>
n	t	t	t<enemy name=""walker2"" delay=""285""/>
n	t	t	t
n	t	t<!-- ////////////////////////////////////////////////////////////////////////////////////// -->
n	t	t<!-- ////////////////////////////////////////////////////////////////////////////////////// -->
n	t	t<!-- ////////////////////////////////////////////////////////////////////////////////////// -->
n	t	t</wave>
n	t	t<wave pause=""0"" lifeTime=""10"" side=""right"" img=""1"">
n	t	t<!-- ////////////////////////////////////////////////////////////////////////////////////// -->
n	t	t<!-- ////////////////////////////////////////////////////////////////////////////////////// -->
n	t	t<!-- ////////////////////////////////////////////////////////////////////////////////////// -->
n	t	t<enemy name=""unit1"" delay=""1""/>
n	t	t	t<enemy name=""unit1"" delay=""2""/>
n	t	t	t<enemy name=""unit1"" delay=""3""/>
n	t	t	t<enemy name=""unit1"" delay=""4""/>
n	t	t	t<enemy name=""unit1"" delay=""5""/>
n	t	t	t<enemy name=""unit1"" delay=""6""/>
n	t	t	t<enemy name=""unit1"" delay=""7""/>
n	t	t	t<enemy name=""unit1"" delay=""8""/>
n	t	t	t<enemy name=""unit1"" delay=""9""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""12""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit1"" delay=""17""/>
n	t	t	t<enemy name=""unit1"" delay=""19""/>
n	t	t	t<enemy name=""unit1"" delay=""10""/>
n	t	t	t<enemy name=""unit1"" delay=""11""/>
n	t	t	t<enemy name=""unit1"" delay=""12""/>
n	t	t	t<enemy name=""unit1"" delay=""13""/>
n	t	t	t<enemy name=""unit1"" delay=""14""/>
n	t	t	t<enemy name=""unit1"" delay=""15""/>
n	t	t	t<enemy name=""unit1"" delay=""16""/>
n	t	t	t<enemy name=""unit1"" delay=""17""/>
n	t	t	t<enemy name=""unit1"" delay=""19""/>
n	t	t	t<enemy name=""unit1"" delay=""20""/>
n	t	t	t<enemy name=""unit1"" delay=""21""/>
n	t	t	t<enemy name=""unit1"" delay=""22""/>
n	t	t	t<enemy name=""unit1"" delay=""23""/>
n	t	t	t<enemy name=""unit1"" delay=""24""/>
n	t	t	t<enemy name=""unit1"" delay=""25""/>
n	t	t	t<enemy name=""unit1"" delay=""26""/>
n	t	t	t<enemy name=""unit1"" delay=""27""/>
n	t	t	t<enemy name=""unit1"" delay=""28""/>
n	t	t	t<enemy name=""unit1"" delay=""29""/>
n	t	t	t<enemy name=""unit1"" delay=""30""/>
n	t	t	t
n	t	t	t<enemy name=""unit1"" delay=""50""/>
n	t	t	t<enemy name=""unit1"" delay=""51""/>
n	t	t	t<enemy name=""unit1"" delay=""52""/>
n	t	t	t<enemy name=""unit1"" delay=""53""/>
n	t	t	t<enemy name=""unit1"" delay=""54""/>
n	t	t	t<enemy name=""unit1"" delay=""55""/>
n	t	t	t<enemy name=""unit1"" delay=""56""/>
n	t	t	t<enemy name=""unit1"" delay=""57""/>
n	t	t	t<enemy name=""unit1"" delay=""58""/>
n	t	t	t<enemy name=""unit1"" delay=""59""/>
n	t	t	t<enemy name=""unit1"" delay=""60""/>
n	t	t	t
n	t	t	t<enemy name=""unit1"" delay=""71""/>
n	t	t	t<enemy name=""unit1"" delay=""72""/>
n	t	t	t<enemy name=""unit1"" delay=""73""/>
n	t	t	t<enemy name=""unit1"" delay=""74""/>
n	t	t	t<enemy name=""unit1"" delay=""75""/>
n	t	t	t<enemy name=""unit1"" delay=""76""/>
n	t	t	t<enemy name=""unit1"" delay=""77""/>
n	t	t	t<enemy name=""unit1"" delay=""78""/>
n	t	t	t<enemy name=""unit1"" delay=""79""/>
n	t	t	t<enemy name=""unit1"" delay=""80""/>
n	t	t	t<enemy name=""unit1"" delay=""81""/>
n	t	t	t<enemy name=""unit1"" delay=""82""/>
n	t	t	t<enemy name=""unit1"" delay=""83""/>
n	t	t	t<enemy name=""unit1"" delay=""84""/>
n	t	t	t<enemy name=""unit1"" delay=""85""/>
n	t	t	t<enemy name=""unit1"" delay=""86""/>
n	t	t	t<enemy name=""unit1"" delay=""87""/>
n	t	t	t<enemy name=""unit1"" delay=""88""/>
n	t	t	t<enemy name=""unit1"" delay=""89""/>
n	t	t	t<enemy name=""unit1"" delay=""90""/>
n	t	t	t<enemy name=""unit1"" delay=""101""/>
n	t	t	t<enemy name=""unit1"" delay=""102""/>
n	t	t	t<enemy name=""unit1"" delay=""103""/>
n	t	t	t<enemy name=""unit1"" delay=""104""/>
n	t	t	t<enemy name=""unit1"" delay=""105""/>
n	t	t	t<enemy name=""unit1"" delay=""106""/>
n	t	t	t<enemy name=""unit1"" delay=""107""/>
n	t	t	t<enemy name=""unit1"" delay=""108""/>
n	t	t	t<enemy name=""unit1"" delay=""109""/>
n	t	t	t<enemy name=""unit1"" delay=""110""/>
n	t	t	t<enemy name=""unit1"" delay=""111""/>
n	t	t	t<enemy name=""unit1"" delay=""112""/>
n	t	t	t<enemy name=""unit1"" delay=""113""/>
n	t	t	t<enemy name=""unit1"" delay=""114""/>
n	t	t	t<enemy name=""unit1"" delay=""115""/>
n	t	t	t<enemy name=""unit1"" delay=""116""/>
n	t	t	t<enemy name=""unit1"" delay=""117""/>
n	t	t	t<enemy name=""unit1"" delay=""118""/>
n	t	t	t<enemy name=""unit1"" delay=""119""/>
n	t	t	t<enemy name=""unit1"" delay=""120""/>
n	t	t	t
n	t	t	t<enemy name=""unit1"" delay=""151""/>
n	t	t	t<enemy name=""unit1"" delay=""152""/>
n	t	t	t<enemy name=""unit1"" delay=""153""/>
n	t	t	t<enemy name=""unit1"" delay=""154""/>
n	t	t	t<enemy name=""unit1"" delay=""155""/>
n	t	t	t<enemy name=""unit1"" delay=""156""/>
n	t	t	t<enemy name=""unit1"" delay=""157""/>
n	t	t	t<enemy name=""unit1"" delay=""158""/>
n	t	t	t<enemy name=""unit1"" delay=""159""/>
n	t	t	t<enemy name=""unit1"" delay=""160""/>
n	t	t	t<enemy name=""unit1"" delay=""161""/>
n	t	t	t<enemy name=""unit1"" delay=""162""/>
n	t	t	t<enemy name=""unit1"" delay=""163""/>
n	t	t	t<enemy name=""unit1"" delay=""164""/>
n	t	t	t<enemy name=""unit1"" delay=""165""/>
n	t	t	t<enemy name=""unit1"" delay=""166""/>
n	t	t	t<enemy name=""unit1"" delay=""167""/>
n	t	t	t<enemy name=""unit1"" delay=""168""/>
n	t	t	t<enemy name=""unit1"" delay=""169""/>
n	t	t	t<enemy name=""unit1"" delay=""170""/>
n	t	t	t<enemy name=""unit1"" delay=""171""/>
n	t	t	t<enemy name=""unit1"" delay=""172""/>
n	t	t	t<enemy name=""unit1"" delay=""173""/>
n	t	t	t<enemy name=""unit1"" delay=""174""/>
n	t	t	t<enemy name=""unit1"" delay=""175""/>
n	t	t	t<enemy name=""unit1"" delay=""176""/>
n	t	t	t<enemy name=""unit1"" delay=""177""/>
n	t	t	t<enemy name=""unit1"" delay=""178""/>
n	t	t	t<enemy name=""unit1"" delay=""179""/>
n	t	t	t<enemy name=""unit1"" delay=""180""/>
n	t	t	t
n	t	t	t<enemy name=""unit1"" delay=""221""/>
n	t	t	t<enemy name=""unit1"" delay=""222""/>
n	t	t	t<enemy name=""unit1"" delay=""223""/>
n	t	t	t<enemy name=""unit1"" delay=""224""/>
n	t	t	t<enemy name=""unit1"" delay=""225""/>
n	t	t	t<enemy name=""unit1"" delay=""226""/>
n	t	t	t<enemy name=""unit1"" delay=""227""/>
n	t	t	t<enemy name=""unit1"" delay=""228""/>
n	t	t	t<enemy name=""unit1"" delay=""229""/>
n	t	t	t<enemy name=""unit1"" delay=""230""/>
n	t	t	t<enemy name=""unit1"" delay=""231""/>
n	t	t	t<enemy name=""unit1"" delay=""232""/>
n	t	t	t<enemy name=""unit1"" delay=""233""/>
n	t	t	t<enemy name=""unit1"" delay=""234""/>
n	t	t	t<enemy name=""unit1"" delay=""235""/>
n	t	t	t<enemy name=""unit1"" delay=""236""/>
n	t	t	t<enemy name=""unit1"" delay=""237""/>
n	t	t	t<enemy name=""unit1"" delay=""238""/>
n	t	t	t<enemy name=""unit1"" delay=""239""/>
n	t	t	t<enemy name=""unit1"" delay=""240""/>
n	t	t	t<enemy name=""unit1"" delay=""241""/>
n	t	t	t<enemy name=""unit1"" delay=""242""/>
n	t	t	t<enemy name=""unit1"" delay=""243""/>
n	t	t	t<enemy name=""unit1"" delay=""244""/>
n	t	t	t<enemy name=""unit1"" delay=""245""/>
n	t	t	t<enemy name=""unit1"" delay=""246""/>
n	t	t	t<enemy name=""unit1"" delay=""247""/>
n	t	t	t<enemy name=""unit1"" delay=""248""/>
n	t	t	t<enemy name=""unit1"" delay=""249""/>
n	t	t	t<enemy name=""unit1"" delay=""250""/>
n	t	t	t
n	t	t	t<enemy name=""unit1"" delay=""261""/>
n	t	t	t<enemy name=""unit1"" delay=""262""/>
n	t	t	t<enemy name=""unit1"" delay=""263""/>
n	t	t	t<enemy name=""unit1"" delay=""264""/>
n	t	t	t<enemy name=""unit1"" delay=""265""/>
n	t	t	t<enemy name=""unit1"" delay=""266""/>
n	t	t	t<enemy name=""unit1"" delay=""267""/>
n	t	t	t<enemy name=""unit1"" delay=""268""/>
n	t	t	t<enemy name=""unit1"" delay=""269""/>
n	t	t	t<enemy name=""unit1"" delay=""270""/>
n	t	t	t<enemy name=""unit1"" delay=""271""/>
n	t	t	t<enemy name=""unit1"" delay=""272""/>
n	t	t	t<enemy name=""unit1"" delay=""273""/>
n	t	t	t<enemy name=""unit1"" delay=""274""/>
n	t	t	t<enemy name=""unit1"" delay=""275""/>
n	t	t	t<enemy name=""unit1"" delay=""276""/>
n	t	t	t<enemy name=""unit1"" delay=""277""/>
n	t	t	t<enemy name=""unit1"" delay=""278""/>
n	t	t	t<enemy name=""unit1"" delay=""279""/>
n	t	t	t<enemy name=""unit1"" delay=""280""/>
n	t	t	t<enemy name=""unit1"" delay=""281""/>
n	t	t	t<enemy name=""unit1"" delay=""282""/>
n	t	t	t<enemy name=""unit1"" delay=""283""/>
n	t	t	t<enemy name=""unit1"" delay=""284""/>
n	t	t	t<enemy name=""unit1"" delay=""285""/>
n	t	t	t<enemy name=""unit1"" delay=""286""/>
n	t	t	t<enemy name=""unit1"" delay=""287""/>
n	t	t	t<enemy name=""unit1"" delay=""288""/>
n	t	t	t<enemy name=""unit1"" delay=""289""/>
n	t	t	t<enemy name=""unit1"" delay=""290""/>
n	t	t	t<enemy name=""unit1"" delay=""291""/>
n	t	t	t<enemy name=""unit1"" delay=""292""/>
n	t	t	t<enemy name=""unit1"" delay=""293""/>
n	t	t	t<enemy name=""unit1"" delay=""294""/>
n	t	t	t<enemy name=""unit1"" delay=""295""/>
n	t	t	t<enemy name=""unit1"" delay=""296""/>
n	t	t	t<enemy name=""unit1"" delay=""297""/>
n	t	t	t<enemy name=""unit1"" delay=""298""/>
n	t	t	t<enemy name=""unit1"" delay=""299""/>
n	t	t	t<enemy name=""unit1"" delay=""300""/>
n	t	t	t
n	t	t	t<!-- unit2  -->
n	t	t	t<enemy name=""unit2"" delay=""80""/>
n	t	t	t<enemy name=""unit2"" delay=""82""/>
n	t	t	t<enemy name=""unit2"" delay=""84""/>
n	t	t	t<enemy name=""unit2"" delay=""86""/>
n	t	t	t<enemy name=""unit2"" delay=""88""/>
n	t	t	t<enemy name=""unit2"" delay=""90""/>
n	t	t	t<enemy name=""unit2"" delay=""92""/>
n	t	t	t<enemy name=""unit2"" delay=""94""/>
n	t	t	t<enemy name=""unit2"" delay=""96""/>
n	t	t	t<enemy name=""unit2"" delay=""98""/>
n	t	t	t<enemy name=""unit2"" delay=""100""/>
n	t	t	t
n	t	t	t<enemy name=""unit2"" delay=""120""/>
n	t	t	t<enemy name=""unit2"" delay=""122""/>
n	t	t	t<enemy name=""unit2"" delay=""124""/>
n	t	t	t<enemy name=""unit2"" delay=""126""/>
n	t	t	t<enemy name=""unit2"" delay=""128""/>
n	t	t	t<enemy name=""unit2"" delay=""130""/>
n	t	t	t<enemy name=""unit2"" delay=""132""/>
n	t	t	t<enemy name=""unit2"" delay=""134""/>
n	t	t	t<enemy name=""unit2"" delay=""136""/>
n	t	t	t<enemy name=""unit2"" delay=""138""/>
n	t	t	t<enemy name=""unit2"" delay=""140""/>
n	t	t	t<enemy name=""unit2"" delay=""142""/>
n	t	t	t<enemy name=""unit2"" delay=""144""/>
n	t	t	t<enemy name=""unit2"" delay=""146""/>
n	t	t	t<enemy name=""unit2"" delay=""148""/>
n	t	t	t<enemy name=""unit2"" delay=""150""/>
n	t	t	t
n	t	t	t<enemy name=""unit2"" delay=""170""/>
n	t	t	t<enemy name=""unit2"" delay=""172""/>
n	t	t	t<enemy name=""unit2"" delay=""174""/>
n	t	t	t<enemy name=""unit2"" delay=""176""/>
n	t	t	t<enemy name=""unit2"" delay=""178""/>
n	t	t	t<enemy name=""unit2"" delay=""180""/>
n	t	t	t<enemy name=""unit2"" delay=""182""/>
n	t	t	t<enemy name=""unit2"" delay=""184""/>
n	t	t	t<enemy name=""unit2"" delay=""186""/>
n	t	t	t<enemy name=""unit2"" delay=""188""/>
n	t	t	t<enemy name=""unit2"" delay=""190""/>
n	t	t	t<enemy name=""unit2"" delay=""192""/>
n	t	t	t<enemy name=""unit2"" delay=""194""/>
n	t	t	t<enemy name=""unit2"" delay=""196""/>
n	t	t	t<enemy name=""unit2"" delay=""198""/>
n	t	t	t<enemy name=""unit2"" delay=""200""/>
n	t	t	t
n	t	t	t<enemy name=""unit2"" delay=""230""/>
n	t	t	t<enemy name=""unit2"" delay=""232""/>
n	t	t	t<enemy name=""unit2"" delay=""234""/>
n	t	t	t<enemy name=""unit2"" delay=""236""/>
n	t	t	t<enemy name=""unit2"" delay=""238""/>
n	t	t	t<enemy name=""unit2"" delay=""240""/>
n	t	t	t<enemy name=""unit2"" delay=""242""/>
n	t	t	t<enemy name=""unit2"" delay=""244""/>
n	t	t	t<enemy name=""unit2"" delay=""246""/>
n	t	t	t<enemy name=""unit2"" delay=""248""/>
n	t	t	t<enemy name=""unit2"" delay=""252""/>
n	t	t	t<enemy name=""unit2"" delay=""254""/>
n	t	t	t<enemy name=""unit2"" delay=""256""/>
n	t	t	t<enemy name=""unit2"" delay=""258""/>
n	t	t	t<enemy name=""unit2"" delay=""260""/>
n	t	t	t<enemy name=""unit2"" delay=""262""/>
n	t	t	t<enemy name=""unit2"" delay=""264""/>
n	t	t	t<enemy name=""unit2"" delay=""266""/>
n	t	t	t<enemy name=""unit2"" delay=""268""/>
n	t	t	t<enemy name=""unit2"" delay=""270""/>
n	t	t	t<enemy name=""unit2"" delay=""272""/>
n	t	t	t<enemy name=""unit2"" delay=""274""/>
n	t	t	t<enemy name=""unit2"" delay=""276""/>
n	t	t	t<enemy name=""unit2"" delay=""278""/>
n	t	t	t<enemy name=""unit2"" delay=""280""/>
n	t	t	t<enemy name=""unit2"" delay=""282""/>
n	t	t	t<enemy name=""unit2"" delay=""284""/>
n	t	t	t<enemy name=""unit2"" delay=""286""/>
n	t	t	t<enemy name=""unit2"" delay=""288""/>
n	t	t	t<enemy name=""unit2"" delay=""290""/>
n	t	t	t<enemy name=""unit2"" delay=""292""/>
n	t	t	t<enemy name=""unit2"" delay=""294""/>
n	t	t	t
n	t	t	t<!-- tanket  -->
n	t	t	t<enemy name=""tanket"" delay=""20""/>
n	t	t	t<enemy name=""tanket"" delay=""25""/>
n	t	t	t<enemy name=""tanket"" delay=""30""/>
n	t	t	t<enemy name=""tanket"" delay=""35""/>
n	t	t	t<enemy name=""tanket"" delay=""40""/>
n	t	t	t<enemy name=""tanket"" delay=""43""/>
n	t	t	t<enemy name=""tanket"" delay=""46""/>
n	t	t	t<enemy name=""tanket"" delay=""49""/>
n	t	t	t
n	t	t	t<!-- car or balloon  -->
n	t	t
n	t	t	t<enemy name=""car"" delay=""40""/>
n	t	t	t<enemy name=""car"" delay=""45""/>
n	t	t	t<enemy name=""car"" delay=""50""/>
n	t	t	t<enemy name=""car"" delay=""55""/>
n	t	t	t<enemy name=""car"" delay=""60""/>
n	t	t	t<enemy name=""car"" delay=""65""/>
n	t	t	t<enemy name=""car"" delay=""70""/>
n	t	t	t<enemy name=""car"" delay=""75""/>
n	t	t	t
n	t	t	t<!-- cars -->
n	t	t	t<enemy name=""car"" delay=""90""/>
n	t	t	t<enemy name=""car"" delay=""100""/>
n	t	t	t<enemy name=""car"" delay=""110""/>
n	t	t	t<enemy name=""car"" delay=""120""/>
n	t	t	t<enemy name=""car"" delay=""130""/>
n	t	t	t<enemy name=""car"" delay=""140""/>
n	t	t	t<enemy name=""car"" delay=""150""/>
n	t	t	t<enemy name=""car"" delay=""170""/>
n	t	t	t<enemy name=""car"" delay=""190""/>
n	t	t	t<enemy name=""car"" delay=""220""/>
n	t	t	t<enemy name=""car"" delay=""260""/>
n	t	t	t
n	t	t	t<!-- aerostat or tank1 -->
n	t	t	t<enemy name=""aerostat"" delay=""80""/>
n	t	t	t<enemy name=""aerostat"" delay=""85""/>
n	t	t	t<enemy name=""aerostat"" delay=""90""/>
n	t	t	t<enemy name=""aerostat"" delay=""95""/>
n	t	t	t<enemy name=""aerostat"" delay=""100""/>
n	t	t	t<enemy name=""aerostat"" delay=""105""/>
n	t	t	t<enemy name=""aerostat"" delay=""110""/>
n	t	t	t
n	t	t	t<!-- aerostats  -->
n	t	t	t<enemy name=""aerostat"" delay=""120""/>
n	t	t	t<enemy name=""aerostat"" delay=""130""/>
n	t	t	t<enemy name=""aerostat"" delay=""140""/>
n	t	t	t<enemy name=""aerostat"" delay=""160""/>
n	t	t	t<enemy name=""aerostat"" delay=""200""/>
n	t	t	t<enemy name=""aerostat"" delay=""240""/>
n	t	t	t<enemy name=""aerostat"" delay=""280""/>
n	t	t	t
n	t	t	t<!-- tanks -->
n	t	t	t<enemy name=""tank1"" delay=""140""/>
n	t	t	t<enemy name=""tank2"" delay=""160""/>
n	t	t	t<enemy name=""tank1"" delay=""180""/>
n	t	t	t<enemy name=""tank2"" delay=""200""/>
n	t	t	t<enemy name=""tank1"" delay=""220""/>
n	t	t	t<enemy name=""tank2"" delay=""240""/>
n	t	t	t<enemy name=""tank2"" delay=""260""/>
n	t	t	t<enemy name=""tank1"" delay=""280""/>
n	t	t	t
n	t	t	t<enemy name=""tank3"" delay=""150""/>
n	t	t	t<enemy name=""tank3"" delay=""200""/>
n	t	t	t
n	t	t	t
n	t	t	t<!-- parashuts -->
n	t	t	t<enemy name=""parashut"" delay=""180""/>
n	t	t	t<enemy name=""parashut"" delay=""183""/>
n	t	t	t<enemy name=""parashut"" delay=""186""/>
n	t	t	t<enemy name=""parashut"" delay=""190""/>
n	t	t	t<enemy name=""parashut"" delay=""193""/>
n	t	t	t<enemy name=""parashut"" delay=""196""/>
n	t	t	t<enemy name=""parashut"" delay=""200""/>
n	t	t	t<enemy name=""parashut"" delay=""203""/>
n	t	t	t<enemy name=""parashut"" delay=""206""/>
n	t	t	t<enemy name=""parashut"" delay=""210""/>
n	t	t	t<enemy name=""parashut"" delay=""203""/>
n	t	t	t<enemy name=""parashut"" delay=""216""/>
n	t	t	t<enemy name=""parashut"" delay=""220""/>
n	t	t	t<enemy name=""parashut"" delay=""223""/>
n	t	t	t<enemy name=""parashut"" delay=""226""/>
n	t	t	t<enemy name=""parashut"" delay=""230""/>
n	t	t	t<enemy name=""parashut"" delay=""233""/>
n	t	t	t<enemy name=""parashut"" delay=""236""/>
n	t	t	t<enemy name=""parashut"" delay=""240""/>
n	t	t	t<enemy name=""parashut"" delay=""243""/>
n	t	t	t<enemy name=""parashut"" delay=""246""/>
n	t	t	t<enemy name=""parashut"" delay=""250""/>
n	t	t	t<enemy name=""parashut"" delay=""253""/>
n	t	t	t<enemy name=""parashut"" delay=""256""/>
n	t	t	t<enemy name=""parashut"" delay=""260""/>
n	t	t	t
n	t	t	t<enemy name=""airplane"" delay=""180""/>
n	t	t	t<enemy name=""airplane"" delay=""185""/>
n	t	t	t<enemy name=""airplane"" delay=""190""/>
n	t	t	t<enemy name=""airplane"" delay=""195""/>
n	t	t	t
n	t	t	t<!-- Heli or walker  -->
n	t	t	t<enemy name=""walker1"" delay=""190""/>
n	t	t	t<enemy name=""walker1"" delay=""200""/>
n	t	t	t<enemy name=""walker1"" delay=""212""/>
n	t	t	t<enemy name=""walker1"" delay=""225""/>
n	t	t	t
n	t	t	t<!-- heli -->
n	t	t	t<enemy name=""heli"" delay=""260""/>
n	t	t	t<enemy name=""heli"" delay=""270""/>
n	t	t	t<enemy name=""heli"" delay=""280""/>
n	t	t	t<enemy name=""heli"" delay=""290""/>
n	t	t	t
n	t	t	t<!-- walker -->
n	t	t	t<enemy name=""walker1"" delay=""40""/>
n	t	t	t<enemy name=""walker1"" delay=""60""/>
n	t	t	t<enemy name=""walker1"" delay=""120""/>
n	t	t	t<enemy name=""walker1"" delay=""255""/>
n	t	t	t<enemy name=""walker1"" delay=""265""/>
n	t	t	t<enemy name=""walker2"" delay=""275""/>
n	t	t	t<enemy name=""walker2"" delay=""285""/>
n	t	t	t
n	t	t</wave>
n	t</group>
n</level>")("<level eye="always" money="0" maxTower="5" maxUpgrade="5" bg="5" upgradeTwo="true" threeStarHealth="80" twiStarHealth="60" preStartMoney="3500">
	
<!-- 
	Пушки
	столбец - 0 лев, 1 центр, 2 прав
	строка -  0 подвал, 1 первый, 2 второй, ...
	индексы апгрейдов 
	1 - upgr2, 
	2 - upgr3_1, 
	3 - upgr4_1, 
	4 - upgr3_2, 
	5 - upgr4_2
	
	значения для глаза(eye)  off, normal, always
	-->
	
	<settings towerLevel="4" towerHealth="100" globalUpgrades="4" maxCannons="8" machinegun="false" heavygun="false" lightning="false" saws="false" score="58000">
	    <!--
		
		-->
		<cannon name="lightning" upgr="5" col="0" row="1"/>
		<cannon name="lightning" upgr="5" col="2" row="1"/>
		<cannon name="heavygun" upgr="5" col="0" row="2"/>
		<cannon name="heavygun" upgr="5" col="2" row="2"/>
		<cannon name="machinegun" upgr="5" col="0" row="3"/>
		<cannon name="machinegun" upgr="5" col="2" row="3"/>
		<cannon name="saw" upgr="5" col="0" row="4"/>
		<cannon name="saw" upgr="5" col="2" row="4"/>
	</settings>
	
	
<group pause="0">
		<wave pause="0" lifeTime="400" side="left" img="1">
			<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit1" delay="6"/>
			<enemy name="unit1" delay="7"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="12"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit1" delay="17"/>
			<enemy name="unit1" delay="19"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="12"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit1" delay="17"/>
			<enemy name="unit1" delay="19"/>
			<enemy name="unit1" delay="20"/>
			<enemy name="unit1" delay="21"/>
			<enemy name="unit1" delay="22"/>
			<enemy name="unit1" delay="23"/>
			<enemy name="unit1" delay="24"/>
			<enemy name="unit1" delay="25"/>
			<enemy name="unit1" delay="26"/>
			<enemy name="unit1" delay="27"/>
			<enemy name="unit1" delay="28"/>
			<enemy name="unit1" delay="29"/>
			<enemy name="unit1" delay="30"/>
			
			<enemy name="unit1" delay="50"/>
			<enemy name="unit1" delay="51"/>
			<enemy name="unit1" delay="52"/>
			<enemy name="unit1" delay="53"/>
			<enemy name="unit1" delay="54"/>
			<enemy name="unit1" delay="55"/>
			<enemy name="unit1" delay="56"/>
			<enemy name="unit1" delay="57"/>
			<enemy name="unit1" delay="58"/>
			<enemy name="unit1" delay="59"/>
			<enemy name="unit1" delay="60"/>
			
			<enemy name="unit1" delay="71"/>
			<enemy name="unit1" delay="72"/>
			<enemy name="unit1" delay="73"/>
			<enemy name="unit1" delay="74"/>
			<enemy name="unit1" delay="75"/>
			<enemy name="unit1" delay="76"/>
			<enemy name="unit1" delay="77"/>
			<enemy name="unit1" delay="78"/>
			<enemy name="unit1" delay="79"/>
			<enemy name="unit1" delay="80"/>
			<enemy name="unit1" delay="81"/>
			<enemy name="unit1" delay="82"/>
			<enemy name="unit1" delay="83"/>
			<enemy name="unit1" delay="84"/>
			<enemy name="unit1" delay="85"/>
			<enemy name="unit1" delay="86"/>
			<enemy name="unit1" delay="87"/>
			<enemy name="unit1" delay="88"/>
			<enemy name="unit1" delay="89"/>
			<enemy name="unit1" delay="90"/>
			<enemy name="unit1" delay="101"/>
			<enemy name="unit1" delay="102"/>
			<enemy name="unit1" delay="103"/>
			<enemy name="unit1" delay="104"/>
			<enemy name="unit1" delay="105"/>
			<enemy name="unit1" delay="106"/>
			<enemy name="unit1" delay="107"/>
			<enemy name="unit1" delay="108"/>
			<enemy name="unit1" delay="109"/>
			<enemy name="unit1" delay="110"/>
			<enemy name="unit1" delay="111"/>
			<enemy name="unit1" delay="112"/>
			<enemy name="unit1" delay="113"/>
			<enemy name="unit1" delay="114"/>
			<enemy name="unit1" delay="115"/>
			<enemy name="unit1" delay="116"/>
			<enemy name="unit1" delay="117"/>
			<enemy name="unit1" delay="118"/>
			<enemy name="unit1" delay="119"/>
			<enemy name="unit1" delay="120"/>
			
			<enemy name="unit1" delay="151"/>
			<enemy name="unit1" delay="152"/>
			<enemy name="unit1" delay="153"/>
			<enemy name="unit1" delay="154"/>
			<enemy name="unit1" delay="155"/>
			<enemy name="unit1" delay="156"/>
			<enemy name="unit1" delay="157"/>
			<enemy name="unit1" delay="158"/>
			<enemy name="unit1" delay="159"/>
			<enemy name="unit1" delay="160"/>
			<enemy name="unit1" delay="161"/>
			<enemy name="unit1" delay="162"/>
			<enemy name="unit1" delay="163"/>
			<enemy name="unit1" delay="164"/>
			<enemy name="unit1" delay="165"/>
			<enemy name="unit1" delay="166"/>
			<enemy name="unit1" delay="167"/>
			<enemy name="unit1" delay="168"/>
			<enemy name="unit1" delay="169"/>
			<enemy name="unit1" delay="170"/>
			<enemy name="unit1" delay="171"/>
			<enemy name="unit1" delay="172"/>
			<enemy name="unit1" delay="173"/>
			<enemy name="unit1" delay="174"/>
			<enemy name="unit1" delay="175"/>
			<enemy name="unit1" delay="176"/>
			<enemy name="unit1" delay="177"/>
			<enemy name="unit1" delay="178"/>
			<enemy name="unit1" delay="179"/>
			<enemy name="unit1" delay="180"/>
			
			<enemy name="unit1" delay="221"/>
			<enemy name="unit1" delay="222"/>
			<enemy name="unit1" delay="223"/>
			<enemy name="unit1" delay="224"/>
			<enemy name="unit1" delay="225"/>
			<enemy name="unit1" delay="226"/>
			<enemy name="unit1" delay="227"/>
			<enemy name="unit1" delay="228"/>
			<enemy name="unit1" delay="229"/>
			<enemy name="unit1" delay="230"/>
			<enemy name="unit1" delay="231"/>
			<enemy name="unit1" delay="232"/>
			<enemy name="unit1" delay="233"/>
			<enemy name="unit1" delay="234"/>
			<enemy name="unit1" delay="235"/>
			<enemy name="unit1" delay="236"/>
			<enemy name="unit1" delay="237"/>
			<enemy name="unit1" delay="238"/>
			<enemy name="unit1" delay="239"/>
			<enemy name="unit1" delay="240"/>
			<enemy name="unit1" delay="241"/>
			<enemy name="unit1" delay="242"/>
			<enemy name="unit1" delay="243"/>
			<enemy name="unit1" delay="244"/>
			<enemy name="unit1" delay="245"/>
			<enemy name="unit1" delay="246"/>
			<enemy name="unit1" delay="247"/>
			<enemy name="unit1" delay="248"/>
			<enemy name="unit1" delay="249"/>
			<enemy name="unit1" delay="250"/>
			
			<enemy name="unit1" delay="261"/>
			<enemy name="unit1" delay="262"/>
			<enemy name="unit1" delay="263"/>
			<enemy name="unit1" delay="264"/>
			<enemy name="unit1" delay="265"/>
			<enemy name="unit1" delay="266"/>
			<enemy name="unit1" delay="267"/>
			<enemy name="unit1" delay="268"/>
			<enemy name="unit1" delay="269"/>
			<enemy name="unit1" delay="270"/>
			<enemy name="unit1" delay="271"/>
			<enemy name="unit1" delay="272"/>
			<enemy name="unit1" delay="273"/>
			<enemy name="unit1" delay="274"/>
			<enemy name="unit1" delay="275"/>
			<enemy name="unit1" delay="276"/>
			<enemy name="unit1" delay="277"/>
			<enemy name="unit1" delay="278"/>
			<enemy name="unit1" delay="279"/>
			<enemy name="unit1" delay="280"/>
			<enemy name="unit1" delay="281"/>
			<enemy name="unit1" delay="282"/>
			<enemy name="unit1" delay="283"/>
			<enemy name="unit1" delay="284"/>
			<enemy name="unit1" delay="285"/>
			<enemy name="unit1" delay="286"/>
			<enemy name="unit1" delay="287"/>
			<enemy name="unit1" delay="288"/>
			<enemy name="unit1" delay="289"/>
			<enemy name="unit1" delay="290"/>
			<enemy name="unit1" delay="291"/>
			<enemy name="unit1" delay="292"/>
			<enemy name="unit1" delay="293"/>
			<enemy name="unit1" delay="294"/>
			<enemy name="unit1" delay="295"/>
			<enemy name="unit1" delay="296"/>
			<enemy name="unit1" delay="297"/>
			<enemy name="unit1" delay="298"/>
			<enemy name="unit1" delay="299"/>
			<enemy name="unit1" delay="300"/>
			
			<!-- unit2  -->
			<enemy name="unit2" delay="80"/>
			<enemy name="unit2" delay="82"/>
			<enemy name="unit2" delay="84"/>
			<enemy name="unit2" delay="86"/>
			<enemy name="unit2" delay="88"/>
			<enemy name="unit2" delay="90"/>
			<enemy name="unit2" delay="92"/>
			<enemy name="unit2" delay="94"/>
			<enemy name="unit2" delay="96"/>
			<enemy name="unit2" delay="98"/>
			<enemy name="unit2" delay="100"/>
			
			<enemy name="unit2" delay="120"/>
			<enemy name="unit2" delay="122"/>
			<enemy name="unit2" delay="124"/>
			<enemy name="unit2" delay="126"/>
			<enemy name="unit2" delay="128"/>
			<enemy name="unit2" delay="130"/>
			<enemy name="unit2" delay="132"/>
			<enemy name="unit2" delay="134"/>
			<enemy name="unit2" delay="136"/>
			<enemy name="unit2" delay="138"/>
			<enemy name="unit2" delay="140"/>
			<enemy name="unit2" delay="142"/>
			<enemy name="unit2" delay="144"/>
			<enemy name="unit2" delay="146"/>
			<enemy name="unit2" delay="148"/>
			<enemy name="unit2" delay="150"/>
			
			<enemy name="unit2" delay="170"/>
			<enemy name="unit2" delay="172"/>
			<enemy name="unit2" delay="174"/>
			<enemy name="unit2" delay="176"/>
			<enemy name="unit2" delay="178"/>
			<enemy name="unit2" delay="180"/>
			<enemy name="unit2" delay="182"/>
			<enemy name="unit2" delay="184"/>
			<enemy name="unit2" delay="186"/>
			<enemy name="unit2" delay="188"/>
			<enemy name="unit2" delay="190"/>
			<enemy name="unit2" delay="192"/>
			<enemy name="unit2" delay="194"/>
			<enemy name="unit2" delay="196"/>
			<enemy name="unit2" delay="198"/>
			<enemy name="unit2" delay="200"/>
			
			<enemy name="unit2" delay="230"/>
			<enemy name="unit2" delay="232"/>
			<enemy name="unit2" delay="234"/>
			<enemy name="unit2" delay="236"/>
			<enemy name="unit2" delay="238"/>
			<enemy name="unit2" delay="240"/>
			<enemy name="unit2" delay="242"/>
			<enemy name="unit2" delay="244"/>
			<enemy name="unit2" delay="246"/>
			<enemy name="unit2" delay="248"/>
			<enemy name="unit2" delay="252"/>
			<enemy name="unit2" delay="254"/>
			<enemy name="unit2" delay="256"/>
			<enemy name="unit2" delay="258"/>
			<enemy name="unit2" delay="260"/>
			<enemy name="unit2" delay="262"/>
			<enemy name="unit2" delay="264"/>
			<enemy name="unit2" delay="266"/>
			<enemy name="unit2" delay="268"/>
			<enemy name="unit2" delay="270"/>
			<enemy name="unit2" delay="272"/>
			<enemy name="unit2" delay="274"/>
			<enemy name="unit2" delay="276"/>
			<enemy name="unit2" delay="278"/>
			<enemy name="unit2" delay="280"/>
			<enemy name="unit2" delay="282"/>
			<enemy name="unit2" delay="284"/>
			<enemy name="unit2" delay="286"/>
			<enemy name="unit2" delay="288"/>
			<enemy name="unit2" delay="290"/>
			<enemy name="unit2" delay="292"/>
			<enemy name="unit2" delay="294"/>
			
			<enemy name="airplane" delay="180"/>
			<enemy name="airplane" delay="185"/>
			<enemy name="airplane" delay="190"/>
			<enemy name="airplane" delay="195"/>
			
			<!-- tanket  -->
			<enemy name="tanket" delay="20"/>
			<enemy name="tanket" delay="25"/>
			<enemy name="tanket" delay="30"/>
			<enemy name="tanket" delay="35"/>
			<enemy name="tanket" delay="40"/>
			<enemy name="tanket" delay="43"/>
			<enemy name="tanket" delay="46"/>
			<enemy name="tanket" delay="49"/>
			
			<!-- car or balloon  -->
			<enemy name="balloon" delay="40"/>
			<enemy name="balloon" delay="44"/>
			<enemy name="balloon" delay="48"/>
			<enemy name="balloon" delay="52"/>
			<enemy name="balloon" delay="56"/>
			<enemy name="balloon" delay="60"/>
			<enemy name="balloon" delay="63"/>
			<enemy name="balloon" delay="66"/>
			<enemy name="balloon" delay="69"/>
			<enemy name="balloon" delay="72"/>
			<enemy name="balloon" delay="75"/>
			<enemy name="balloon" delay="78"/>
			
			<!-- cars -->
			<enemy name="car" delay="90"/>
			<enemy name="car" delay="100"/>
			<enemy name="car" delay="110"/>
			<enemy name="car" delay="120"/>
			<enemy name="car" delay="130"/>
			<enemy name="car" delay="140"/>
			<enemy name="car" delay="150"/>
			<enemy name="car" delay="170"/>
			<enemy name="car" delay="190"/>
			<enemy name="car" delay="220"/>
			<enemy name="car" delay="260"/>
			
			<!-- aerostat or tank1 -->
			<enemy name="tank1" delay="85"/>
			<enemy name="tank1" delay="95"/>
			<enemy name="tank1" delay="105"/>
			<enemy name="tank1" delay="115"/>
			
			<!-- aerostats  -->
			<enemy name="aerostat" delay="120"/>
			<enemy name="aerostat" delay="130"/>
			<enemy name="aerostat" delay="140"/>
			<enemy name="aerostat" delay="160"/>
			<enemy name="aerostat" delay="200"/>
			<enemy name="aerostat" delay="240"/>
			<enemy name="aerostat" delay="280"/>
			
			<!-- tanks -->
			<enemy name="tank1" delay="140"/>
			<enemy name="tank2" delay="160"/>
			<enemy name="tank1" delay="180"/>
			<enemy name="tank2" delay="200"/>
			<enemy name="tank1" delay="220"/>
			<enemy name="tank2" delay="240"/>
			<enemy name="tank1" delay="260"/>
			<enemy name="tank1" delay="280"/>
			
			<enemy name="tank3" delay="170"/>
			<enemy name="tank3" delay="200"/>
			
			<!-- parashuts -->
			<enemy name="parashut" delay="180"/>
			<enemy name="parashut" delay="183"/>
			<enemy name="parashut" delay="186"/>
			<enemy name="parashut" delay="190"/>
			<enemy name="parashut" delay="193"/>
			<enemy name="parashut" delay="196"/>
			<enemy name="parashut" delay="200"/>
			<enemy name="parashut" delay="203"/>
			<enemy name="parashut" delay="206"/>
			<enemy name="parashut" delay="210"/>
			<enemy name="parashut" delay="203"/>
			<enemy name="parashut" delay="216"/>
			<enemy name="parashut" delay="220"/>
			<enemy name="parashut" delay="223"/>
			<enemy name="parashut" delay="226"/>
			<enemy name="parashut" delay="230"/>
			<enemy name="parashut" delay="233"/>
			<enemy name="parashut" delay="236"/>
			<enemy name="parashut" delay="240"/>
			<enemy name="parashut" delay="243"/>
			<enemy name="parashut" delay="246"/>
			<enemy name="parashut" delay="250"/>
			<enemy name="parashut" delay="253"/>
			<enemy name="parashut" delay="256"/>
			<enemy name="parashut" delay="260"/>
			
			<!-- Heli or walker  -->
			<enemy name="heli" delay="190"/>
			<enemy name="heli" delay="194"/>
			<enemy name="heli" delay="198"/>
			<enemy name="heli" delay="200"/>
			<enemy name="heli" delay="204"/>
			<enemy name="heli" delay="208"/>
			<enemy name="heli" delay="212"/>
			<enemy name="heli" delay="216"/>
			<enemy name="heli" delay="220"/>
			<enemy name="heli" delay="225"/>
			<enemy name="heli" delay="230"/>
			
			<!-- heli -->
			<enemy name="heli" delay="260"/>
			<enemy name="heli" delay="270"/>
			<enemy name="heli" delay="280"/>
			<enemy name="heli" delay="290"/>
			
			<!-- walker -->
			<enemy name="walker1" delay="10"/>
			<enemy name="walker1" delay="30"/>
			<enemy name="walker1" delay="90"/>
			<enemy name="walker1" delay="255"/>
			<enemy name="walker1" delay="265"/>
			<enemy name="walker2" delay="275"/>
			<enemy name="walker2" delay="285"/>
			
		<!-- ////////////////////////////////////////////////////////////////////////////////////// -->
		<!-- ////////////////////////////////////////////////////////////////////////////////////// -->
		<!-- ////////////////////////////////////////////////////////////////////////////////////// -->
		</wave>
		<wave pause="0" lifeTime="10" side="right" img="1">
		<!-- ////////////////////////////////////////////////////////////////////////////////////// -->
		<!-- ////////////////////////////////////////////////////////////////////////////////////// -->
		<!-- ////////////////////////////////////////////////////////////////////////////////////// -->
		<enemy name="unit1" delay="1"/>
			<enemy name="unit1" delay="2"/>
			<enemy name="unit1" delay="3"/>
			<enemy name="unit1" delay="4"/>
			<enemy name="unit1" delay="5"/>
			<enemy name="unit1" delay="6"/>
			<enemy name="unit1" delay="7"/>
			<enemy name="unit1" delay="8"/>
			<enemy name="unit1" delay="9"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="12"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit1" delay="17"/>
			<enemy name="unit1" delay="19"/>
			<enemy name="unit1" delay="10"/>
			<enemy name="unit1" delay="11"/>
			<enemy name="unit1" delay="12"/>
			<enemy name="unit1" delay="13"/>
			<enemy name="unit1" delay="14"/>
			<enemy name="unit1" delay="15"/>
			<enemy name="unit1" delay="16"/>
			<enemy name="unit1" delay="17"/>
			<enemy name="unit1" delay="19"/>
			<enemy name="unit1" delay="20"/>
			<enemy name="unit1" delay="21"/>
			<enemy name="unit1" delay="22"/>
			<enemy name="unit1" delay="23"/>
			<enemy name="unit1" delay="24"/>
			<enemy name="unit1" delay="25"/>
			<enemy name="unit1" delay="26"/>
			<enemy name="unit1" delay="27"/>
			<enemy name="unit1" delay="28"/>
			<enemy name="unit1" delay="29"/>
			<enemy name="unit1" delay="30"/>
			
			<enemy name="unit1" delay="50"/>
			<enemy name="unit1" delay="51"/>
			<enemy name="unit1" delay="52"/>
			<enemy name="unit1" delay="53"/>
			<enemy name="unit1" delay="54"/>
			<enemy name="unit1" delay="55"/>
			<enemy name="unit1" delay="56"/>
			<enemy name="unit1" delay="57"/>
			<enemy name="unit1" delay="58"/>
			<enemy name="unit1" delay="59"/>
			<enemy name="unit1" delay="60"/>
			
			<enemy name="unit1" delay="71"/>
			<enemy name="unit1" delay="72"/>
			<enemy name="unit1" delay="73"/>
			<enemy name="unit1" delay="74"/>
			<enemy name="unit1" delay="75"/>
			<enemy name="unit1" delay="76"/>
			<enemy name="unit1" delay="77"/>
			<enemy name="unit1" delay="78"/>
			<enemy name="unit1" delay="79"/>
			<enemy name="unit1" delay="80"/>
			<enemy name="unit1" delay="81"/>
			<enemy name="unit1" delay="82"/>
			<enemy name="unit1" delay="83"/>
			<enemy name="unit1" delay="84"/>
			<enemy name="unit1" delay="85"/>
			<enemy name="unit1" delay="86"/>
			<enemy name="unit1" delay="87"/>
			<enemy name="unit1" delay="88"/>
			<enemy name="unit1" delay="89"/>
			<enemy name="unit1" delay="90"/>
			<enemy name="unit1" delay="101"/>
			<enemy name="unit1" delay="102"/>
			<enemy name="unit1" delay="103"/>
			<enemy name="unit1" delay="104"/>
			<enemy name="unit1" delay="105"/>
			<enemy name="unit1" delay="106"/>
			<enemy name="unit1" delay="107"/>
			<enemy name="unit1" delay="108"/>
			<enemy name="unit1" delay="109"/>
			<enemy name="unit1" delay="110"/>
			<enemy name="unit1" delay="111"/>
			<enemy name="unit1" delay="112"/>
			<enemy name="unit1" delay="113"/>
			<enemy name="unit1" delay="114"/>
			<enemy name="unit1" delay="115"/>
			<enemy name="unit1" delay="116"/>
			<enemy name="unit1" delay="117"/>
			<enemy name="unit1" delay="118"/>
			<enemy name="unit1" delay="119"/>
			<enemy name="unit1" delay="120"/>
			
			<enemy name="unit1" delay="151"/>
			<enemy name="unit1" delay="152"/>
			<enemy name="unit1" delay="153"/>
			<enemy name="unit1" delay="154"/>
			<enemy name="unit1" delay="155"/>
			<enemy name="unit1" delay="156"/>
			<enemy name="unit1" delay="157"/>
			<enemy name="unit1" delay="158"/>
			<enemy name="unit1" delay="159"/>
			<enemy name="unit1" delay="160"/>
			<enemy name="unit1" delay="161"/>
			<enemy name="unit1" delay="162"/>
			<enemy name="unit1" delay="163"/>
			<enemy name="unit1" delay="164"/>
			<enemy name="unit1" delay="165"/>
			<enemy name="unit1" delay="166"/>
			<enemy name="unit1" delay="167"/>
			<enemy name="unit1" delay="168"/>
			<enemy name="unit1" delay="169"/>
			<enemy name="unit1" delay="170"/>
			<enemy name="unit1" delay="171"/>
			<enemy name="unit1" delay="172"/>
			<enemy name="unit1" delay="173"/>
			<enemy name="unit1" delay="174"/>
			<enemy name="unit1" delay="175"/>
			<enemy name="unit1" delay="176"/>
			<enemy name="unit1" delay="177"/>
			<enemy name="unit1" delay="178"/>
			<enemy name="unit1" delay="179"/>
			<enemy name="unit1" delay="180"/>
			
			<enemy name="unit1" delay="221"/>
			<enemy name="unit1" delay="222"/>
			<enemy name="unit1" delay="223"/>
			<enemy name="unit1" delay="224"/>
			<enemy name="unit1" delay="225"/>
			<enemy name="unit1" delay="226"/>
			<enemy name="unit1" delay="227"/>
			<enemy name="unit1" delay="228"/>
			<enemy name="unit1" delay="229"/>
			<enemy name="unit1" delay="230"/>
			<enemy name="unit1" delay="231"/>
			<enemy name="unit1" delay="232"/>
			<enemy name="unit1" delay="233"/>
			<enemy name="unit1" delay="234"/>
			<enemy name="unit1" delay="235"/>
			<enemy name="unit1" delay="236"/>
			<enemy name="unit1" delay="237"/>
			<enemy name="unit1" delay="238"/>
			<enemy name="unit1" delay="239"/>
			<enemy name="unit1" delay="240"/>
			<enemy name="unit1" delay="241"/>
			<enemy name="unit1" delay="242"/>
			<enemy name="unit1" delay="243"/>
			<enemy name="unit1" delay="244"/>
			<enemy name="unit1" delay="245"/>
			<enemy name="unit1" delay="246"/>
			<enemy name="unit1" delay="247"/>
			<enemy name="unit1" delay="248"/>
			<enemy name="unit1" delay="249"/>
			<enemy name="unit1" delay="250"/>
			
			<enemy name="unit1" delay="261"/>
			<enemy name="unit1" delay="262"/>
			<enemy name="unit1" delay="263"/>
			<enemy name="unit1" delay="264"/>
			<enemy name="unit1" delay="265"/>
			<enemy name="unit1" delay="266"/>
			<enemy name="unit1" delay="267"/>
			<enemy name="unit1" delay="268"/>
			<enemy name="unit1" delay="269"/>
			<enemy name="unit1" delay="270"/>
			<enemy name="unit1" delay="271"/>
			<enemy name="unit1" delay="272"/>
			<enemy name="unit1" delay="273"/>
			<enemy name="unit1" delay="274"/>
			<enemy name="unit1" delay="275"/>
			<enemy name="unit1" delay="276"/>
			<enemy name="unit1" delay="277"/>
			<enemy name="unit1" delay="278"/>
			<enemy name="unit1" delay="279"/>
			<enemy name="unit1" delay="280"/>
			<enemy name="unit1" delay="281"/>
			<enemy name="unit1" delay="282"/>
			<enemy name="unit1" delay="283"/>
			<enemy name="unit1" delay="284"/>
			<enemy name="unit1" delay="285"/>
			<enemy name="unit1" delay="286"/>
			<enemy name="unit1" delay="287"/>
			<enemy name="unit1" delay="288"/>
			<enemy name="unit1" delay="289"/>
			<enemy name="unit1" delay="290"/>
			<enemy name="unit1" delay="291"/>
			<enemy name="unit1" delay="292"/>
			<enemy name="unit1" delay="293"/>
			<enemy name="unit1" delay="294"/>
			<enemy name="unit1" delay="295"/>
			<enemy name="unit1" delay="296"/>
			<enemy name="unit1" delay="297"/>
			<enemy name="unit1" delay="298"/>
			<enemy name="unit1" delay="299"/>
			<enemy name="unit1" delay="300"/>
			
			<!-- unit2  -->
			<enemy name="unit2" delay="80"/>
			<enemy name="unit2" delay="82"/>
			<enemy name="unit2" delay="84"/>
			<enemy name="unit2" delay="86"/>
			<enemy name="unit2" delay="88"/>
			<enemy name="unit2" delay="90"/>
			<enemy name="unit2" delay="92"/>
			<enemy name="unit2" delay="94"/>
			<enemy name="unit2" delay="96"/>
			<enemy name="unit2" delay="98"/>
			<enemy name="unit2" delay="100"/>
			
			<enemy name="unit2" delay="120"/>
			<enemy name="unit2" delay="122"/>
			<enemy name="unit2" delay="124"/>
			<enemy name="unit2" delay="126"/>
			<enemy name="unit2" delay="128"/>
			<enemy name="unit2" delay="130"/>
			<enemy name="unit2" delay="132"/>
			<enemy name="unit2" delay="134"/>
			<enemy name="unit2" delay="136"/>
			<enemy name="unit2" delay="138"/>
			<enemy name="unit2" delay="140"/>
			<enemy name="unit2" delay="142"/>
			<enemy name="unit2" delay="144"/>
			<enemy name="unit2" delay="146"/>
			<enemy name="unit2" delay="148"/>
			<enemy name="unit2" delay="150"/>
			
			<enemy name="unit2" delay="170"/>
			<enemy name="unit2" delay="172"/>
			<enemy name="unit2" delay="174"/>
			<enemy name="unit2" delay="176"/>
			<enemy name="unit2" delay="178"/>
			<enemy name="unit2" delay="180"/>
			<enemy name="unit2" delay="182"/>
			<enemy name="unit2" delay="184"/>
			<enemy name="unit2" delay="186"/>
			<enemy name="unit2" delay="188"/>
			<enemy name="unit2" delay="190"/>
			<enemy name="unit2" delay="192"/>
			<enemy name="unit2" delay="194"/>
			<enemy name="unit2" delay="196"/>
			<enemy name="unit2" delay="198"/>
			<enemy name="unit2" delay="200"/>
			
			<enemy name="unit2" delay="230"/>
			<enemy name="unit2" delay="232"/>
			<enemy name="unit2" delay="234"/>
			<enemy name="unit2" delay="236"/>
			<enemy name="unit2" delay="238"/>
			<enemy name="unit2" delay="240"/>
			<enemy name="unit2" delay="242"/>
			<enemy name="unit2" delay="244"/>
			<enemy name="unit2" delay="246"/>
			<enemy name="unit2" delay="248"/>
			<enemy name="unit2" delay="252"/>
			<enemy name="unit2" delay="254"/>
			<enemy name="unit2" delay="256"/>
			<enemy name="unit2" delay="258"/>
			<enemy name="unit2" delay="260"/>
			<enemy name="unit2" delay="262"/>
			<enemy name="unit2" delay="264"/>
			<enemy name="unit2" delay="266"/>
			<enemy name="unit2" delay="268"/>
			<enemy name="unit2" delay="270"/>
			<enemy name="unit2" delay="272"/>
			<enemy name="unit2" delay="274"/>
			<enemy name="unit2" delay="276"/>
			<enemy name="unit2" delay="278"/>
			<enemy name="unit2" delay="280"/>
			<enemy name="unit2" delay="282"/>
			<enemy name="unit2" delay="284"/>
			<enemy name="unit2" delay="286"/>
			<enemy name="unit2" delay="288"/>
			<enemy name="unit2" delay="290"/>
			<enemy name="unit2" delay="292"/>
			<enemy name="unit2" delay="294"/>
			
			<!-- tanket  -->
			<enemy name="tanket" delay="20"/>
			<enemy name="tanket" delay="25"/>
			<enemy name="tanket" delay="30"/>
			<enemy name="tanket" delay="35"/>
			<enemy name="tanket" delay="40"/>
			<enemy name="tanket" delay="43"/>
			<enemy name="tanket" delay="46"/>
			<enemy name="tanket" delay="49"/>
			
			<!-- car or balloon  -->
		
			<enemy name="car" delay="40"/>
			<enemy name="car" delay="45"/>
			<enemy name="car" delay="50"/>
			<enemy name="car" delay="55"/>
			<enemy name="car" delay="60"/>
			<enemy name="car" delay="65"/>
			<enemy name="car" delay="70"/>
			<enemy name="car" delay="75"/>
			
			<!-- cars -->
			<enemy name="car" delay="90"/>
			<enemy name="car" delay="100"/>
			<enemy name="car" delay="110"/>
			<enemy name="car" delay="120"/>
			<enemy name="car" delay="130"/>
			<enemy name="car" delay="140"/>
			<enemy name="car" delay="150"/>
			<enemy name="car" delay="170"/>
			<enemy name="car" delay="190"/>
			<enemy name="car" delay="220"/>
			<enemy name="car" delay="260"/>
			
			<!-- aerostat or tank1 -->
			<enemy name="aerostat" delay="80"/>
			<enemy name="aerostat" delay="85"/>
			<enemy name="aerostat" delay="90"/>
			<enemy name="aerostat" delay="95"/>
			<enemy name="aerostat" delay="100"/>
			<enemy name="aerostat" delay="105"/>
			<enemy name="aerostat" delay="110"/>
			
			<!-- aerostats  -->
			<enemy name="aerostat" delay="120"/>
			<enemy name="aerostat" delay="130"/>
			<enemy name="aerostat" delay="140"/>
			<enemy name="aerostat" delay="160"/>
			<enemy name="aerostat" delay="200"/>
			<enemy name="aerostat" delay="240"/>
			<enemy name="aerostat" delay="280"/>
			
			<!-- tanks -->
			<enemy name="tank1" delay="140"/>
			<enemy name="tank2" delay="160"/>
			<enemy name="tank1" delay="180"/>
			<enemy name="tank2" delay="200"/>
			<enemy name="tank1" delay="220"/>
			<enemy name="tank2" delay="240"/>
			<enemy name="tank2" delay="260"/>
			<enemy name="tank1" delay="280"/>
			
			<enemy name="tank3" delay="150"/>
			<enemy name="tank3" delay="200"/>
			
			
			<!-- parashuts -->
			<enemy name="parashut" delay="180"/>
			<enemy name="parashut" delay="183"/>
			<enemy name="parashut" delay="186"/>
			<enemy name="parashut" delay="190"/>
			<enemy name="parashut" delay="193"/>
			<enemy name="parashut" delay="196"/>
			<enemy name="parashut" delay="200"/>
			<enemy name="parashut" delay="203"/>
			<enemy name="parashut" delay="206"/>
			<enemy name="parashut" delay="210"/>
			<enemy name="parashut" delay="203"/>
			<enemy name="parashut" delay="216"/>
			<enemy name="parashut" delay="220"/>
			<enemy name="parashut" delay="223"/>
			<enemy name="parashut" delay="226"/>
			<enemy name="parashut" delay="230"/>
			<enemy name="parashut" delay="233"/>
			<enemy name="parashut" delay="236"/>
			<enemy name="parashut" delay="240"/>
			<enemy name="parashut" delay="243"/>
			<enemy name="parashut" delay="246"/>
			<enemy name="parashut" delay="250"/>
			<enemy name="parashut" delay="253"/>
			<enemy name="parashut" delay="256"/>
			<enemy name="parashut" delay="260"/>
			
			<enemy name="airplane" delay="180"/>
			<enemy name="airplane" delay="185"/>
			<enemy name="airplane" delay="190"/>
			<enemy name="airplane" delay="195"/>
			
			<!-- Heli or walker  -->
			<enemy name="walker1" delay="190"/>
			<enemy name="walker1" delay="200"/>
			<enemy name="walker1" delay="212"/>
			<enemy name="walker1" delay="225"/>
			
			<!-- heli -->
			<enemy name="heli" delay="260"/>
			<enemy name="heli" delay="270"/>
			<enemy name="heli" delay="280"/>
			<enemy name="heli" delay="290"/>
			
			<!-- walker -->
			<enemy name="walker1" delay="40"/>
			<enemy name="walker1" delay="60"/>
			<enemy name="walker1" delay="120"/>
			<enemy name="walker1" delay="255"/>
			<enemy name="walker1" delay="265"/>
			<enemy name="walker2" delay="275"/>
			<enemy name="walker2" delay="285"/>
			
		</wave>
	</group>
</level>;
            this.levelsChallenge.push(_loc_17);
            this.levelsChallenge.push(_loc_18);
            this.levelsChallenge.push(_loc_19);
            this.levelsChallenge.push(_loc_20);
            this.levelsChallenge.push(_loc_21);
            this.levelsChallenge.push(_loc_22);
            this.levelsChallenge.push(_loc_23);
            this.levelsChallenge.push(_loc_24);
            this.levelsChallenge.push(_loc_25);
            this.levelsChallenge.push(_loc_26);
            this.levelsChallenge.push(_loc_27);
            this.levelsChallenge.push(_loc_28);
            this.levelsChallenge.push(_loc_29);
            this.levelsChallenge.push(_loc_30);
            this.levelsChallenge.push(_loc_31);
            return;
        }// end function

        public function getWaveGroupIndex() : int
        {
            return this.curWaveGroupIndex;
        }// end function

        public function totalWaveGroups() : int
        {
            return this.waveGroups.length;
        }// end function

        public function showFirstIcons() : void
        {
            this.waveGroups[0].showFirstWaveIcons();
            return;
        }// end function

        public function initializeLevel(param1:int) : void
        {
            var _loc_2:XML = null;
            var _loc_3:int = 0;
            var _loc_4:WaveGroup = null;
            var _loc_5:XML = null;
            var _loc_6:Cannon = null;
            var _loc_7:int = 0;
            var _loc_8:int = 0;
            var _loc_9:int = 0;
            var _loc_10:String = null;
            var _loc_11:int = 0;
            Saves.load();
            this.isChallenge = Level.isChallenge;
            this.curLevel = param1;
            if (this.isChallenge)
            {
                this.curLevelXml = this.levelsChallenge[param1];
            }
            else
            {
                this.curLevelXml = this.levels[param1];
            }
            if (this.curLevelXml.attribute("preStartMoney") != undefined)
            {
                this.preStartMoney = parseInt(this.curLevelXml.attribute("preStartMoney"));
            }
            else
            {
                this.preStartMoney = 0;
            }
            if (this.curLevelXml.attribute("bg") != undefined)
            {
                this.level.setBackground(parseInt(this.curLevelXml.attribute("bg")));
            }
            this.twoStarHealth = parseInt(this.curLevelXml.attribute("twoStarHealth")) / 100 * Level.maxHealth;
            this.threeStarHealth = parseInt(this.curLevelXml.attribute("threeStarHealth")) / 100 * Level.maxHealth;
            this.maxFloorsCount = parseInt(this.curLevelXml.attribute("maxTower"));
            this.maxCannonsCount = this.maxFloorsCount * 2;
            this.maxUpgradeIndex = parseInt(this.curLevelXml.attribute("maxUpgrade"));
            this.upgradeTwo = this.curLevelXml.attribute("upgradeTwo") == "true";
            this.level.tower.eyeActivity = this.curLevelXml.attribute("eye");
            this.level.initMoney = parseInt(this.curLevelXml.attribute("money"));
            if (this.waveGroups)
            {
                _loc_3 = 0;
                while (_loc_3 < this.waveGroups.length)
                {
                    
                    this.waveGroups[_loc_3].dispose();
                    _loc_3++;
                }
            }
            this.waveGroups = new Vector.<WaveGroup>;
            this.gameStarted = false;
            for each (_loc_2 in this.curLevelXml.group)
            {
                
                _loc_4 = new WaveGroup(this);
                this.waveGroups.push(_loc_4);
            }
            this.curWaveGroupIndex = 0;
            if (this.curWaveGroups)
            {
                _loc_3 = 0;
                while (_loc_3 < this.curWaveGroups.length)
                {
                    
                    this.curWaveGroups[_loc_3].dispose();
                    _loc_3++;
                }
            }
            this.curWaveGroups = new Vector.<WaveGroup>;
            this.curWaveGroups.push(this.waveGroups[0]);
            this.waveGroups[0].initialize(this.curLevelXml.group[this.curWaveGroupIndex]);
            LevelChallengeSettings.isChallenge = this.isChallenge;
            if (this.isChallenge)
            {
                if (this.curLevelXml.settings != undefined)
                {
                    LevelChallengeSettings.towerLevel = parseInt(this.curLevelXml.settings.attribute("towerLevel"));
                    LevelChallengeSettings.towerHealth = parseInt(this.curLevelXml.settings.attribute("towerHealth"));
                    LevelChallengeSettings.globalUpgrades = parseInt(this.curLevelXml.settings.attribute("globalUpgrades"));
                    LevelChallengeSettings.maxCannons = parseInt(this.curLevelXml.settings.attribute("maxCannons"));
                    LevelChallengeSettings.machinegun = this.curLevelXml.settings.attribute("machinegun") == "true";
                    LevelChallengeSettings.heavygun = this.curLevelXml.settings.attribute("heavygun") == "true";
                    LevelChallengeSettings.lightning = this.curLevelXml.settings.attribute("lightning") == "true";
                    LevelChallengeSettings.saws = this.curLevelXml.settings.attribute("saws") == "true";
                    this.maxCannonsCount = LevelChallengeSettings.maxCannons;
                    this.level.tower.setFloorsCount(LevelChallengeSettings.towerLevel);
                    this.level.health = LevelChallengeSettings.towerHealth;
                    Upgrades.setTowerUpgr(LevelChallengeSettings.globalUpgrades);
                    Upgrades.setMachineGunUpgr(LevelChallengeSettings.globalUpgrades);
                    Upgrades.setHeavyGunUpgr(LevelChallengeSettings.globalUpgrades);
                    Upgrades.setSawsUpgr(LevelChallengeSettings.globalUpgrades);
                    Upgrades.setLightningUpgr(LevelChallengeSettings.globalUpgrades);
                    if (this.curLevelXml.settings.cannon != undefined)
                    {
                        for each (_loc_5 in this.curLevelXml.settings.cannon)
                        {
                            
                            _loc_7 = parseInt(_loc_5.attribute("row"));
                            _loc_8 = parseInt(_loc_5.attribute("col"));
                            _loc_9 = parseInt(_loc_5.attribute("upgr"));
                            _loc_10 = _loc_5.attribute("name");
                            if (_loc_10 == "machinegun")
                            {
                                _loc_6 = new CannonMachineGun();
                            }
                            else if (_loc_10 == "heavygun")
                            {
                                _loc_6 = new CannonHeavyGun();
                            }
                            else if (_loc_10 == "lightning")
                            {
                                _loc_6 = new CannonElectroGun();
                            }
                            else
                            {
                                _loc_6 = new CannonSawGun();
                            }
                            _loc_6.upgradeInd = _loc_9;
                            this.level.tower.addCannon(_loc_7, _loc_8, _loc_6);
                            if (_loc_9 > 0)
                            {
                                _loc_11 = _loc_6.totalMoney;
                                if (_loc_9 >= 1)
                                {
                                    _loc_11 = _loc_11 + _loc_6.getUpgradePrice(1);
                                }
                                if (_loc_9 == 2 || _loc_9 == 3)
                                {
                                    _loc_11 = _loc_11 + _loc_6.getUpgradePrice(2);
                                    if (_loc_9 == 3)
                                    {
                                        _loc_11 = _loc_11 + _loc_6.getUpgradePrice(3);
                                    }
                                }
                                if (_loc_9 == 4 || _loc_9 == 5)
                                {
                                    _loc_11 = _loc_11 + _loc_6.getUpgradePrice(4);
                                    if (_loc_9 == 5)
                                    {
                                        _loc_11 = _loc_11 + _loc_6.getUpgradePrice(5);
                                    }
                                }
                                _loc_6.totalMoney = _loc_11;
                            }
                        }
                    }
                }
            }
            return;
        }// end function

        public function startWaves(event:MouseEvent = null) : void
        {
            if (!this.gameStarted)
            {
                this.gameStarted = true;
                this.level.onFirstWaveStart();
                TweenLite.delayedCall(1.7, SoundManager.playLoop, ["snd_game1", 0.8]);
            }
            return;
        }// end function

        public function isEnded() : Boolean
        {
            var _loc_1:int = 0;
            if (this.gameStarted)
            {
                if (this.curWaveGroupIndex >= this.waveGroups.length)
                {
                    _loc_1 = 0;
                    while (_loc_1 < this.curWaveGroups.length)
                    {
                        
                        if (!this.curWaveGroups[_loc_1].isEnded())
                        {
                            return false;
                        }
                        _loc_1++;
                    }
                    return true;
                }
            }
            return false;
        }// end function

        public function update() : void
        {
            var _loc_1:Boolean = false;
            var _loc_2:int = 0;
            var _loc_3:WaveGroup = null;
            var _loc_4:WaveGroup = null;
            if (!this.gameStarted)
            {
                return;
            }
            if (!this.isEnded())
            {
                _loc_1 = false;
                _loc_2 = this.curWaveGroups.length - 1;
                while (_loc_2 >= 0)
                {
                    
                    _loc_3 = this.curWaveGroups[_loc_2];
                    _loc_3.update();
                    if (_loc_3.isEnded())
                    {
                        this.curWaveGroups.splice(_loc_2, 1);
                    }
                    if (_loc_3.isTimeEnded() || _loc_3.isEnded())
                    {
                        if (this.waveGroups.indexOf(_loc_3) == this.curWaveGroupIndex)
                        {
                            _loc_1 = true;
                        }
                    }
                    _loc_2 = _loc_2 - 1;
                }
                if (_loc_1)
                {
                    var _loc_5:String = this;
                    var _loc_6:* = this.curWaveGroupIndex + 1;
                    _loc_5.curWaveGroupIndex = _loc_6;
                    if (this.curWaveGroupIndex < this.waveGroups.length)
                    {
                        _loc_4 = this.waveGroups[this.curWaveGroupIndex];
                        this.curWaveGroups.push(_loc_4);
                        _loc_4.initialize(this.curLevelXml.group[this.curWaveGroupIndex]);
                    }
                }
            }
            return;
        }// end function

        public function createEnemy(param1:String, param2:String, param3:Number = 0, param4:Number = 0) : Enemy
        {
            var _loc_5:Enemy = null;
            if (this.level.state != GameState.GAME && this.level.state != GameState.HELP)
            {
                throw "создается враг вне игрового состояния";
            }
            switch(param1)
            {
                case "airplane":
                {
                    _loc_5 = new Airplane();
                    break;
                }
                case "car":
                {
                    _loc_5 = new Car();
                    break;
                }
                case "heli":
                {
                    _loc_5 = new Helicopter();
                    break;
                }
                case "tank1":
                {
                    _loc_5 = new Tank1();
                    break;
                }
                case "tank2":
                {
                    _loc_5 = new Tank2();
                    break;
                }
                case "tank3":
                {
                    _loc_5 = new Tank3();
                    break;
                }
                case "tank4":
                {
                    _loc_5 = new Tank4();
                    break;
                }
                case "unit1":
                {
                    _loc_5 = new Unit1();
                    break;
                }
                case "unit2":
                {
                    _loc_5 = new Unit2();
                    break;
                }
                case "wheel":
                {
                    _loc_5 = new Wheel();
                    break;
                }
                case "walker1":
                {
                    _loc_5 = new Walker1();
                    break;
                }
                case "walker2":
                {
                    _loc_5 = new Walker2();
                    break;
                }
                case "aerostat":
                {
                    _loc_5 = new Aerostat();
                    break;
                }
                case "airship":
                {
                    _loc_5 = new Airship();
                    break;
                }
                case "parashut":
                {
                    _loc_5 = new Parashutist();
                    break;
                }
                case "tanket":
                {
                    _loc_5 = new Tanket();
                    break;
                }
                case "balloon":
                {
                    _loc_5 = new Balloon();
                    break;
                }
                default:
                {
                    break;
                }
            }
            _loc_5.side = param2;
            if (param2 == "left")
            {
                _loc_5.x = _loc_5.x * -1;
            }
            this.level.addEnemy(_loc_5);
            this.level.helps.enemyCreated(param1);
            if (param3 != 0)
            {
                _loc_5.y = param3;
            }
            if (param4 != 0)
            {
                _loc_5.x = _loc_5.x + param4;
            }
            return _loc_5;
        }// end function

        public function dispose() : void
        {
            var _loc_1:int = 0;
            while (_loc_1 < this.waveGroups.length)
            {
                
                this.waveGroups[_loc_1].dispose();
                _loc_1++;
            }
            this.waveGroups = null;
            _loc_1 = 0;
            while (_loc_1 < this.curWaveGroups.length)
            {
                
                this.curWaveGroups[_loc_1].dispose();
                _loc_1++;
            }
            this.curWaveGroups = null;
            this.level = null;
            this.levels = null;
            this.levelsChallenge = null;
            return;
        }// end function

    }
}