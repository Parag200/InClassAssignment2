Shader "custom/overlaytextures"
{
    Properties
    { 
        _MainTex ("Main", 2D) = "white" {}
        _OverTex ("Over", 2D) = "white" {}
        _scrollX ("Scroll X", Range(-5,5)) = 1
        _scrollY ("Scroll Y", Range(-5,5)) = 1
        
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert

        

        sampler2D _MainTex;
        sampler2D _OverTex;
        float _scrollX;
        float _scrollY;

        struct Input
        {
            float2 uv_MainTex;
        };

        void surf (Input IN, inout SurfaceOutput o)
        {
            _scrollX *= _Time;
            _scrollY *= _Time;
            float3 main = (tex2D (_MainTex, IN.uv_MainTex + float2(_scrollX, _scrollY)).rgb);
            float3 over = (tex2D (_OverTex, IN.uv_MainTex + float2(_scrollX/2.0, _scrollY/2.0)).rgb);
            o.Albedo = (main + over )/2.0;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
