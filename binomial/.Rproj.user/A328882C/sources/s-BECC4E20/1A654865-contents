library(ggplot2)
#this function is about testing whether the input probability is valid or not. If it is invalid, stop the function and give the error message.
check_prob=function(prob){
  if (prob<=1 & prob>0) return(TRUE)
  else stop("invalid prob value")
}

#this function is about testing whether the trials are valid or not. If it is invalid, stop the function and give the error message
check_trials=function(trials){
  if (trials%%1==0 & trials>=0){
    return (TRUE)
  }
  else stop("invalid trials value")
}

#this function is about testing whether the success are valid or not. If it is invalid which means it is greater than trials or is not integer, stop the function and give the error message
check_success=function(success,trials){
  for (i in (1:length(success))){
    if (success[i]>trials) stop("success cannot be greater than trials")
  }
  if(all(success==as.integer(success))==FALSE) stop("invalid success value")
  else return (TRUE)

}

#get the mean
aux_mean=function(trials,prob){
  return (trials*prob)
}
#get the variance
aux_variance=function(trials,prob){
  return (trials*prob*(1-prob))
}
#get the mode
aux_mode=function(trials,prob){
  a=floor(trials*prob+prob)
  return (a)
}
#get the skewness
aux_skewness=function(trials,prob){
  return ((1-2*prob)/(sqrt(trials*prob*(1-prob))))
}
#get the kurtosis
aux_kurtosis=function(trials,prob){
  return ((1-6*prob*(1-prob))/(trials*prob*(1-prob)))
}

#' @title bin_choose
#' @description compute combinations in which k successes can occur in n trials
#' @param n trial numbers
#' @param k success numbers
#' @return the combination of k successes can occur in n trials
#' @export
#' @examples
#' bin_choose(n = 5, k = 2)
#' bin_choose(5, 0)
#' bin_choose(5, 1:3)
bin_choose=function(n,k){
  if (all(k<=n)) return (factorial(n)/(factorial(k)*factorial(n-k)))
  else stop("k cannot be greater than n")
}


#' @title bin_probability
#' @description get probability of k successes in n trials
#' @param success success numbers
#' @param trials trial numbers
#' @param prob success probability
#' @return the probability of k successes in n trials
#' @export
#' @examples
#' bin_probability(success = 2, trials = 5, prob = 0.5)
bin_probability=function(success,trials,prob){
  check_trials(trials)
  check_prob(prob)
  check_success(success,trials)
  return ((bin_choose(trials,success))*(prob^success)*(1-prob)^(trials-success))
}

#' @title bin_distribution
#' @description get distribution of a n trials using the probability
#' @param trials trial numbers
#' @param prob success probability
#' @return a data frame containing distribution of a n trials experiment
#' @export
#' @examples
#' dis1 <- bin_distribution(trials = 5, prob = 0.5)
#' plot(dis1)
bin_distribution=function(trials,prob){
  p=c()
  for (i in 1:(trials+1)){
    p[i]=bin_probability(i-1,trials,prob)
  }
  s=seq(0,trials)
  dataframe=data.frame(success=s,probability=p)
  class(dataframe)=append("bindis",class(dataframe))
  #dataframe=as.data.frame(dataframe)
  return (dataframe)
}


#' @export
plot.bindis=function(obj){
  library(ggplot2)
  ggplot(obj,aes(x=success,y=probability))+
  geom_bar(stat="identity")+labs(title="frequencey")+scale_x_continuous(breaks=seq(0,5,1))
#   vec <- obj[,2]
#   names(vec) <- obj[,1]
#   barplot(vec, xlab = "successes", ylab = "probability", las = 1)
}

bin=bin_distribution(trials = 5, prob = 0.5)
plot(bin)
#' @title bin_cumulative
#' @description get cumulative distribution of a n trials experiment
#' @param trials trial numbers
#' @param prob success probability
#' @return a data frame containing cumulative distribution of a n trials
#' @export
#' @examples
#' dis2 <- bin_cumulative(trials = 5, prob = 0.5)
#' plot(dis2)

bin_cumulative=function(trials,prob){
  p=c()
  cum=c()
  for (i in 1:(trials+1)){
    p[i]=bin_probability(i-1,trials,prob)
    cum[i]=sum(p)
  }
  s=seq(0,trials)
  dataframe=data.frame(success=s,probability=p,cumulative=cum)
  class(dataframe)=append("bincum",class(dataframe))
  return (dataframe)
}

# binomial cumulative distribution

#' @export
plot.bincum=function(obj){
  library(ggplot2)
  ggplot(obj,aes(x=success,y=cumulative))+
    geom_line()+geom_point(shape=1,color="black",fill="white")+labs(title="frequencey")
  #plot(x=success,y=cumulative,type="l")

}
dis2 <- bin_cumulative(trials = 5, prob = 0.5)
plot(dis2)

#' @title bin_variable
#' @description check the probability and the probability and get the list
#' @param trials trial numbers
#' @param prob success probability
#' @return a list containing trials and probability
#' @export bin_variable
#' @examples
#' bin1 <- bin_variable(trials = 10, p = 0.3)
#' binsum1 <- summary(bin1)
#' binsum1

bin_variable=function(trials,prob){
  check_prob(prob)
  check_trials(trials)
  value=list(prob=prob,trials=trials)
  class(value)="binvar"
  return(value)
  # value
}

#' @export
# print<- function (x) {
#   UseMethod("print", x)
# }
print.binvar=function(x){
  cat('"Binomial variable"',"\n")
  cat('\n')
  cat("Paramaters",'\n')
  cat(" - number of trials:",x$trials,"\n")
  cat(" - prob of success:",x$prob,'\n')
  invisible(x)
}


#' @export

summary.binvar=function(x){
  obj=list(mean=aux_mean(x$trials,x$prob),
           variance=aux_variance(x$trials,x$prob),
           mode=aux_mode(x$trials,x$prob),
           skewness=aux_skewness(x$trials,x$prob),
           kurtosis=aux_kurtosis(x$trials,x$prob))
  class(obj)="summary.binvar"
  return(obj)
  #invisible(x)
}


#' @export
print.summary.binvar=function(x){
  cat(sprintf('"Summary Binomial"'),"\n","\n")
  cat("Paramaters",'\n')
  cat("- number of trials:",x$trials,"\n")
  cat("- prob of success:",x$prob,'\n','\n')
  cat("Measures",'\n')
  cat("- mean:",x$mean,'\n')
  cat("- variance:",x$variance,'\n')
  cat("- mode:",x$mode,'\n')
  cat("- skewness:",x$skewness,'\n')
  cat("- kurtosis:",x$kurtosis,'\n')
  #invisible(x)
}


#' @title bin_mean
#' @description compute mean of a binomial
#' @param trials trial numbers
#' @param prob success probability
#' @return mean of the binomial distribution
#' @export
#' @examples
#' bin_mean(10, 0.3)
bin_mean=function(trials,prob){
  check_trials(trials)
  check_prob(prob)
  aux_mean(trials,prob)
}

#' @title bin_variance
#' @description compute variance of a binomial
#' @param trials trial numbers
#' @param prob success probability
#' @return variance of the binomial distribution
#' @export
#' @examples
#' bin_variance(10, 0.3)
bin_variance=function(trials,prob){
  check_trials(trials)
  check_prob(prob)
  aux_variance(trials,prob)
}

#' @title bin_mode
#' @description compute mode of a binomial
#' @param trials trial numbers
#' @param prob success probability
#' @return mode of the binomial distribution
#' @export
#' @examples
#' bin_mode(10, 0.3)
bin_mode=function(trials,prob){
  check_trials(trials)
  check_prob(prob)
  aux_mode(trials,prob)
}
#' @title bin_skewness
#' @description compute skewness of a binomial
#' @param trials trial numbers
#' @param prob success probability
#' @return skewness of the binomial distribution
#' @export
#' @examples
#' bin_skewness(10, 0.3)
bin_skewness=function(trials,prob){
  check_trials(trials)
  check_prob(prob)
  aux_skewness(trials,prob)
}
#' @title bin_kurtosis
#' @description compute kurtosis of a binomial
#' @param trials trial numbers
#' @param prob success probability
#' @return kurtosis of the binomial distribution
#' @export
#' @examples
#' bin_kurtosis(10, 0.3)
bin_kurtosis=function(trials,prob){
  check_trials(trials)
  check_prob(prob)
  aux_kurtosis(trials,prob)
}

