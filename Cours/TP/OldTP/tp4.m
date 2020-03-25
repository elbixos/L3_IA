

dataset = csvread('breast-cancer-wisconsin.data')

x = dataset(:,2:end-1)
labels = x(:,end)
