# FROM roboxes/rhel8 AS Builder 

# #Install .dotnet 5 with runtime
# WORKDIR /dotnet5
# RUN wget -O dotnet5.zip https://download.visualstudio.microsoft.com/download/pr/f35557f7-d5e1-43be-93b6-e59ee8bd823c/9dd2c25a4d7351412ff5902c355732ca/dotnet-sdk-6.0.302-linux-arm.tar.gz 
# RUN tar zxvf dotnet5.zip && \
# ls

# # RUN export DOTNET_ROOT=/dotnet5
# ENV DOTNET_ROOT=/dotnet5
# ENV PATH=${PATH}:/dotnet5

# RUN dotnet --version

# # RUN export DOTNET_ROOT=${HOME}/dotnet-50 && \
# # export PATH=${HOME}/dotnet-50:${PATH} && \
# # dotnet --version


# FROM andrewlock/dotnet-rhel:8-6.0 AS Builder

# ENV DOTNET_NOLOGO=true DOTNET_USE_POLLING_FILE_WATCHER=true NUGET_XMLDOC_MODE=skip DOTNET_URLS=http://+:5000
# ARG DOTNET_VERSION
# RUN DOTNET_VERSION=6.0 /bin/sh -c dnf install -y aspnetcore-runtime-$DOTNET_VERSION \ 
# && dotnet --info


FROM registry.access.redhat.com/ubi8/dotnet-50-runtime AS Builder
WORKDIR /project
ADD bin/Debug/net5.0 .
ENTRYPOINT ["dotnet", "customdotnet.dll"]
