import ctypes as c,subprocess
from pathlib import Path
x=c.CDLL('libX11.so.6');D=c.c_void_p;W=c.c_ulong
x.XOpenDisplay.argtypes=[c.c_char_p];x.XOpenDisplay.restype=D
x.XDefaultRootWindow.argtypes=[D];x.XDefaultRootWindow.restype=W
x.XInternAtom.argtypes=[D,c.c_char_p,c.c_int];x.XInternAtom.restype=W
x.XQueryTree.argtypes=[D,W,c.POINTER(W),c.POINTER(W),c.POINTER(c.POINTER(W)),c.POINTER(c.c_uint)];x.XQueryTree.restype=c.c_int
x.XGetWindowProperty.argtypes=[D,W,W,c.c_long,c.c_long,c.c_int,W,c.POINTER(W),c.POINTER(c.c_int),c.POINTER(W),c.POINTER(W),c.POINTER(c.POINTER(c.c_ubyte))];x.XGetWindowProperty.restype=c.c_int
x.XFree.argtypes=[c.c_void_p];x.XCloseDisplay.argtypes=[D]
d=x.XOpenDisplay(None)
if not d: raise SystemExit('cannot open display')
pid=int(Path('/tmp/csgrs-synaps-ui.pid').read_text());atom=x.XInternAtom(d,b'_NET_WM_PID',0);pending=[x.XDefaultRootWindow(d)];selected=None
while pending:
    window=pending.pop();actual=W();fmt=c.c_int();count=W();remain=W();data=c.POINTER(c.c_ubyte)()
    status=x.XGetWindowProperty(d,window,atom,0,1,0,0,c.byref(actual),c.byref(fmt),c.byref(count),c.byref(remain),c.byref(data))
    owner=c.cast(data,c.POINTER(W))[0] if status==0 and data and fmt.value==32 and count.value else None
    if data:x.XFree(data)
    if owner==pid: selected=window;break
    root=W();parent=W();children=c.POINTER(W)();n=c.c_uint()
    if x.XQueryTree(d,window,c.byref(root),c.byref(parent),c.byref(children),c.byref(n)):
        pending.extend(children[i] for i in range(n.value))
    if children:x.XFree(children)
x.XCloseDisplay(d)
if selected is None: raise SystemExit('candidate window not created yet')
Path('/tmp/csgrs-synaps-ui.window').write_text(hex(selected)+'\n')
subprocess.run(['import','-window',hex(selected),'/tmp/csgrs-synaps-visual/badges.png'],check=True,timeout=20)
print('captured candidate window',hex(selected))
