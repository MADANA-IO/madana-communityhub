# CHANGELOG

<!--- next entry here -->

## 0.3.15-master.2
2020-11-18

### Fixes

- upload chart (0571a3f420a2930d11e3b238656e346a1cc8c797)
- updated helm package name (870d330fd2697628640a837ca5a3a81a9b70befb)

## 0.3.15-master.1
2020-10-09

### Fixes

- Merge production (c9a391d01f6b9a5c58d1dce01163804dc680b464)

## 0.3.14
2020-10-09

### Fixes

- startup delay (93fb1d804954f666a126c59c94d1a9a0f8365618)

## 0.3.13
2020-10-09

### Fixes

-  (8717fd58b19eb4f9e4eef3207fc784033f7812ae)

## 0.3.12
2020-10-09

### Fixes

- war deployment path (794f2cc6aba164019dd5cc87fb60bc41b983c368)

## 0.3.11
2020-10-09

### Fixes

- extract war to ROOT folder (f83263f868259f80af224316e0122aaa3dab8464)

## 0.3.10
2020-10-09

### Fixes

- bump version (4504ae297beb15442a5623ddd99f9669f6d0544c)

## 0.3.10-master.1
2020-10-08

### Fixes

- bump version (4504ae297beb15442a5623ddd99f9669f6d0544c)

## 0.3.9
2020-10-08

### Fixes

- DEV-1372 initial commit chart for communityhub (0dbdbbf886d969aee3d19725a5476fd44738cb97)
- mirroring images to ghcr.io instead of package registry (c3c51e35ee8c3da936f34a62027c3c56a87f9dae)
- github mirroring (5f0a180e0f71172e65bcd84a6b74a57a0fef7891)
- github mirroring (348408a52ed149e71d995bed7c47b7180c005707)
-  (7832aee01ef74845ea6bec4c74a99b66a4490811)
-  (2e998ce23a7e6e62eb168be91a49ef3bf1563dcc)
- mirroring to github (edb1d3f3e0e6e1d6a7ae35e649007d4061086e77)
- DEV-1370 livenessprobe & readinessprobe are using {{ .Values.service.containerport }} (f98a579b9cf896f87c177a86731027af1ff9fa84)
- path liveness (3f093ad6d1477293bd764166d420ba1d26a733ba)
- DEV-1349 initial commit sentry error tracking (8088d11c18cba017226c436167b997656473fd20)
- DEV-1380 Test env variables as JAVA_OPTS (38240f985f9d94181be810c442279ed35cab8edc)
- DEV-1380 env variables set are added to JAVA_OPTS (2522f807cc07e6fb313c615344646fac35f0b129)
- session affinity for CH ingress (fa9611437bb25e07d452028d240a6095736f3ceb)
-  (6f0a383fee483ebb871bd1180e30e7715aa2f2a6)
- DEV-1382 Added session cookie attribute samesite to strict. Added session cookie-change-on-failure annotation so users get redirected to other pod on failure (5d21f10115c1d56fcfbd1639acabe7311910fc76)
- session-cookie-change-on-failure as string (6337fd66aed97dd8a1ff339a96a9f1894ff21ee4)
- Requesting /faq is redirecting to external page (docs.madana.io) instead of embedding the page as iframe (781101edd052474ff4059c375cd5f0c3164f77a2)
- switch from dind to buildah (6eaccc86b495443c2daa61b398c331c256f7fa75)
- git ignore (31894a9638fdb18332ae35128d7e13cef7374be9)
- build instruction (7f21831bf04f11808230d9416fde941b380c71fd)
- copy war to docker (610da94e17be29bbdf419308fcabe8eb8a4d27ac)
- switch to buildah for mirroring (bfa72b0cc76bf59359cffbf644c7600c1486a5ac)

## 0.3.9-master.18
2020-10-08

### Fixes

- switch to buildah for mirroring (bfa72b0cc76bf59359cffbf644c7600c1486a5ac)

## 0.3.9-master.17
2020-10-08

### Fixes

- switch from dind to buildah (6eaccc86b495443c2daa61b398c331c256f7fa75)
- git ignore (31894a9638fdb18332ae35128d7e13cef7374be9)
- build instruction (7f21831bf04f11808230d9416fde941b380c71fd)
- copy war to docker (610da94e17be29bbdf419308fcabe8eb8a4d27ac)

## 0.3.9-master.16
2020-10-07

### Fixes

- Requesting /faq is redirecting to external page (docs.madana.io) instead of embedding the page as iframe (781101edd052474ff4059c375cd5f0c3164f77a2)

## 0.3.9-master.15
2020-10-07

### Fixes

- session-cookie-change-on-failure as string (6337fd66aed97dd8a1ff339a96a9f1894ff21ee4)

## 0.3.9-master.14
2020-10-07

### Fixes

- session affinity for CH ingress (fa9611437bb25e07d452028d240a6095736f3ceb)
- DEV-1382 Added session cookie attribute samesite to strict. Added session cookie-change-on-failure annotation so users get redirected to other pod on failure (5d21f10115c1d56fcfbd1639acabe7311910fc76)

## 0.3.9-master.13
2020-10-07

### Fixes

- session affinity for CH ingress (fa9611437bb25e07d452028d240a6095736f3ceb)
-  (6f0a383fee483ebb871bd1180e30e7715aa2f2a6)

## 0.3.9-master.12
2020-10-06

### Fixes

- DEV-1380 env variables set are added to JAVA_OPTS (2522f807cc07e6fb313c615344646fac35f0b129)

## 0.3.9-master.11
2020-10-06

### Fixes

- DEV-1380 Test env variables as JAVA_OPTS (38240f985f9d94181be810c442279ed35cab8edc)

## 0.3.9-master.10
2020-10-06

### Fixes

- DEV-1349 initial commit sentry error tracking (8088d11c18cba017226c436167b997656473fd20)

## 0.3.9-master.9
2020-10-06

### Fixes

- path liveness (3f093ad6d1477293bd764166d420ba1d26a733ba)

## 0.3.9-master.8
2020-10-06

### Fixes

- DEV-1370 livenessprobe & readinessprobe are using {{ .Values.service.containerport }} (f98a579b9cf896f87c177a86731027af1ff9fa84)

## 0.3.9-master.7
2020-10-06

### Fixes

- mirroring to github (edb1d3f3e0e6e1d6a7ae35e649007d4061086e77)

## 0.3.9-master.6
2020-10-06

### Fixes

-  (2e998ce23a7e6e62eb168be91a49ef3bf1563dcc)

## 0.3.9-master.5
2020-10-05

### Fixes

-  (7832aee01ef74845ea6bec4c74a99b66a4490811)

## 0.3.9-master.4
2020-10-05

### Fixes

- github mirroring (348408a52ed149e71d995bed7c47b7180c005707)

## 0.3.9-master.3
2020-10-05

### Fixes

- github mirroring (5f0a180e0f71172e65bcd84a6b74a57a0fef7891)

## 0.3.9-master.2
2020-10-05

### Fixes

- mirroring images to ghcr.io instead of package registry (c3c51e35ee8c3da936f34a62027c3c56a87f9dae)

## 0.3.9-master.1
2020-10-02

### Fixes

- DEV-1372 initial commit chart for communityhub (0dbdbbf886d969aee3d19725a5476fd44738cb97)