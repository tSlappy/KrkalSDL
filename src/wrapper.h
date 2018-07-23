#pragma once

struct CBltVert {
	FLOAT x, y, z, rhw;
	DWORD col;
	FLOAT u, v;
};

#ifdef KRKAL_SDL

#define D3DCREATE_HARDWARE_VERTEXPROCESSING 0
#define D3DCREATE_PUREDEVICE 0
#define D3DCREATE_MIXED_VERTEXPROCESSING 0
#define D3DCREATE_SOFTWARE_VERTEXPROCESSING 0
#define D3DDEVCAPS_HWTRANSFORMANDLIGHT 0
#define D3DDEVCAPS_PUREDEVICE 0
#define D3DCAPS2_CANRENDERWINDOWED 0

#define D3DERR_DEVICELOST 0
#define D3DERR_DEVICENOTRESET 0

#define D3DERR_OUTOFVIDEOMEMORY 123

#define D3DCOLOR_XRGB(r, g, b) r
#define D3DCOLOR_ARGB D3DCOLOR_XRGB

#define D3D_OK 0

struct D3DCAPS8
{
	int Caps2;
	int DevCaps;
	int MaxTextureWidth;
	int MaxTextureHeight;
};

struct D3DLOCKED_RECT
{
	int pBits;

	void LockRect(D3DLOCKED_RECT* p1, int p2, int p3) {}
	void UnlockRect() {}
};

struct D3DSURFACE_DESC
{

};

struct D3DPRESENT_PARAMETERS
{
	bool Windowed;
	int BackBufferCount;
	int MultiSampleType;
	int SwapEffect;
	int EnableAutoDepthStencil;
	int AutoDepthStencilFormat;
	HWND hDeviceWindow;
	int Flags;

	int BackBufferWidth;
	int BackBufferHeight;
	int BackBufferFormat;
	int FullScreen_PresentationInterval;
};

enum NEznamny
{
	D3DX_FILTER_NONE,
	D3DPT_TRIANGLEFAN,

	DIK_SPACE,
	D3D_SDK_VERSION,
	D3DSWAPEFFECT_DISCARD,
	D3DPRESENTFLAG_LOCKABLE_BACKBUFFER,
	D3DBACKBUFFER_TYPE_MONO,
	D3DPRESENT_INTERVAL_ONE,
	D3DPT_TRIANGLELIST,
	D3DRS_SRCBLEND,
	D3DBLEND_INVDESTCOLOR,
	D3DBLEND_SRCALPHA,
	D3DPT_TRIANGLESTRIP,
	D3DCLEAR_TARGET,
	
	
	D3DCURSOR_IMMEDIATE_UPDATE,
	D3DPT_LINELIST,
	D3DPT_POINTLIST
};

typedef struct DIRECT3DSURFACE8
{
	void GetDesc(D3DSURFACE_DESC* p1) {}
	void Release() {}
	void LockRect(D3DLOCKED_RECT* p1, int p2, int p3) {}
	void UnlockRect() {}
} *LPDIRECT3DSURFACE8, IDirect3DSurface8;

typedef struct DIRECT3DTEXTURE8
{
	void Release() {}
	void LockRect(int p1, D3DLOCKED_RECT* p2, int p3, int p4) {}
	HRESULT UnlockRect(int p1) { return 0; }
} *LPDIRECT3DTEXTURE8;

enum D3DFORMAT
{
	D3DFMT_A8R8G8B8,
	D3DFMT_R8G8B8,
	D3DFMT_X8R8G8B8,
	D3DFMT_UNKNOWN,
	D3DFMT_X1R5G5B5,
	D3DFMT_R5G6B5,
	D3DFMT_A1R5G5B5,
	D3DFMT_D16,
	D3DFMT_D24X8,
	D3DFMT_D24S8,
	D3DFMT_D24X4S4,
	D3DFMT_D32,

	D3DRTYPE_SURFACE,
	D3DUSAGE_DEPTHSTENCIL,
	D3DFMT_D15S1,
	D3DFMT_A4R4G4B4
};

/* Pool types */
typedef enum _D3DPOOL {
	D3DPOOL_DEFAULT = 0,
	D3DPOOL_MANAGED = 1,
	D3DPOOL_SYSTEMMEM = 2,

	D3DPOOL_FORCE_DWORD = 0x7fffffff
} D3DPOOL;

enum D3DMULTISAMPLE_TYPE
{
	D3DMULTISAMPLE_NONE
};

struct D3DXVECTOR4
{

};

struct D3DXVECTOR3
{

};

#define D3DCOLOR DWORD


typedef struct DIRECT3DDEVICE8
{
	void Present(int p1, int p2, int p3, int p4) {}
	void SetTexture(int p1, LPDIRECT3DTEXTURE8 p2) {}
	void DrawPrimitiveUP(int p1, int p2, CBltVert *vertices, size_t size) {}

	HRESULT Release() { return 0; }

	void GetDeviceCaps(D3DCAPS8* caps) {}

	void GetBackBuffer(int p1, NEznamny p2, LPDIRECT3DSURFACE8* p3) {}

	void ShowCursor(bool p1) {}

	HRESULT Reset(D3DPRESENT_PARAMETERS* p1) { return NULL; }

	void SetRenderState(int p1, int p2) {}
	void SetCursorPosition(int x, int y, NEznamny p3) {}

	HRESULT TestCooperativeLevel() { return 0; }

	void BeginScene() {}
	void Clear(int p1, int p2, int p3, int p4, int p5, int p6) {}
	void EndScene() {}
	HRESULT CreateImageSurface(int p1, DWORD p2, D3DFORMAT p3, LPDIRECT3DSURFACE8* p4) { return 0; }

	void LockRect(D3DLOCKED_RECT p1) {}
	void UnlockRect() {}

	HRESULT SetCursorProperties(int x, int y, LPDIRECT3DSURFACE8 p3) { return 0; }
	HRESULT CreateTexture(int p1, int p2, int p3, int p4, D3DFORMAT p5, _D3DPOOL p6, LPDIRECT3DTEXTURE8* p8) { return 0; }
	void CreateRenderTarget(int x, int y,D3DFORMAT p3, D3DMULTISAMPLE_TYPE p4, int p5, IDirect3DSurface8** p6) {}

} *LPDIRECT3DDEVICE8;



struct DIMOUSESTATE2
{
	int lX, lY;
};





typedef struct DIRECTINPUT8
{
} *LPDIRECTINPUT8;

typedef struct DIRECTINPUTDEVICE8
{
	void Acquire() {};
} *LPDIRECTINPUTDEVICE8;


enum D3DDEVTYPE
{
	D3DDEVTYPE_REF,
	D3DDEVTYPE_HAL,
	D3DDEVTYPE_SW
};

typedef struct DIRECT3DVERTEXBUFFER8
{

} *LPDIRECT3DVERTEXBUFFER8;



struct D3DADAPTER_IDENTIFIER8
{
	char* Description;
};

struct D3DDISPLAYMODE
{
	D3DFORMAT Format;
	int Width;
	int Height;
	int RefreshRate;
};



typedef struct DIRECT3D8
{
	void Release() {}
	HRESULT CreateDevice(DWORD m_dwAdapter, D3DDEVTYPE DeviceType, HWND m_hWnd, DWORD dwBehavior, D3DPRESENT_PARAMETERS* m_d3dpp, LPDIRECT3DDEVICE8* m_pd3dDevice) { return NULL;  }

	int GetAdapterCount() { return 1; }

	void GetAdapterIdentifier(int p1, int p2, D3DADAPTER_IDENTIFIER8* p3) {}
	void GetAdapterDisplayMode(int p1, D3DDISPLAYMODE* p2) {}

	int GetAdapterModeCount(int p1) { return 0; }
	void EnumAdapterModes(int p1, int p2, D3DDISPLAYMODE* p3) {}
	void GetDeviceCaps(int p1, D3DDEVTYPE p2, D3DCAPS8* p3) {}

	HRESULT CheckDeviceType(int p1, D3DDEVTYPE p2, D3DFORMAT p3, D3DFORMAT p4, int p5) { return 0; }
	HRESULT CheckDeviceFormat(int p1, D3DDEVTYPE p2, D3DFORMAT p3, D3DFORMAT p4, int p5, int p6) { return 0; }
	HRESULT CheckDepthStencilMatch(int p1, D3DDEVTYPE p2, D3DFORMAT p3, D3DFORMAT p4, int p5) { return 0; }
} *LPDIRECT3D8;





LPDIRECT3D8 Direct3DCreate8(int p1) { return NULL; }

#else
	#include <D3D8.h>
#endif
