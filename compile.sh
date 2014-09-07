


if [ 0 = 1 ]; then
make SOURCE=jpm-xiuxiang.tex TARGET=jpmxx-eink.pdf clean

# create PDF file for e-ink device: no margin, small size, etc.
make LTARGS="\def\usecjk{1} \def\pagewidth{120mm} \def\pageheight{180mm} \def\fnotemode{modern} \def\clinemode{horizontal} \def\pageorien{portrait} \def\margin{0.1in} \def\background{white}" SOURCE=jpm-xiuxiang.tex TARGET=jpmxx-eink.pdf jpmxx-eink.pdf

make LTARGS="\def\usecjk{1} \def\pagewidth{120mm} \def\pageheight{180mm} \def\fnotemode{modern} \def\clinemode{horizontal} \def\pageorien{portrait} \def\margin{0.1in} \def\background{white}" SOURCE=jpm-cihua.tex TARGET=jpmch-eink.pdf jpmch-eink.pdf


# normal size:
make LTARGS="\def\usecjk{1} \def\pagewidth{8in} \def\pageheight{11in} \def\fnotemode{modern} \def\clinemode{horizontal} \def\pageorien{portrait} \def\margin{0.8in} \def\background{white}" SOURCE=jpm-xiuxiang.tex TARGET=jpmxx-zhmd.pdf jpmxx-zhmd.pdf
make LTARGS="\def\usecjk{1} \def\pagewidth{8in} \def\pageheight{11in} \def\fnotemode{gezhu} \def\clinemode{vertical} \def\pageorien{portrait} \def\margin{0.8in} \def\background{white}" SOURCE=jpm-xiuxiang.tex TARGET=jpmxx-zhgz.pdf jpmxx-zhgz.pdf

make LTARGS="\def\usecjk{1} \def\pagewidth{8in} \def\pageheight{11in} \def\fnotemode{modern} \def\clinemode{horizontal} \def\pageorien{portrait} \def\margin{0.8in} \def\background{white}" SOURCE=jpm-cihua.tex TARGET=jpmch-zhmd.pdf jpmch-zhmd.pdf
make LTARGS="\def\usecjk{1} \def\pagewidth{8in} \def\pageheight{11in} \def\fnotemode{gezhu} \def\clinemode{vertical} \def\pageorien{portrait} \def\margin{0.8in} \def\background{white}" SOURCE=jpm-cihua.tex TARGET=jpmch-zhgz.pdf jpmch-zhgz.pdf

fi

rm -f test-eimd.pdf
#make LTARGS="\def\usecjk{1} \def\pagewidth{4in} \def\pageheight{5.4in} \def\fnotemode{modern} \def\clinemode{horizontal} \def\pageorien{portrait} \def\margin{0.1in} \def\background{white}" SOURCE=test.tex TARGET=test-eimd.pdf test-eimd.pdf

rm -f test-eigz.pdf
make LTARGS="\def\usecjk{1} \def\pagewidth{4in} \def\pageheight{5.4in} \def\fnotemode{gezhu} \def\clinemode{vertical} \def\pageorien{portrait} \def\margin{0.1in} \def\background{white}" SOURCE=test.tex TARGET=test-eigz.pdf test-eigz.pdf
