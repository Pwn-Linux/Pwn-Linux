%global _basename LightlyShaders
%global forgeurl https://github.com/a-parhom/%{_basename}
%global commit b159684311e17812cb1a2a9da3f7d9727f3fbe3d
%global date 20240512
%forgemeta

Name:           lightlyshaders
Version:        2.2.1
Release:        2%{?dist}
Summary:        Rounded window corners and outline effect for KWin
License:        GPL-3.0
URL:            %{forgeurl}
Source:         %{forgesource}

BuildRequires:  gcc-c++
BuildRequires:  cmake
BuildRequires:  extra-cmake-modules
BuildRequires:  qt6-qtbase-private-devel

BuildRequires:  cmake(Qt6Core)
BuildRequires:  cmake(Qt6DBus)
BuildRequires:  cmake(Qt6Gui)
BuildRequires:  cmake(Qt6Network)
BuildRequires:  cmake(Qt6OpenGL)
BuildRequires:  cmake(Qt6UiTools)
BuildRequires:  cmake(Qt6Widgets)
BuildRequires:  cmake(Qt6Xml)

BuildRequires:  cmake(KF6Config)
BuildRequires:  cmake(KF6ConfigWidgets)
BuildRequires:  cmake(KF6CoreAddons)
BuildRequires:  cmake(KF6Crash)
BuildRequires:  cmake(KF6GlobalAccel)
BuildRequires:  cmake(KF6GuiAddons)
BuildRequires:  cmake(KF6I18n)
BuildRequires:  cmake(KF6KCMUtils)
BuildRequires:  cmake(KF6KIO)
BuildRequires:  cmake(KF6Notifications)
BuildRequires:  cmake(KF6Service)
BuildRequires:  cmake(KF6WidgetsAddons)
BuildRequires:  cmake(KF6WindowSystem)

BuildRequires:  cmake(KWin)
BuildRequires:  cmake(KWinDBusInterface)
BuildRequires:  cmake(KDecoration2)

BuildRequires:  pkgconfig(epoxy)
BuildRequires:  pkgconfig(wayland-server)
BuildRequires:  pkgconfig(x11)
BuildRequires:  pkgconfig(xcb)

Requires:       plasma-workspace
Requires:       kwin

%description
A simple KWin effect that simply rounds corners of windows, to do this it uses an opengl shader and is able to round any window, like mpv video for example will have rounded corners


%files
%{_libdir}/liblshelper.so.*

%{_kf6_qtplugindir}/kwin/effects/configs/kwin_lightlyshaders_blur_config.so
%{_kf6_qtplugindir}/kwin/effects/configs/kwin_lightlyshaders_config.so

%{_kf6_qtplugindir}/kwin/effects/plugins/kwin_effect_lightlyshaders.so
%{_kf6_qtplugindir}/kwin/effects/plugins/lightlyshaders_blur.so

#------------------------------------------------------------------

%prep
%forgeautosetup -p1

%build
%cmake
%cmake_build

%install
%cmake_install

%changelog
* Sun Apr 28 2024 Dipta Biswas <dabiswas112@gmail.com> - 2.2.1-1.git
- initial package

