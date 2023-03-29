Shader "custom/WaveWaterShader"
{
    Properties
    {
        _TintColor ("Tint Color", Color) = (1,1,1,1)
        _MainTex ("Diffuse", 2D) = "white" {}
        _Freq ("Frequnecy", Range (0,5)) = 3
        _Speed ("Speed", Range (0,100)) = 10
        _Amp ("Amplitude", Range (0,1)) = 0.5


         _MainTexT("Main", 2D) = "white" {}
        _OverTex("Over", 2D) = "white" {}
        _scrollX("Scroll X", Range(-5,5)) = 1
        _scrollY("Scroll Y", Range(-5,5)) = 1
             
    }
    SubShader
    {
       
        CGPROGRAM

      
       
        #pragma surface surf Lambert vertex:vert


       
        sampler2D _OverTex;
        float _scrollX;
        float _scrollY;


        

        struct Input
        {
            float2 uv_MainTex;
            float3 vertColor;
        };

        half _Glossiness;
        half _Metallic;
        fixed4 _Color;

        float4 _TintColor;
        float _Freq;
        float _Speed;
        float _Amp;

        struct appdata
        {
            float4 vertex: POSITION;
            float3 normal: NORMAL;
            float4 texcoord:TEXCOORD0;
            float4 texcoord1: TEXCOORD1;
            float4 texcoord2: TEXCOORD2;
        };


    
       

        void vert (inout appdata v, out Input o)
        {
            UNITY_INITIALIZE_OUTPUT(Input,o);
            float t = _Time * _Speed;
            float waveHeight = sin(t * v.vertex.x * _Freq) * _Amp + sin(t*2 + v.vertex.x * _Freq*2) * _Amp;
            v.vertex.y = v.vertex.y + waveHeight;
            v.normal = normalize(float3(v.normal.x + waveHeight, v.normal.y, v.normal.z));
            o.vertColor = waveHeight + 2;
        }



        sampler2D _MainTex;
        sampler2D _MainTexT;
        void surf(Input IN, inout SurfaceOutput o)
        {
            _scrollX *= _Time;
            _scrollY *= _Time;
            float3 main = (tex2D(_MainTexT, IN.uv_MainTex + float2(_scrollX, _scrollY)).rgb);
            float3 over = (tex2D(_OverTex, IN.uv_MainTex+ float2(_scrollX / 2.0, _scrollY / 2.0)).rgb);
            o.Albedo = (main + over) / 2.0;

            //float4 c = tex2D(_MainTex, IN.uv_MainTex);
            //o.Albedo = c * IN.vertColor.rgb;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
