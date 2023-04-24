# read the packages csv as df
df <- read.csv("R-4_2_0.csv")

# the first entry is the package and the second is the version
# install the packages with versions
for (i in 1:nrow(df)) {
  install.packages(df[i,1], version = df[i,2])
}

print("finished initial package installation")