library(NbClust)
data(iris)
head(iris)
dim(iris)

data = iris[, -5] 

#Scaling the data --- (x - mean)/sd
normalized_data <- scale(data)
head(normalized_data)

set.seed(123)
fit =  kmeans(normalized_data, centers=3)

fit

#fit$cluster      # A vector of integers (from 1:k) indicating the cluster to which each point is allocated.
#fit$centers      # A matrix of cluster centres.
#fit$totss        # The total sum of squares.
#fit$withinss     # Vector of within-cluster sum of squares, one component per cluster.
#fit$tot.withinss # Total within-cluster sum of squares, i.e. sum(withinss).
#fit$betweenss    # The between-cluster sum of squares, i.e. totss-tot.withinss.
#fit$size         # The number of points in each cluster.
#fit$iter         # The number of (outer) iterations.

plot(iris,col = iris$Species)
plot(iris,col = fit$cluster)

Cluster_Variability <- matrix(nrow=5, ncol=1)
for (i in 1:5) Cluster_Variability[i] <- kmeans(normalized_data,centers=i, nstart=4)$tot.withinss
plot(1:5, Cluster_Variability, type="b", xlab="Number of clusters", ylab="Within groups sum of squares") 

numclust = NbClust(data, distance="euclidean",min.nc=2, max.nc=15, method="average")  

table(iris$Species,fit$cluster)