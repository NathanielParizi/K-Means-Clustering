# K-Means-Clustering
Image segmentation using the K-Means clustering algorithm

 Image Segmentation using the Fuzzy C-Means Algorithm

Nathaniel A. Parizi
Email addresses: napari@ung.edu 
 

 
Abstract— The Fuzzy C-Means Algorithm has a useful application in a range of different fields, in this paper I present  the analysis of medical image data such as Magnetic Resonance Image scans to locate discrepancies within segmented portions of the human brain for which a tumor may be present. The method can employ a variety of machine learning algorithms to obtain useful results, this paper focuses specifically on the FCM algorithm in particular. 
Keywords— Fuzzy C-Means algorithm image segmentation, machine learning applications in the medical sciences.

I.	 INTRODUCTION
Computer algorithms have been employed to diagnose medical conditions to help better understand problems and save lives. Among them Classifier algorithms have been used to help solve these problems however there are a few Unsupervised approaches such as Cluster Analysis which have offered an advantage to the practitioner, there is no need to label data contained within the set nor training samples for which the algorithm can act on. Within the domain of Cluster Analysis are a variety of algorithms with unique characteristics, mostly popularly the K-Means and Fuzzy C-Means (FCM). In this paper I introduce a segmentation of images of MRI scans using the Fuzzy clustering as an alternative approach to using K-Means. Fuzzy Clustering allows data points to possibly belong to more than one cluster. Membership grades are assigned all given data points and dictates where data may partially belong. The rise of soft computing and data mining began with the integration of fuzzy logic. [3] The main characteristic of fuzzy clustering lies in non-unique partitioning of data into associated clusters and partial membership. The most notable Classical Fuzzy Clustering algorithms are the Fuzzy C-Means, Gustafson-Kessel, and Gath-Geva algorithms. 
The Fuzzy C-Means algorithm is very similar to the K-Means algorithm, in fact some even refer to K-means as Hard C-Means Clustering, the only difference is that FCM makes use of fuzzy logic allowing for different results in analyzing data. We first begin by obtaining the number of clusters, they will contain all member data for which data will gravitate toward with respect to their randomly assigned coefficients. This process is repeated until the algorithm is said to have converged, whereby coefficients won't change much by a given tolerance threshold. The centroids, like the K-Means algorithm also will be the center that clusters data together into their designated group, they are the average of the aggregate total points weighted by their degree belonging to specific clusters. A given point of x is assigned a set of coefficients belonging to the kth cluster wk(x). The hyper-parameter is denoted by m and dictates how fuzzy each cluster is. With a large m the cluster is said to be more fuzzy.    
 
The FCM algorithm partitions a finite sample of elements into a collection of what is referred to as c fuzzy clusters. The algorithm returns a list of centroids, cluster centers and a partitioned matrix. Thus the cycle of iterations continues till convergence when the following objective function is minimized and sufficiently satisfied to complete the algorithm. The fuzziness coefficient 'm' is a real value that is greater than integer value one. Through each iteration the membership degree and centroid vary with each update and is repeated until a given tolerance point referred to as the threshold has been met and the algorithm terminates its actions. It can also terminate if the improvements between two iterations is satisfied by a certain minimum amount.
 
Where D denotes the number of data points, N is the number of clusters, m is the fuzzy partition matrix exponent which controlling the degree of fuzzy overlap where m is greater than one. Fuzzy overlap means how ‘fuzzy’ the boundaries between each cluster is, the amount of data points that have significant membership in more than a single cluster. xi refers to the data point ith, cj  of which is the centroid of jth cluster, μij  is the degree of membership. The fcm function will perform a random initialization of cluster membership for values μij, , and calculate the cluster centers with the following:
 

And through each iteration will then update with:
  
Then after calculate the objective function Jm will continue to repeat this process till Jm improves by the less than chosen  minimum threshold or until after a chosen number of iterations[2]. 
The value that the FCM brings specifically over other clustering algorithms is that it is unsupervised and will converge, complete and terminate its iterative process. The algorithm offers low overhead in time complexity with a linear runtime O(N) with respect to number of clusters depending on code. There are methods presented which offer efficient ways to reduce the time-complexity by eliminating membership matrix if large data structures are repeatedly accessed. Depending on research, the disadvantages are that it is possible that FCM could take a long time to converge. The algorithm could also be inconveniently sensitive to outliers and other noise found in the data set for which membership degree is not needed, as well as sensitivity to local minima and speed through its iterations. Because rows and columns are mutually exclusive it is possible for clusters to form by virtue of pure coincidence which could offer both an advantage and disadvantage depending on scenario.
	Pixels within image files are correlated, they may contain RGB that will in proximity of other pixel RGB values. These characteristics help define the segmentation to which each cluster of pixels will belong ultimately resulting in the final shape. The goal is to have each pixel cluster together with likened pixels to obtain data that will reveal a segment of a brain tumor from an MRI scan. In using more clusters we can have more variety which will hopefully yield a better understanding of where the tumor may be present. The more membership towards a cluster a given data will have, the more likely it will segment into a distinguishable tumor in the image.
After each iteration the FCM algorithm will further segment each pixel toward cluster it belongs yielding the tumor. MATLAB provides FCM which performs fuzzy c-means clustering on the given data and is called with the following line:
[centers,U] = fcm(data,Nc)
After this it returns Nc (the chosen  number of clusters) cluster centers as previously described. The required inputs are as follows: U is the Fuzzy Partition Matrix, which returns Nc rows and Nd columns. Each element U(u,j) indicates the degree of membership of the given j'th data points in the i'th cluster. For a given data point, the sum of membership values for all clusters is one[1]. 
II.	EXPERIMENT IMPLEMENTATIONS AND RESULTS
In finding the segment of the image we wish to separate from the rest of the data we will utilize MATLAB’s FCM function. The process begins with the need to read the image into the MATLAB environment, we must parse the image into a double in order to successfully approximate data with decimal values, a reliance on integers won’t yield favorable results. After this process is complete we must determine the number of iterations that we may need to complete the algorithm, as mentioned earlier in the paper, it is possible that the clustering algorithm may continuously iterate beyond and undesirable time horizon and won’t necessarily yield a favorable result once it finally terminates. Once we have chosen the rate amount of iterations for the algorithm to analyze we can then move to the next step which is to obtain the size of the image, [row col x]=size();  will return our pixel data which ultimately will be used by the FCM algorithm and finally we must reshape the image so that our input for the algorithm can be successfully passed. [2] Reshape(A,sz) reshapes A using the size vector, sz, to define size(B). For example, reshape(A,[2,3]) reshapes A into a 2-by-3 matrix. sz must contain at least 2 elements, and prod(sz) must be the same as numel(A). For example,  B = reshape(A,[5,2]) which will reshape a 1-by-10 vector into a 5-by-2 matrix.
B = 5×2
	     1     6
     2     7
     3     8
     4     9
     5    10 
A specified value k will refer to the U that represents the Fuzzy partition matrix with Nc rows and Nd columns and once these steps are executed the FCM algorithm will begin to iterate through the steps as previously mentioned yielding the clusters for which each pixel data will belong to. The cluster will represent a segment whole and can vary in size depending on the threshold value. A high threshold value will strictly yield very few member data whereas low threshold value may yield a wide variety of segments for which data had been clustered to.  We will iterate through each cluster and then the data points found within the columns of our input using for loops. If the fuzzy partition matrix with Nc rows and Nd columns U(m,n) does not exceed our desired threshold, those input values will be set to zero thus becoming black and each segment can be obtained. If it is greater than our desired threshold than we can reshape the input back to the original image format and display resulting segment in MATLAB using imshow() function displaying our final output. For each cluster that has been iterated through, the corresponding image will appear in the MATLAB image window, yielding a variety of possible images for which the brain tumor can be sufficiently distinguished in the MRI scan. 
The following images were used in this analysis to perform a search one where the tumor may be located in the .jpg image file. After iterating through a variety of threshold values, it became clear that the specific value was sensitive to the quality of the resulting segmented output image. An optimal value was needed to detect a region of the brain for which the tumor would be located. Depending on research and developmental approach it may not be a significant factor however, in context of this analysis it was sensitive. The following the original images followed by  an example image of a low threshold value on the original image.

  

 

As we can see this is an undesirable result, the insensitivity of each data for which a segmented cluster may belong is not favorable in our goal of finding the isolated tumor. This screenshot was captured with a threshold value of 0.05 after the FCM algorithm completed through its iterations. If we are to increase the tolerance of the threshold value to .95 we will return again an unfavorable result shown in the following:

 

This we can see is eliminating too much structure where it is impossible to locate anything let alone the tumor. The quality can also vary depending on how many clusters have been chosen. If we are to choose too many clusters we will have a wide range of resulting segments to analyze which could convolute our findings of the tumor, and not enough clusters may result in a underfit resulting segments for which there is insufficient sample data to conclude on any findings after  analysis has been done. In this particular set of images, there were only three clusters were used and as we can see, it becomes needlessly difficult to locate any distinguishable object from the image. 
 

The optimal threshold value will vary depending on the data under analysis and the objective goal. For this specific image it seemed that approximately around .68 yielded the most optimal results allowing for a distinguishable segment of the tumor to be revealed and the algorithm to be completed within 95 iterations and the following ideal result is obtained. 
  
	
	There are many parameters, values, and conditions that must be taken under consideration during analysis with the FCM algorithm. It’s imperative that practitioners are considerate in order to successfully meet the goals of their research. 
III.	CONCLUSIONS
While Fuzzy C-Means was useful in finding the ideal segments during this analysis, it is not the only algorithm that one can employ nor may it be the most optimal. There are a variety of algorithms along with different additional models that may be incorporated into each given step. As we can see there are many possible applications for research using such technologies. The convenience of using Clustering analysis in context of this research is that we don’t need to label our data, we can indefinitely iterate till completion without the need of training data as well by virtue of the fact that clustering algorithms are entirely unsupervised. It’s expected that clustering algorithms will continue to be used and improved upon as time moves on.
 
REFERENCES

 
[1]	M. Elena, "Fuzzy C – Means Clustering in MATLAB," The 7th International Days of Statistics and Economics, Prague, 2013.
[2]	Bezdec, J.C., Pattern Recognition with Fuzzy Objective Function Algorithms, Plenum Press, New York, 1981.
[3]	R. Suganya, J.C., “Fuzzy C-Means Algorithm”, Department of CS, Dr.SNS.Rajalakshmi College of Arts & Science, 2012.
 

