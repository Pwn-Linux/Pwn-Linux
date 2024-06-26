%define debug_package %{nil}
%define __os_install_post %{nil}

Name: WhiteSur-kde
Summary: WhiteSur KDE Theme

Version: {{{ git_dir_version }}}
License: GPLv3
Release: 1%{?dist}
URL:     https://github.com/vinceliuice/WhiteSur-kde
Source0: %{url}/archive/master/WhiteSur-kde-master.tar.gz

BuildArch: noarch
BuildRequires: coreutils

Requires: kvantum

%description
WhiteSur KDE theme

%prep
%setup -q -n %{name}-master

%install
AURORAE_DIR=%{buildroot}%{_datadir}/aurorae/themes
SCHEMES_DIR=%{buildroot}%{_datadir}/color-schemes
PLASMA_DIR=%{buildroot}%{_datadir}/plasma/desktoptheme
LOOKFEEL_DIR=%{buildroot}%{_datadir}/plasma/look-and-feel
LAYOUT_TEMPLATE_DIR=%{buildroot}%{_datadir}/plasma/layout-templates
PLASMOID_DIR=%{buildroot}%{_datadir}/plasma/plasmoids
KVANTUM_DIR=%{buildroot}%{_datadir}/Kvantum
WALLPAPER_DIR=%{buildroot}%{_datadir}/wallpapers
LATTE_DIR=%{buildroot}%{_datadir}/latte/config
SDDM_DIR=%{buildroot}%{_datadir}/sddm/themes

mkdir -p ${AURORAE_DIR}
mkdir -p ${SCHEMES_DIR}
mkdir -p ${PLASMA_DIR}
mkdir -p ${LOOKFEEL_DIR}
mkdir -p ${LAYOUT_TEMPLATE_DIR}
mkdir -p ${PLASMOID_DIR}
mkdir -p ${KVANTUM_DIR}
mkdir -p ${WALLPAPER_DIR}
mkdir -p ${LATTE_DIR}
mkdir -p ${SDDM_DIR}

cp -r aurorae/normal/* ${AURORAE_DIR}/
cp -r aurorae/common/assets/*.svg ${AURORAE_DIR}/WhiteSur
cp -r aurorae/common/assets/*.svg ${AURORAE_DIR}/WhiteSur_x1.25
cp -r aurorae/common/assets/*.svg ${AURORAE_DIR}/WhiteSur_x1.5
cp -r aurorae/common/assets/*.svg ${AURORAE_DIR}/WhiteSur_x1.75
cp -r aurorae/common/assets-dark/*.svg ${AURORAE_DIR}/WhiteSur-dark
cp -r aurorae/common/assets-dark/*.svg ${AURORAE_DIR}/WhiteSur-dark_x1.25
cp -r aurorae/common/assets-dark/*.svg ${AURORAE_DIR}/WhiteSur-dark_x1.5
cp -r aurorae/common/assets-dark/*.svg ${AURORAE_DIR}/WhiteSur-dark_x1.75
cp -r aurorae/sharp/* ${AURORAE_DIR}
cp -r aurorae/common/assets/*.svg ${AURORAE_DIR}/WhiteSur-sharp
cp -r aurorae/common/assets/*.svg ${AURORAE_DIR}/WhiteSur-sharp_x1.25
cp -r aurorae/common/assets/*.svg ${AURORAE_DIR}/WhiteSur-sharp_x1.5
cp -r aurorae/common/assets/*.svg ${AURORAE_DIR}/WhiteSur-sharp_x1.75
cp -r aurorae/common/assets-dark/*.svg ${AURORAE_DIR}/WhiteSur-dark-sharp
cp -r aurorae/common/assets-dark/*.svg ${AURORAE_DIR}/WhiteSur-dark-sharp_x1.25
cp -r aurorae/common/assets-dark/*.svg ${AURORAE_DIR}/WhiteSur-dark-sharp_x1.5
cp -r aurorae/common/assets-dark/*.svg ${AURORAE_DIR}/WhiteSur-dark-sharp_x1.75
cp -r aurorae/opaque/* ${AURORAE_DIR}
cp -r aurorae/common/assets/*.svg ${AURORAE_DIR}/WhiteSur-opaque
cp -r aurorae/common/assets/*.svg ${AURORAE_DIR}/WhiteSur-opaque_x1.25
cp -r aurorae/common/assets/*.svg ${AURORAE_DIR}/WhiteSur-opaque_x1.5
cp -r aurorae/common/assets/*.svg ${AURORAE_DIR}/WhiteSur-opaque_x1.75
cp -r aurorae/common/assets-dark/*.svg ${AURORAE_DIR}/WhiteSur-dark-opaque
cp -r aurorae/common/assets-dark/*.svg ${AURORAE_DIR}/WhiteSur-dark-opaque_x1.25
cp -r aurorae/common/assets-dark/*.svg ${AURORAE_DIR}/WhiteSur-dark-opaque_x1.5
cp -r aurorae/common/assets-dark/*.svg ${AURORAE_DIR}/WhiteSur-dark-opaque_x1.75
cp -r Kvantum/*                       ${KVANTUM_DIR}
cp -r color-schemes/*                 ${SCHEMES_DIR}
cp -r plasma/desktoptheme/WhiteSur*   ${PLASMA_DIR}
cp -r plasma/desktoptheme/icons       ${PLASMA_DIR}/WhiteSur
cp -r plasma/desktoptheme/icons       ${PLASMA_DIR}/WhiteSur-alt
cp -r plasma/desktoptheme/icons       ${PLASMA_DIR}/WhiteSur-dark
cp -r plasma/look-and-feel/*          ${LOOKFEEL_DIR}
cp -r plasma/layout-templates/*       ${LAYOUT_TEMPLATE_DIR}
cp -r plasma/plasmoids/*              ${PLASMOID_DIR}
cp -r wallpaper/WhiteSur              ${WALLPAPER_DIR}
cp -r latte-dock/*                    ${LATTE_DIR}
cp -r sddm/WhiteSur-6.0               ${SDDM_DIR}
cp -r sddm/preview-light.jpeg         ${SDDM_DIR}/WhiteSur-6.0/preview.jpeg
cp -r sddm/background-light.jpeg      ${SDDM_DIR}/WhiteSur-6.0/background.jpeg

%files
%{_datadir}/aurorae/themes
%{_datadir}/color-schemes
%{_datadir}/plasma/desktoptheme
%{_datadir}/plasma/look-and-feel
%{_datadir}/plasma/layout-templates
%{_datadir}/plasma/plasmoids
%{_datadir}/Kvantum
%{_datadir}/wallpapers
%{_datadir}/latte/config
%{_datadir}/sddm/themes

%changelog
{{{ git_dir_changelog }}}

