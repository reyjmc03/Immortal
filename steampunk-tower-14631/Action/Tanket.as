package 
{
    import Enemy.*;
    import flash.geom.*;

    public class Tanket extends Enemy
    {

        public function Tanket()
        {
            health = 70;
            minDamage = 4;
            maxDamage = 9;
            return;
        }// end function

        override public function initialize(param1:Level) : void
        {
            infoName = "Tanket";
            armor = 2;
            money = 1200;
            modifers.sawAdd = 10;
            modifers.heavyAdd = 10;
            modifers.lightIgnore = 15;
            collideRadiuses.push(new CollideRadius(this, 0, 2, 12));
            collideRadiuses.push(new CollideRadius(this, -18, 5, 8));
            mcName = "TanketMc";
            super.initialize(param1);
            walk1 = 1;
            walk2 = 15;
            shoot1 = 16;
            shoot2 = 23;
            shootFrame = 18;
            die1 = 24;
            die2 = mcEnemy.totalFrames;
            healthY = -25;
            healthW = 35;
            stopX = Utilites.randomInt(130, 150) * scaleX;
            speed = -1.2 * scaleX;
            y = Utilites.randomNumber(180, 220);
            line = 1;
            fireEffect = "FireTanket";
            shockEffect = "ShockTanket";
            selectRct = new Rectangle(-3.75, 14.4, 68.15, 9.1);
            return;
        }// end function

    }
}
