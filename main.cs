using System;
using System.Collections.Generic;
using System.Linq;

namespace csharp
{
    public static class StringHelper
    {
        public static string Reverse(this string input)
        {
            return new string(input.ToCharArray().Reverse().ToArray());
        }
    }

    class Program
    {
        static int[] GetScores(string x, string y)
        {
            int[] scores = new int[y.Length + 1];
            int preScore = 0;
            foreach(var xc in x)
            {
                preScore = 0;
                for(int i = 0; i < y.Length; ++i)
                {
                    var yc = y[i];
                    var tmp = scores[i + 1];
                    scores[i + 1] = new int[] { xc == yc ? preScore + 1 : 0, scores[i], scores[i + 1] }.Max();
                    preScore = tmp;
                }
            }
            return scores;
        }

        static string Filter(string text, string pattern)
        {
            return text.Contains(pattern) ? pattern : string.Empty;
        }

        static string GetLCS(string x, string y)
        {
            if (x.Length == 1) return Filter(y, x);
            if (y.Length == 1) return Filter(x, y);

            int xmid = x.Length / 2;
            var topScores = GetScores(x.Substring(0, xmid), y);
            var bottomScores = GetScores(x.Substring(xmid).Reverse(), y.Reverse()).Reverse().ToArray();
            var scoresSum = topScores.Zip(bottomScores, (a, b) => a + b).ToArray();
            var maxScore = scoresSum.Max();
            int ymid = Array.IndexOf(scoresSum, maxScore);

            return maxScore == 0 ? string.Empty : GetLCS(x.Substring(0, xmid), y.Substring(0, ymid)) + GetLCS(x.Substring(xmid), y.Substring(ymid));
        }

        static void Main(string[] args)
        {
            int t = int.Parse(Console.ReadLine());
            while (t-- > 0)
            {
                var input = Console.ReadLine().Split(' ');
                Console.WriteLine(GetLCS(input[0], input[1]));
            }
        }
    }

}