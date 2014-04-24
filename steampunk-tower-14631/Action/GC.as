package 
{
    import flash.net.*;
    import flash.system.*;

    public class GC extends Object
    {

        public function GC()
        {
            return;
        }// end function

        public static function collect() : void
        {
            try
            {
                System.gc();
                new LocalConnection().connect("foo");
                new LocalConnection().connect("foo");
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

    }
}
