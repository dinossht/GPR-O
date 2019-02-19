function header=headerstruct(fid,j)

      header.traces= fread(fid,1,'float');
      header.position= fread(fid,1,'float');
      header.samples= fread(fid,1,'float');
      header.topo= fread(fid,1,'float');
      header.x1= fread(fid,1,'float');
      header.bytes= fread(fid,1,'float');
      header.trac_num= fread(fid,1,'float');
      header.stack= fread(fid,1,'float');
      header.window= fread(fid,1,'float');
      header.x2= fread(fid,1,'float');
      header.x3= fread(fid,1,'float');
      header.x4= fread(fid,1,'float');
      header.x5= fread(fid,1,'float');
      header.x6= fread(fid,1,'float');
      header.x_rec= fread(fid,1,'float');
      header.y_rec= fread(fid,1,'float');
      header.z_rec= fread(fid,1,'float');
      header.x_tra= fread(fid,1,'float');
      header.y_tra= fread(fid,1,'float');
      header.z_tra= fread(fid,1,'float');
      header.time_zero= fread(fid,1,'float');
      header.zero= fread(fid,1,'float');
      header.x7= fread(fid,1,'float');
      header.time= fread(fid,1,'float');
      header.x8= fread(fid,1,'float');
      header.com0= fread(fid,1,'float');
      header.com1= fread(fid,1,'float');
      header.com2= fread(fid,1,'float');
      header.com3= fread(fid,1,'float');
      header.com4= fread(fid,1,'float');
      header.com5= fread(fid,1,'float');
      header.com6= fread(fid,1,'float');
      
   