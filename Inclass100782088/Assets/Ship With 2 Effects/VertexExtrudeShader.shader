Shader "Custom/VertexExtrudeShader"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
     
             _Amount("Extrude", Range(0,1)) = 1
    }
        SubShader
       {


                 CGPROGRAM

                 #pragma surface surf Lambert vertex:vert


                sampler2D _MainTex;
        half _Amount;

        struct Input
        {
            float2 uv_MainTex;
        };


        struct appdata
        {
            float4 vertex: POSITION;
            float3 normal: NORMAL;
            float4 texcoord: TEXCOORD0;
       };
      

        void vert(inout appdata v)
        {
            v.vertex.xyz += v.normal * -_Amount ;
        }

        void surf (Input IN, inout SurfaceOutput o)
        {
            // Albedo comes from a texture tinted by color
            o.Albedo = tex2D (_MainTex, IN.uv_MainTex).rgb;
         
        }
        ENDCG
    }
    FallBack "Diffuse"
}
