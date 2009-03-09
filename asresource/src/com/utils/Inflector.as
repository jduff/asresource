/* Copyright (c) 2007 Derek Wischusen
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of 
 * this software and associated documentation files (the "Software"), to deal in 
 * the Software without restriction, including without limitation the rights to 
 * use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies 
 * of the Software, and to permit persons to whom the Software is furnished to do
 * so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE 
 * SOFTWARE.
 */


package com.utils
{
    /**
     * The Inflector class provides static methods for generating
     * the plural or singular form of a given word.
     * 
     * This class is essentially a direct port of the Inflector 
     * class in Rails (www.rubyonrails.org).
    **/

    public class Inflector
    {
        
        Inflector.init();
        
                
        private static var plurals : Array = 
        [
            [/$/, 's'],
            [/s$/i, 's'],
            [/(ax|test)is$/i, '$1es'],
            [/(octop|vir)us$/i, '$1i'],
            [/(alias|status)$/i, '$1es'],
            [/(bu)s$/i, '$1ses'],
            [/(buffal|tomat)o$/i, '$1oes'],
            [/([ti])um$/i, '$1a'],
            [/sis$/i, 'ses'],
            [/(?:([^f])fe|([lr])f)$/i, '$1$2ves'],
            [/(hive)$/i, '$1s'],
            [/([^aeiouy]|qu)y$/i, '$1ies'],
            [/(x|ch|ss|sh)$/i, '$1es'],
            [/(matr|vert|ind)ix|ex$/i, '$1ices'],
            [/([m|l])ouse$/i, '$1ice'],
            [/^(ox)$/i, '$1en'],
            [/(quiz)$/i, '$1zes']    
        ];
        
        private static var singulars : Array = 
        [
            [/s$/i, ''],
            [/(n)ews$/i, '$1ews'],
            [/([ti])a$/i, '$1um'],
            [/((a)naly|(b)a|(d)iagno|(p)arenthe|(p)rogno|(s)ynop|(t)he)ses$/i, '$1$2sis'],
            [/(^analy)ses$/i, '$1sis'],
            [/([^f])ves$/i, '$1fe'],
            [/(hive)s$/i, '$1'],
            [/(tive)s$/i, '$1'],
            [/([lr])ves$/i, '$1f'],
            [/([^aeiouy]|qu)ies$/i, '$1y'],
            [/(s)eries$/i, '$1eries'],
            [/(m)ovies$/i, '$1ovie'],
            [/(x|ch|ss|sh)es$/i, '$1'],
            [/([m|l])ice$/i, '$1ouse'],
            [/(bus)es$/i, '$1'],
            [/(o)es$/i, '$1'],
            [/(shoe)s$/i, '$1'],
            [/(cris|ax|test)es$/i, '$1is'],
            [/(octop|vir)i$/i, '$1us'],
            [/(alias|status)es$/i, '$1'],
            [/^(ox)en/i, '$1'],
            [/(vert|ind)ices$/i, '$1ex'],
            [/(matr)ices$/i, '$1ix'],
            [/(quiz)zes$/i, '$1']            
        ];
        
        private static var irregulars : Array =
        [
            ['person', 'people'],
            ['man', 'men'],
            ['child', 'children'],
            ['sex', 'sexes'],
            ['move', 'moves']    
        ];        
        
        private static var uncountable : Array =
        [
            'equipment', 'information', 'rice', 'money', 'species', 'series', 'fish', 'sheep'
        ];
        
        public static function pluralize (singular : String) : String
        {
            if (uncountable.indexOf(singular) != -1)
                return singular;
                
            var plural : String = new String();
            for each (var item : Array in plurals)
            {
                var p : String = singular.replace(item[0], item[1]);
                if (p != singular)
                    plural = p;
            }            
            return plural;
        }
        
        public static function singularize (plural : String) : String
        {
            
            if (uncountable.indexOf(plural) != -1)
                return plural;
            
            var singular : String = new String();
            for each (var item : Array in singulars)
            {
                var s : String = plural.replace(item[0], item[1]);
                if (s != plural)
                    singular = s;
            }
            return singular;
        }
        
        static private function init() : void
        {
            for each (var irr : Array in irregulars)
            {
                plurals[plurals.length] = [irr[0], irr[1]];
                singulars[singulars.length] = [irr[1], irr[0]];
            }            
        }
        
    }
}
