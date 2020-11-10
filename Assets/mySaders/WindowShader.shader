Shader "MyCustomSaders/WindowShader" {
	Properties {
    _MainTex ("Базовая текстура (RGB)", 2D) = "" {}
    _TransTex ("Текстура определяющая прозрачность (RGB) Альфа (А)", 2D) = "" {}
}
SubShader { 
 LOD 100
 Tags { "QUEUE"="Transparent" "IGNOREPROJECTOR"="true" "RenderType"="Transparent" }
 Cull back
 Pass {
    Blend Zero One
  SetTexture [_TransTex] { combine texture  } 
  SetTexture [_MainTex] { combine texture, texture alpha * previous }
 } 
 Pass {
    Blend SrcColor SrcAlpha
  SetTexture [_TransTex] { combine texture  } 
  SetTexture [_MainTex] { combine texture, texture alpha * previous }
 }

}
}