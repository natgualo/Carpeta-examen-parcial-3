
#Cargamos las librerías para poder llevar a cabo las funciones
library("msa")
library("ape")
library("ggtree")
library("Biostrings")
library("treeio")

Insu<-readAAStringSet("C:/Users/nat_g/OneDrive/Escritorio/Bioinfo/Insulinas.fasta")
Insu

insu2<-readAAStringSet(c("C:/Users/nat_g/OneDrive/Escritorio/Bioinfo/Insulinas.fasta"))

insu2

#Dos alineamientos
clustal<-msa(Insu, method = c ("ClustalW"))
clustal
muscle<-msa(Insu, method = c("Muscle")) 
muscle

install.packages("seqinr")
library("seqinr")

clustal1<-msaConvert(clustal, type = "seqinr::alignment")
muscle1<-msaConvert(muscle, type = "seqinr::alignment")

#le puse esos nombre, porque me es más fácil asirgnarselos 
#de alguien o algo que me acuerde, en mi caso una boyband de K-pop
# que es NCT127 jajaja
yuta<-dist.alignment(clustal1,"identity")
Mark<-dist.alignment(muscle1, "identity")

Jungwoo<-as.matrix(yuta)
Jhony<-as.matrix(Mark)


#aqui van los arboles
#1
Taeyong<-nj (Jungwoo)
 plot(Taeyong)
 ggtree(Taeyong,color="purple", size=1, linetype="dotted")
#2
Haechan<-nj(Jhony)
plot(Haechan)
  
#Ejercicio 3
library("ggplotify")

Taeil <- ggtree(Taeyong) + geom_nodepoint(color="#b5e521", alpha=1/4, size=10)
Taeil + geom_tiplab(size=2,color="blue")

Winwin<-ggtree(Haechan, size=1, continuous = TRUE, yscale = "trait") 
Winwin
