# Benchmark

To provide a performance comparison, the `Hyperscan`, `regexp`, `re2` and `pcre2` performance testing tools are provided here.

## Test suite

| Index | Level | Pattern |
|-------|-------|---------|
| 0 | Easy0 | ABCDEFGHIJKLMNOPQRSTUVWXYZ$ |
| 1 |Easy0i | (?i)ABCDEFGHIJklmnopqrstuvwxyz$ |
| 2 |Easy1 | A[AB]B[BC]C[CD]D[DE]E[EF]F[FG]G[GH]H[HI]I[IJ]J$ |
| 3 |Medium | [XYZ]ABCDEFGHIJKLMNOPQRSTUVWXYZ$ |
| 4 |Hard | [ -~]*ABCDEFGHIJKLMNOPQRSTUVWXYZ$ |
| 5 |Hard1 | ABCD\|CDEF\|EFGH\|GHIJ\|IJKL\|KLMN\|MNOP\|OPQR\|QRST\|STUV\|UVWX\|WXYZ |


## Golang benchmarks

The golang performance testing support `hyperscan` and `regexp` package.

```sh
$ cd go && go test -bench .
goos: darwin
goarch: arm64
pkg: github.com/izaakschroeder/gohs/bench/go
BenchmarkChimeraBlockScan/Easy0/16-10         	 2842360	       408.0 ns/op	  39.22 MB/s
BenchmarkChimeraBlockScan/Easy0/32-10         	 2794784	       429.3 ns/op	  74.54 MB/s
BenchmarkChimeraBlockScan/Easy0/1K-10         	 2390904	       500.6 ns/op	2045.44 MB/s
BenchmarkChimeraBlockScan/Easy0/32K-10        	  471826	      2488 ns/op	13168.31 MB/s
BenchmarkChimeraBlockScan/Easy0/1M-10         	   18457	     65050 ns/op	16119.56 MB/s
BenchmarkChimeraBlockScan/Easy0/32M-10        	     571	   2117889 ns/op	15843.34 MB/s
BenchmarkChimeraBlockScan/Easy0i/16-10        	 2943141	       401.1 ns/op	  39.89 MB/s
BenchmarkChimeraBlockScan/Easy0i/32-10        	 2813881	       422.4 ns/op	  75.76 MB/s
BenchmarkChimeraBlockScan/Easy0i/1K-10        	 2380371	       505.4 ns/op	2026.10 MB/s
BenchmarkChimeraBlockScan/Easy0i/32K-10       	  470028	      2564 ns/op	12781.78 MB/s
BenchmarkChimeraBlockScan/Easy0i/1M-10        	   17731	     67658 ns/op	15498.21 MB/s
BenchmarkChimeraBlockScan/Easy0i/32M-10       	     547	   2208203 ns/op	15195.35 MB/s
BenchmarkChimeraBlockScan/Easy1/16-10         	 2905996	       402.3 ns/op	  39.78 MB/s
BenchmarkChimeraBlockScan/Easy1/32-10         	 2777233	       419.6 ns/op	  76.26 MB/s
BenchmarkChimeraBlockScan/Easy1/1K-10         	 2304850	       522.9 ns/op	1958.48 MB/s
BenchmarkChimeraBlockScan/Easy1/32K-10        	  326799	      3751 ns/op	8736.18 MB/s
BenchmarkChimeraBlockScan/Easy1/1M-10         	   10000	    107346 ns/op	9768.14 MB/s
BenchmarkChimeraBlockScan/Easy1/32M-10        	     357	   3389795 ns/op	9898.66 MB/s
BenchmarkChimeraBlockScan/Medium/16-10        	 2819506	       408.5 ns/op	  39.16 MB/s
BenchmarkChimeraBlockScan/Medium/32-10        	 2822736	       426.0 ns/op	  75.12 MB/s
BenchmarkChimeraBlockScan/Medium/1K-10        	 2384019	       508.4 ns/op	2014.25 MB/s
BenchmarkChimeraBlockScan/Medium/32K-10       	  480103	      2509 ns/op	13058.43 MB/s
BenchmarkChimeraBlockScan/Medium/1M-10        	   18414	     65790 ns/op	15938.33 MB/s
BenchmarkChimeraBlockScan/Medium/32M-10       	     571	   2113945 ns/op	15872.89 MB/s
BenchmarkChimeraBlockScan/Hard/16-10          	 2885992	       403.6 ns/op	  39.64 MB/s
BenchmarkChimeraBlockScan/Hard/32-10          	 2728029	       424.1 ns/op	  75.46 MB/s
BenchmarkChimeraBlockScan/Hard/1K-10          	 2368431	       501.1 ns/op	2043.49 MB/s
BenchmarkChimeraBlockScan/Hard/32K-10         	  470995	      2487 ns/op	13178.34 MB/s
BenchmarkChimeraBlockScan/Hard/1M-10          	   18366	     65432 ns/op	16025.31 MB/s
BenchmarkChimeraBlockScan/Hard/32M-10         	     567	   2125372 ns/op	15787.56 MB/s
BenchmarkChimeraBlockScan/Hard1/16-10         	 2763266	       424.0 ns/op	  37.74 MB/s
BenchmarkChimeraBlockScan/Hard1/32-10         	 2845630	       421.6 ns/op	  75.89 MB/s
BenchmarkChimeraBlockScan/Hard1/1K-10         	 2289150	       523.1 ns/op	1957.70 MB/s
BenchmarkChimeraBlockScan/Hard1/32K-10        	  320570	      3660 ns/op	8952.39 MB/s
BenchmarkChimeraBlockScan/Hard1/1M-10         	   10000	    107726 ns/op	9733.75 MB/s
BenchmarkChimeraBlockScan/Hard1/32M-10        	     348	   3428930 ns/op	9785.69 MB/s
BenchmarkHyperscanBlockScan/Easy0/16-10       	 3279543	       366.8 ns/op	  43.62 MB/s
BenchmarkHyperscanBlockScan/Easy0/32-10       	 3065140	       386.5 ns/op	  82.79 MB/s
BenchmarkHyperscanBlockScan/Easy0/1K-10       	 2579690	       456.5 ns/op	2243.13 MB/s
BenchmarkHyperscanBlockScan/Easy0/32K-10      	  491977	      2459 ns/op	13327.00 MB/s
BenchmarkHyperscanBlockScan/Easy0/1M-10       	   18278	     65030 ns/op	16124.59 MB/s
BenchmarkHyperscanBlockScan/Easy0/32M-10      	     562	   2107668 ns/op	15920.17 MB/s
BenchmarkHyperscanBlockScan/Easy0i/16-10      	 3284186	       359.5 ns/op	  44.50 MB/s
BenchmarkHyperscanBlockScan/Easy0i/32-10      	 3140217	       377.4 ns/op	  84.79 MB/s
BenchmarkHyperscanBlockScan/Easy0i/1K-10      	 2597548	       458.6 ns/op	2232.65 MB/s
BenchmarkHyperscanBlockScan/Easy0i/32K-10     	  477657	      2523 ns/op	12985.78 MB/s
BenchmarkHyperscanBlockScan/Easy0i/1M-10      	   17692	     67606 ns/op	15510.08 MB/s
BenchmarkHyperscanBlockScan/Easy0i/32M-10     	     537	   2221155 ns/op	15106.75 MB/s
BenchmarkHyperscanBlockScan/Easy1/16-10       	 3219116	       364.6 ns/op	  43.89 MB/s
BenchmarkHyperscanBlockScan/Easy1/32-10       	 3073500	       383.7 ns/op	  83.39 MB/s
BenchmarkHyperscanBlockScan/Easy1/1K-10       	 2476158	       480.0 ns/op	2133.35 MB/s
BenchmarkHyperscanBlockScan/Easy1/32K-10      	  329983	      3657 ns/op	8960.44 MB/s
BenchmarkHyperscanBlockScan/Easy1/1M-10       	   10000	    107947 ns/op	9713.82 MB/s
BenchmarkHyperscanBlockScan/Easy1/32M-10      	     361	   3323827 ns/op	10095.12 MB/s
BenchmarkHyperscanBlockScan/Medium/16-10      	 3204662	       364.1 ns/op	  43.94 MB/s
BenchmarkHyperscanBlockScan/Medium/32-10      	 3125629	       377.1 ns/op	  84.85 MB/s
BenchmarkHyperscanBlockScan/Medium/1K-10      	 2469906	       459.0 ns/op	2230.88 MB/s
BenchmarkHyperscanBlockScan/Medium/32K-10     	  489984	      2472 ns/op	13253.76 MB/s
BenchmarkHyperscanBlockScan/Medium/1M-10      	   18318	     65763 ns/op	15944.84 MB/s
BenchmarkHyperscanBlockScan/Medium/32M-10     	     559	   2163572 ns/op	15508.81 MB/s
BenchmarkHyperscanBlockScan/Hard/16-10        	 3206080	       361.4 ns/op	  44.27 MB/s
BenchmarkHyperscanBlockScan/Hard/32-10        	 3041595	       384.9 ns/op	  83.14 MB/s
BenchmarkHyperscanBlockScan/Hard/1K-10        	 2613360	       457.2 ns/op	2239.48 MB/s
BenchmarkHyperscanBlockScan/Hard/32K-10       	  480794	      2484 ns/op	13189.92 MB/s
BenchmarkHyperscanBlockScan/Hard/1M-10        	   18412	     65865 ns/op	15920.17 MB/s
BenchmarkHyperscanBlockScan/Hard/32M-10       	     561	   2116288 ns/op	15855.33 MB/s
BenchmarkHyperscanBlockScan/Hard1/16-10       	 3047029	       381.5 ns/op	  41.94 MB/s
BenchmarkHyperscanBlockScan/Hard1/32-10       	 3159687	       374.4 ns/op	  85.48 MB/s
BenchmarkHyperscanBlockScan/Hard1/1K-10       	 2508592	       474.0 ns/op	2160.34 MB/s
BenchmarkHyperscanBlockScan/Hard1/32K-10      	  324901	      3703 ns/op	8848.11 MB/s
BenchmarkHyperscanBlockScan/Hard1/1M-10       	   10000	    107652 ns/op	9740.40 MB/s
BenchmarkHyperscanBlockScan/Hard1/32M-10      	     352	   3397724 ns/op	9875.56 MB/s
BenchmarkHyperscanStreamScan/Easy0/16-10      	 1364482	       882.3 ns/op	  18.14 MB/s
BenchmarkHyperscanStreamScan/Easy0/32-10      	 1360762	       879.9 ns/op	  36.37 MB/s
BenchmarkHyperscanStreamScan/Easy0/1K-10      	 1288128	       930.8 ns/op	1100.15 MB/s
BenchmarkHyperscanStreamScan/Easy0/32K-10     	  203466	      5680 ns/op	5769.30 MB/s
BenchmarkHyperscanStreamScan/Easy0/1M-10      	    7230	    164882 ns/op	6359.54 MB/s
BenchmarkHyperscanStreamScan/Easy0/32M-10     	     208	   5704902 ns/op	5881.68 MB/s
BenchmarkHyperscanStreamScan/Easy0i/16-10     	 1360825	       905.6 ns/op	  17.67 MB/s
BenchmarkHyperscanStreamScan/Easy0i/32-10     	 1293801	       897.3 ns/op	  35.66 MB/s
BenchmarkHyperscanStreamScan/Easy0i/1K-10     	 1273401	       946.3 ns/op	1082.06 MB/s
BenchmarkHyperscanStreamScan/Easy0i/32K-10    	  194974	      5815 ns/op	5635.50 MB/s
BenchmarkHyperscanStreamScan/Easy0i/1M-10     	    6951	    169225 ns/op	6196.35 MB/s
BenchmarkHyperscanStreamScan/Easy0i/32M-10    	     206	   5752505 ns/op	5833.01 MB/s
BenchmarkHyperscanStreamScan/Easy1/16-10      	 1355701	       908.3 ns/op	  17.62 MB/s
BenchmarkHyperscanStreamScan/Easy1/32-10      	 1252670	       922.1 ns/op	  34.70 MB/s
BenchmarkHyperscanStreamScan/Easy1/1K-10      	 1218078	       970.2 ns/op	1055.47 MB/s
BenchmarkHyperscanStreamScan/Easy1/32K-10     	  184803	      6339 ns/op	5169.49 MB/s
BenchmarkHyperscanStreamScan/Easy1/1M-10      	    6160	    185729 ns/op	5645.72 MB/s
BenchmarkHyperscanStreamScan/Easy1/32M-10     	     198	   6046726 ns/op	5549.19 MB/s
BenchmarkHyperscanStreamScan/Medium/16-10     	 1356987	       895.0 ns/op	  17.88 MB/s
BenchmarkHyperscanStreamScan/Medium/32-10     	 1340806	       906.2 ns/op	  35.31 MB/s
BenchmarkHyperscanStreamScan/Medium/1K-10     	 1229857	       964.1 ns/op	1062.16 MB/s
BenchmarkHyperscanStreamScan/Medium/32K-10    	  197692	      5829 ns/op	5621.85 MB/s
BenchmarkHyperscanStreamScan/Medium/1M-10     	    6967	    170237 ns/op	6159.50 MB/s
BenchmarkHyperscanStreamScan/Medium/32M-10    	     202	   5855365 ns/op	5730.55 MB/s
BenchmarkHyperscanStreamScan/Hard/16-10       	 1380760	       880.5 ns/op	  18.17 MB/s
BenchmarkHyperscanStreamScan/Hard/32-10       	 1365138	       881.4 ns/op	  36.31 MB/s
BenchmarkHyperscanStreamScan/Hard/1K-10       	 1270626	       930.4 ns/op	1100.56 MB/s
BenchmarkHyperscanStreamScan/Hard/32K-10      	  201950	      5632 ns/op	5817.72 MB/s
BenchmarkHyperscanStreamScan/Hard/1M-10       	    7071	    164555 ns/op	6372.21 MB/s
BenchmarkHyperscanStreamScan/Hard/32M-10      	     206	   5815721 ns/op	5769.61 MB/s
BenchmarkHyperscanStreamScan/Hard1/16-10      	 1326601	       873.1 ns/op	  18.33 MB/s
BenchmarkHyperscanStreamScan/Hard1/32-10      	 1318648	       876.8 ns/op	  36.49 MB/s
BenchmarkHyperscanStreamScan/Hard1/1K-10      	 1249376	       961.6 ns/op	1064.93 MB/s
BenchmarkHyperscanStreamScan/Hard1/32K-10     	  160732	      7268 ns/op	4508.47 MB/s
BenchmarkHyperscanStreamScan/Hard1/1M-10      	    5614	    210759 ns/op	4975.25 MB/s
BenchmarkHyperscanStreamScan/Hard1/32M-10     	     172	   6840255 ns/op	4905.44 MB/s
BenchmarkRegexpMatch/Easy0/16-10              	583653210	         2.069 ns/op	7733.04 MB/s
BenchmarkRegexpMatch/Easy0/32-10              	43715978	        27.24 ns/op	1174.61 MB/s
BenchmarkRegexpMatch/Easy0/1K-10              	 4782757	       253.7 ns/op	4035.97 MB/s
BenchmarkRegexpMatch/Easy0/32K-10             	  254482	      4738 ns/op	6915.30 MB/s
BenchmarkRegexpMatch/Easy0/1M-10              	    4993	    232248 ns/op	4514.90 MB/s
BenchmarkRegexpMatch/Easy0/32M-10             	     151	   7895461 ns/op	4249.84 MB/s
BenchmarkRegexpMatch/Easy0i/16-10             	582120768	         2.080 ns/op	7692.74 MB/s
BenchmarkRegexpMatch/Easy0i/32-10             	 2573946	       461.5 ns/op	  69.35 MB/s
BenchmarkRegexpMatch/Easy0i/1K-10             	   89430	     13353 ns/op	  76.69 MB/s
BenchmarkRegexpMatch/Easy0i/32K-10            	    2148	    554625 ns/op	  59.08 MB/s
BenchmarkRegexpMatch/Easy0i/1M-10             	      67	  17710570 ns/op	  59.21 MB/s
BenchmarkRegexpMatch/Easy0i/32M-10            	       2	 562873229 ns/op	  59.61 MB/s
BenchmarkRegexpMatch/Easy1/16-10              	572092718	         2.111 ns/op	7577.55 MB/s
BenchmarkRegexpMatch/Easy1/32-10              	47540913	        24.61 ns/op	1300.46 MB/s
BenchmarkRegexpMatch/Easy1/1K-10              	 3017740	       396.4 ns/op	2582.94 MB/s
BenchmarkRegexpMatch/Easy1/32K-10             	   65508	     18629 ns/op	1758.96 MB/s
BenchmarkRegexpMatch/Easy1/1M-10              	    1833	    648826 ns/op	1616.11 MB/s
BenchmarkRegexpMatch/Easy1/32M-10             	      57	  20602458 ns/op	1628.66 MB/s
BenchmarkRegexpMatch/Medium/16-10             	572832692	         2.104 ns/op	7605.68 MB/s
BenchmarkRegexpMatch/Medium/32-10             	 2316768	       526.0 ns/op	  60.83 MB/s
BenchmarkRegexpMatch/Medium/1K-10             	   76608	     15532 ns/op	  65.93 MB/s
BenchmarkRegexpMatch/Medium/32K-10            	    1899	    622672 ns/op	  52.62 MB/s
BenchmarkRegexpMatch/Medium/1M-10             	      58	  20677154 ns/op	  50.71 MB/s
BenchmarkRegexpMatch/Medium/32M-10            	       2	 642241166 ns/op	  52.25 MB/s
BenchmarkRegexpMatch/Hard/16-10               	572330558	         2.110 ns/op	7583.13 MB/s
BenchmarkRegexpMatch/Hard/32-10               	 1777112	       679.5 ns/op	  47.09 MB/s
BenchmarkRegexpMatch/Hard/1K-10               	   56546	     21181 ns/op	  48.35 MB/s
BenchmarkRegexpMatch/Hard/32K-10              	    1423	    844230 ns/op	  38.81 MB/s
BenchmarkRegexpMatch/Hard/1M-10               	      43	  26879978 ns/op	  39.01 MB/s
BenchmarkRegexpMatch/Hard/32M-10              	       2	 861269312 ns/op	  38.96 MB/s
BenchmarkRegexpMatch/Hard1/16-10              	  668635	      1791 ns/op	   8.93 MB/s
BenchmarkRegexpMatch/Hard1/32-10              	  343149	      3457 ns/op	   9.26 MB/s
BenchmarkRegexpMatch/Hard1/1K-10              	   10000	    107831 ns/op	   9.50 MB/s
BenchmarkRegexpMatch/Hard1/32K-10             	     298	   4017961 ns/op	   8.16 MB/s
BenchmarkRegexpMatch/Hard1/1M-10              	       8	 128459911 ns/op	   8.16 MB/s
BenchmarkRegexpMatch/Hard1/32M-10             	       1	4107635458 ns/op	   8.17 MB/s
PASS
ok  	github.com/izaakschroeder/gohs/bench/go	227.933s
```
